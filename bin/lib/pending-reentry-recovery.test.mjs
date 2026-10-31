import { after, test } from "node:test";
import assert from "node:assert/strict";
import { spawnSync } from "node:child_process";
import { createHash } from "node:crypto";
import {
  existsSync, lstatSync, mkdirSync, mkdtempSync, readFileSync, readdirSync,
  readlinkSync, realpathSync, rmSync, writeFileSync,
} from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";
import { fileURLToPath } from "node:url";

const HARNESS = fileURLToPath(new URL("../opc-harness.mjs", import.meta.url));
const DEFAULT_PHASE = "recovery";
const roots = [];
const evidence = [];
const digest = value => createHash("sha256").update(value).digest("hex");

after(() => {
  if (process.env.OPC_RECOVERY_TEST_EVIDENCE) {
    writeFileSync(process.env.OPC_RECOVERY_TEST_EVIDENCE, JSON.stringify(evidence, null, 2) + "\n");
  }
  for (const root of roots) rmSync(root, { recursive: true, force: true });
});

function cli(fx, command, args = []) {
  const argv = [HARNESS, command, ...args, "--dir", fx.session];
  const result = spawnSync(process.execPath, argv, { cwd: fx.root, encoding: "utf8", timeout: 10_000 });
  evidence.push({ fixture: fx.name, argv, status: result.status, stdout: result.stdout, stderr: result.stderr });
  assert.ifError(result.error);
  assert.equal(result.status, 0, result.stderr || result.stdout);
  return JSON.parse(result.stdout.trim().split("\n").at(-1));
}

function snapshot(root) {
  const entries = [];
  function visit(path, name) {
    const stat = lstatSync(path);
    if (stat.isSymbolicLink()) entries.push([name, "symlink", readlinkSync(path)]);
    else if (stat.isDirectory()) {
      entries.push([name, "directory"]);
      for (const child of readdirSync(path).sort()) visit(join(path, child), name + "/" + child);
    } else entries.push([name, "file", digest(readFileSync(path))]);
  }
  visit(root, ".");
  return entries;
}

function readOnly(fx, command, args = []) {
  const before = snapshot(fx.root);
  const result = cli(fx, command, args);
  const after = snapshot(fx.root);
  evidence.push({ fixture: fx.name, command, before: digest(JSON.stringify(before)), after: digest(JSON.stringify(after)) });
  assert.deepEqual(after, before, command + " must not change fixture paths, types, or bytes");
  return result;
}

function validate(fx, phase) {
  return readOnly(fx, "validate-chain", phase ? ["--phase", phase] : []);
}

function fixture(name, atBuild = true) {
  const root = realpathSync(mkdtempSync(join(tmpdir(), "opc-pending-reentry-")));
  roots.push(root);
  const fx = { root, session: join(root, "session"), name };
  const flowFile = join(root, "flow.json");
  writeFileSync(flowFile, JSON.stringify({
    opc_compat: ">=0.0",
    nodes: ["start", "build", "bridge"],
    edges: { start: { PASS: "build" }, build: { PASS: null, FAIL: "bridge" }, bridge: { PASS: "build" } },
    nodeTypes: { start: "build", build: "build", bridge: "build" },
    limits: { maxLoopsPerEdge: 6, maxTotalSteps: 16, maxNodeReentry: 6 },
  }, null, 2) + "\n");
  const result = cli(fx, "init", ["--flow-file", flowFile, "--tier", "functional"]);
  assert.equal(result.created, true, JSON.stringify(result));
  if (atBuild) {
    seal(fx, "start", 1);
    move(fx, "start", "build", "PASS");
  }
  return fx;
}

function seal(fx, node, ordinal) {
  const runDir = join(fx.session, "nodes", node, "run_" + ordinal);
  mkdirSync(runDir, { recursive: true });
  writeFileSync(join(runDir, "output.md"), "# Native artifact for " + node + " run " + ordinal + "\n");
  writeFileSync(join(runDir, "build-report.json"), JSON.stringify({ node, run: ordinal }) + "\n");
  const result = cli(fx, "seal", ["--node", node]);
  assert.equal(result.sealed, true, JSON.stringify(result));
}

function move(fx, from, to, verdict) {
  const result = cli(fx, "transition", ["--from", from, "--to", to, "--verdict", verdict]);
  assert.equal(result.allowed, true, JSON.stringify(result));
  return result;
}

function reenter(fx, ordinal) {
  seal(fx, "build", ordinal);
  move(fx, "build", "bridge", "FAIL");
  seal(fx, "bridge", ordinal);
  const result = move(fx, "bridge", "build", "PASS");
  assert.equal(result.runId, "run_" + (ordinal + 1));
}

function pendingThirdRun(name) {
  const fx = fixture(name);
  reenter(fx, 1);
  reenter(fx, 2);
  assert.equal(existsSync(join(fx.session, "nodes", "build", "run_3", "handshake.json")), false);
  return fx;
}

test("initial pending run recovers read-only but explicit complete rejects it", () => {
  const fx = fixture("initial", false);
  const recovery = validate(fx, "recovery");
  assert.equal(recovery.valid, true, JSON.stringify(recovery));
  const complete = validate(fx, "complete");
  assert.equal(complete.valid, false, JSON.stringify(complete));
  assert.match(complete.errors.join("\n"), /start.*run_1/);
});

test("the existing package default phase stays unchanged", () => {
  const result = validate(fixture("default", false));
  assert.equal(result.valid, DEFAULT_PHASE === "recovery", JSON.stringify(result));
});

test("a newly selected node recovers while its complete validation rejects", () => {
  const fx = fixture("new-current");
  const recovery = validate(fx, "recovery");
  assert.equal(recovery.valid, true, JSON.stringify(recovery));
  const complete = validate(fx, "complete");
  assert.equal(complete.valid, false, JSON.stringify(complete));
  assert.match(complete.errors.join("\n"), /build.*run_1/);
});

test("pending reentry validates the preceding completed canonical run", () => {
  const fx = fixture("pending-reentry");
  reenter(fx, 1);
  const path = join(fx.session, "nodes", "build", "handshake.json");
  assert.equal(JSON.parse(readFileSync(path, "utf8")).runId, "run_1");
  assert.equal(existsSync(join(fx.session, "nodes", "build", "run_2", "handshake.json")), false);
  const recovery = validate(fx, "recovery");
  assert.equal(recovery.valid, true, JSON.stringify(recovery));
});

test("pending reentry cannot complete, leave, or finalize using the old canonical run", () => {
  const fx = fixture("pending-reentry-rejection");
  reenter(fx, 1);
  const complete = validate(fx, "complete");
  assert.equal(complete.valid, false, JSON.stringify(complete));
  assert.match(complete.errors.join("\n"), /build.*run_2/);
  const leave = readOnly(fx, "transition", ["--from", "build", "--to", "bridge", "--verdict", "FAIL"]);
  assert.equal(leave.allowed, false, JSON.stringify(leave));
  assert.match(leave.reason, /run_2|exact|selected run/);
  const finalize = readOnly(fx, "finalize");
  assert.equal(finalize.finalized, false, JSON.stringify(finalize));
  assert.match(finalize.error, /run_2|exact|selected run/);
  assert.equal(readOnly(fx, "finalize", ["--strict"]).finalized, false);
});

test("sealing the current run restores both recovery and complete validation", () => {
  const fx = pendingThirdRun("after-current-seal");
  seal(fx, "build", 3);
  for (const phase of ["recovery", "complete"]) {
    const result = validate(fx, phase);
    assert.equal(result.valid, true, JSON.stringify(result));
  }
  const path = join(fx.session, "nodes", "build", "handshake.json");
  assert.equal(JSON.parse(readFileSync(path, "utf8")).runId, "run_3");
});

test("an invalid phase is rejected without changing the fixture", () => {
  const result = validate(fixture("invalid-phase", false), "unexpected");
  assert.equal(result.valid, false, JSON.stringify(result));
  assert.match(result.errors.join("\n"), /phase.*recovery.*complete/);
});

test("a missing old run of the current node is not excused by pending reentry", () => {
  const fx = pendingThirdRun("missing-old-run");
  rmSync(join(fx.session, "nodes", "build", "run_1", "handshake.json"));
  const result = validate(fx, "recovery");
  assert.equal(result.valid, false, JSON.stringify(result));
  assert.match(result.errors.join("\n"), /build.*run_1/);
});

test("a corrupt old exact handshake remains invalid during recovery", () => {
  const fx = pendingThirdRun("corrupt-old-run");
  writeFileSync(join(fx.session, "nodes", "build", "run_1", "handshake.json"), "{");
  const result = validate(fx, "recovery");
  assert.equal(result.valid, false, JSON.stringify(result));
  assert.match(result.errors.join("\n"), /build.*run_1/);
});

test("a damaged preceding canonical summary is still validated", () => {
  const fx = pendingThirdRun("damaged-canonical");
  const path = join(fx.session, "nodes", "build", "handshake.json");
  const canonical = JSON.parse(readFileSync(path, "utf8"));
  assert.equal(canonical.runId, "run_2");
  canonical.summary = "damaged canonical summary";
  writeFileSync(path, JSON.stringify(canonical, null, 2) + "\n");
  const result = validate(fx, "recovery");
  assert.equal(result.valid, false, JSON.stringify(result));
  assert.match(result.errors.join("\n"), /build\/run_2.*(?:canonical|projection)/);
});

test("a missing old artifact remains invalid during recovery", () => {
  const fx = pendingThirdRun("old-artifact-missing");
  rmSync(join(fx.session, "nodes", "build", "run_1", "build-report.json"));
  const result = validate(fx, "recovery");
  assert.equal(result.valid, false, JSON.stringify(result));
  assert.match(result.errors.join("\n"), /build.*run_1/);
});
