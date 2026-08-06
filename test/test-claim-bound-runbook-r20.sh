#!/bin/bash
set -e

TEST_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$TEST_DIR/.." && pwd)"
CANONICAL="$REPO_DIR/examples/runbooks/claim-bound-paper-loop.md"
REPO_PROTOCOL="$REPO_DIR/pipeline/loop-protocol.md"
CODEX_PROTOCOL="/Users/wdblink/.codex/skills/opc/pipeline/loop-protocol.md"
CLAUDE_PROTOCOL="/Users/wdblink/.claude/skills/opc/pipeline/loop-protocol.md"
MODE="${1:-}"

if [ "$#" -gt 1 ] || { [ "$#" -eq 1 ] && [ "$MODE" != "--source-only" ]; }; then
  echo "usage: $0 [--source-only]" >&2
  exit 1
fi

source "$TEST_DIR/test-helpers.sh"
setup_tmpdir

pass() { echo "  ✅ $1"; PASS=$((PASS + 1)); }
fail() { echo "  ❌ $1"; FAIL=$((FAIL + 1)); }

require_fixed() {
  local label="$1" needle="$2"
  if grep -Fq -- "$needle" "$CANONICAL"; then pass "$label"; else fail "$label"; fi
}

SEMANTIC_CLAUSES="$TMPDIR/semantic-clauses.txt"
INTAKE_CLAUSES="$TMPDIR/intake-clauses.txt"
FROZEN_CLAUSES="$TMPDIR/frozen-clauses.txt"
EXPLORATION_CLAUSES="$TMPDIR/exploration-clauses.txt"
DIAGNOSIS_CLAUSES="$TMPDIR/diagnosis-clauses.txt"
MEMORY_CLAUSES="$TMPDIR/memory-clauses.txt"
RTG01_CLAUSES="$TMPDIR/rtg01-clauses.txt"
RTG02_CLAUSES="$TMPDIR/rtg02-clauses.txt"
CONTINUITY_CLAUSES="$TMPDIR/continuity-clauses.txt"
: > "$SEMANTIC_CLAUSES"
: > "$INTAKE_CLAUSES"
: > "$FROZEN_CLAUSES"
: > "$EXPLORATION_CLAUSES"
: > "$DIAGNOSIS_CLAUSES"
: > "$MEMORY_CLAUSES"
: > "$RTG01_CLAUSES"
: > "$RTG02_CLAUSES"
: > "$CONTINUITY_CLAUSES"

require_semantic_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$SEMANTIC_CLAUSES"
}

require_intake_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$INTAKE_CLAUSES"
}

require_frozen_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$FROZEN_CLAUSES"
}

require_exploration_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$EXPLORATION_CLAUSES"
}

require_diagnosis_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$DIAGNOSIS_CLAUSES"
}

require_memory_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$MEMORY_CLAUSES"
}

require_rtg01_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$RTG01_CLAUSES"
}

require_rtg02_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$RTG02_CLAUSES"
}

require_continuity_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$CONTINUITY_CLAUSES"
}

scan_clause_file() {
  local source="$1" clause_file="$2" clause
  while IFS= read -r clause; do
    grep -Fq -- "$clause" "$source" || return 1
  done < "$clause_file"
}

scan_required_semantics() {
  scan_clause_file "$1" "$SEMANTIC_CLAUSES"
}

scan_bounded_section() {
  local source="$1" start_heading="$2" end_heading="$3" clause_file="$4" section_slice="$TMPDIR/current-bounded-section.md"
  node - "$source" "$start_heading" "$end_heading" > "$section_slice" <<'NODE' || return 1
const fs = require('fs');
const lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/);
const startHeading = process.argv[3];
const endHeading = process.argv[4];
const startIndexes = lines.flatMap((line, index) => line === startHeading ? [index] : []);
if (startIndexes.length !== 1) process.exit(1);
const endIndex = lines.indexOf(endHeading, startIndexes[0] + 1);
if (endIndex < 0) process.exit(1);
process.stdout.write(lines.slice(startIndexes[0], endIndex).join('\n'));
NODE
  scan_clause_file "$section_slice" "$clause_file"
}

scan_required_intake_semantics() {
  scan_bounded_section "$1" "## Research Intake" "## Frozen scientific frame" "$INTAKE_CLAUSES"
}

scan_required_frozen_semantics() {
  scan_bounded_section "$1" "## Frozen scientific frame" "## Exploration state and budget" "$FROZEN_CLAUSES"
}

scan_required_exploration_semantics() {
  scan_bounded_section "$1" "## Exploration state and budget" "## Research diagnosis and proposals" "$EXPLORATION_CLAUSES"
}

scan_required_diagnosis_semantics() {
  scan_bounded_section "$1" "## Research diagnosis and proposals" "## Claim ledger and evidence discipline" "$DIAGNOSIS_CLAUSES"
}

scan_required_memory_semantics() {
  scan_bounded_section "$1" "## Distilled research memory" "## RTG-01 — Frame and budget" "$MEMORY_CLAUSES"
}

scan_required_rtg01_semantics() {
  scan_bounded_section "$1" "## RTG-01 — Frame and budget" "## RTG-02 — Continue, pivot, stop, or reframe" "$RTG01_CLAUSES"
}

scan_required_rtg02_semantics() {
  scan_bounded_section "$1" "## RTG-02 — Continue, pivot, stop, or reframe" "### REFRAME signals are advisory" "$RTG02_CLAUSES"
}

scan_required_continuity_semantics() {
  scan_bounded_section "$1" "## Run continuity" "## Exact 18-position sequence" "$CONTINUITY_CLAUSES"
}

mutate_exact_clause() {
  local source="$1" destination="$2" required="$3" weakened="$4"
  node - "$source" "$destination" "$required" "$weakened" <<'NODE'
const fs = require('fs');
const source = fs.readFileSync(process.argv[2], 'utf8');
const required = process.argv[4];
const weakened = process.argv[5];
if (!source.includes(required) || source.indexOf(required) !== source.lastIndexOf(required)) process.exit(1);
fs.writeFileSync(process.argv[3], source.replace(required, weakened));
NODE
}

scan_protocol_step0() {
  node - "$1" <<'NODE'
const fs = require('fs');
const lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/);
const start = lines.findIndex((line) => line.startsWith('### Step 0 — Runbook Lookup'));
const end = lines.findIndex((line, index) => index > start && line.startsWith('### Step 0.5 —'));
if (start < 0 || end < 0) process.exit(1);
const step = lines.slice(start, end).join('\n').replace(/\s+/g, ' ');
const positions = {
  match: step.indexOf('opc-harness runbook match'),
  matchedId: step.indexOf('`runbook.id`'),
  matchedDir: step.indexOf('top-level `dir`'),
  show: step.indexOf('opc-harness runbook show "<matched-runbook-id>" --dir "<matched-runbook-dir>"'),
  applyBody: step.indexOf('Read and apply the complete returned `body`'),
  plan: step.indexOf('plan.md'),
  rtg01: step.indexOf('RTG-01'),
  p01: step.indexOf('P.01'),
  initLoop: step.indexOf('`init-loop`'),
  adopt: step.indexOf('Only after this complete body guidance has been applied may you adopt')
};
if (Object.values(positions).some((position) => position < 0)) process.exit(1);
if (!(positions.match < positions.matchedId && positions.match < positions.matchedDir)) process.exit(1);
if (!(positions.matchedId < positions.show && positions.matchedDir < positions.show)) process.exit(1);
for (const barrier of [positions.plan, positions.rtg01, positions.p01, positions.initLoop]) {
  if (!(positions.show < positions.applyBody && positions.applyBody < barrier)) process.exit(1);
}
if (!(positions.applyBody < positions.adopt)) process.exit(1);
NODE
}

assert_protocol_step0() {
  local label="$1" source="$2"
  if scan_protocol_step0 "$source"; then pass "$label"; else fail "$label"; fi
}

scan_forbidden() {
  node - "$1" <<'NODE'
const fs = require('fs');
const text = fs.readFileSync(process.argv[2], 'utf8');
const patterns = [
  /control[ -]plane/i, /\bcontroller\b/i, /\bexecution-intent\b/i,
  /\bpermit\b/i, /\bcustodian\b/i, /\bcustodied\b/i,
  /\bcapabilit(?:y|ies)\b/i, /\bACL\b/i, /\bfenc(?:e|ing)\b/i,
  /\badapter\b/i, /\bservice\b/i, /\bauthority\b/i, /\bregistry\b/i,
  /\bnonce\b/i, /\bsigned\b/i, /\bsignature\b/i, /\battestation\b/i,
  /\bcryptograph/i, /\btransaction\b/i, /reference monitor/i, /two-channel/i,
  /trust contract/i, /lifecycle schema/i, /obligation resolution/i,
  /work-envelope/i, /transition-record/i, /action-gateway/i,
  /single-driver-lease/i, /\blineage\b/i, /\bdigest\b/i,
  /<[a-z][a-z0-9-]*>/i, /\bOPC\s+(?:authenticates|authorizes|enforces)\b/i
];
const hit = patterns.find((pattern) => pattern.test(text));
if (hit) {
  console.error(`forbidden pattern ${hit} found in ${process.argv[2]}`);
  process.exit(1);
}
NODE
}

assert_json() {
  local label="$1" file="$2" expression="$3"
  if node -e "const d=require(process.argv[1]); if (!($expression)) process.exit(1)" "$file"; then
    pass "$label"
  else
    fail "$label"
  fi
}

assert_match_derived_show() {
  local label="$1" match_file="$2" show_file="$3" matched_id matched_dir
  matched_id="$(node -p "require(process.argv[1]).runbook.id" "$match_file")"
  matched_dir="$(node -p "require(process.argv[1]).dir" "$match_file")"
  if $HARNESS runbook show "$matched_id" --dir "$matched_dir" > "$show_file"; then
    assert_json "$label" "$show_file" "d.id==='claim-bound-paper-loop' && d.version===1 && d.body.includes('R20 — Research Intake and Bounded Exploration') && d.body.includes('## Research Intake') && d.body.includes('partial') && d.body.includes('missing') && d.body.includes('do not enter RTG-01 or candidate optimization')"
  else
    fail "$label"
  fi
}

echo "=== R20 source contract ==="
require_fixed "Schema v1" "version: 1"
require_fixed "stable runbook ID" "id: claim-bound-paper-loop"
require_fixed "R20 marker" "R20 — Research Intake and Bounded Exploration"
for command in "runbook match" "init-loop" "next-tick" "complete-tick"; do
  require_fixed "stock command: $command" "$command"
done
require_fixed "RTG-01 anchor" "RTG-01 — Frame and budget"
require_fixed "RTG-02 anchor" "RTG-02 — Continue, pivot, stop, or reframe"
require_fixed "REFRAME advisory anchor" "REFRAME signals are advisory"
require_fixed "RTG-03 anchor" "RTG-03 — Exact Claim authorization"
require_fixed "fixed evaluator" "evaluator and evaluation procedure"
require_fixed "fixed baseline" "baseline replay"
require_fixed "fixed mutable surface" "mutable surface"
require_fixed "independent verification" "independent evidence verification"
require_fixed "independent review" "at least two fresh independent reviewers"
require_fixed "claim ledger" "claim ledger"
require_fixed "Claim mapping" "Claim–Evidence–Limitation"
require_fixed "KEEP disposition" '`KEEP`'
require_fixed "DISCARD disposition" '`DISCARD`'
require_fixed "CRASH disposition" '`CRASH`'
require_fixed "bounded stopping" "bounded stop conditions"
require_fixed "negative history" "negative history"
require_fixed "successor or fresh run" "successor or fresh run"
require_fixed "non-enforcement sentence" "OPC records human decisions as ordinary evidence; it does not verify human identity or enforce human judgment mechanically."
require_semantic_clause "Research Intake lifecycle prerequisite" '2. Complete Research Intake once for the proposed frame. Only a `ready` result may proceed to human RTG-01, P.01, and then `init-loop`.'
require_intake_clause "Research Intake opening" 'Before RTG-01, P.01, or `init-loop`, complete one semantic Research Intake for the proposed scientific frame.'
require_intake_clause "Research Intake is ordinary evidence" "Record it as ordinary evidence; it is not a nineteenth unit, executable gate, or change to OPC behavior."
require_intake_clause "Research Intake requirements lead-in" "The intake must:"
require_intake_clause "Research Intake scans repository truth" "- scan repository truth: the current implementation, experiments, evaluators, tests, datasets, evidence artifacts, and constraints;"
require_intake_clause "Research Intake classifies readiness exactly" '- classify evaluator readiness as exactly one of `ready`, `partial`, or `missing`, without inferring or fabricating readiness when evidence is absent;'
require_intake_clause "Research Intake conditions external research" "- research related work and relevant benchmarks only when the human has approved external research; otherwise record that external research was not approved and use the available repository evidence;"
require_intake_clause "Research Intake analyzes gaps" "- analyze gaps among the research question, current baseline, evaluator, and available evidence;"
require_intake_clause "Research Intake formulates hypotheses" "- formulate falsifiable hypotheses;"
require_intake_clause "Research Intake proposes baseline replay" "- propose the baseline replay and evaluation procedure; and"
require_intake_clause "Research Intake defines mutation and failure" "- define the proposed mutable surface and explicit failure criteria."
require_intake_clause "Research Intake proposes Exploration Contract" '- propose an `Exploration Contract` naming changes the AI may make autonomously, changes forbidden inside the run, and changes requiring human RTG-02 consideration;'
require_intake_clause "Research Intake proposes Scientific Exploration Budget" '- propose a `Scientific Exploration Budget` bounding each relevant category among candidate generations, failed directions, experiment trials, literature/search calls, verifier/replay calls, retries, and scope expansion; it is not merely a token or time budget;'
require_intake_clause "versioned Optimization Contract binds complete RTG-01 envelope" 'The proposed versioned `Optimization Contract` is the envelope for RTG-01 approval. It binds the research objective/question, baseline or private proxy, evaluator/gate and acceptance policy, evidence/holdout and exact-Claim acceptance boundary, Exploration Contract as the admissible intervention space, allowed data/tools and risk boundaries, Scientific Exploration Budget, and stop conditions.'
require_intake_clause "Research Intake routing lead-in" "Route the result as follows:"
require_intake_clause "ready routes to human RTG-01" '- `ready`: record why the evaluator and evaluation procedure can replay the baseline and judge the hypotheses, then proceed to human RTG-01.'
require_intake_clause "partial and missing stop candidate work" '- `partial` or `missing`: do not enter RTG-01 or candidate optimization. End intake with an evaluator-construction plan that states the missing evaluator elements, construction and validation steps, evidence required for `ready`, and failure conditions; stop candidate work until a later Research Intake classifies the evaluator as `ready`.'
require_semantic_clause "reviewer feedback is not scientific truth" "Reviewer feedback is evidence about quality, not scientific truth."
require_semantic_clause "scientific roles remain distinct" "Evaluator output, independently replayed evidence, human direction, and exact Claim authorization are distinct facts and must remain distinguishable in the evidence artifacts."
require_semantic_clause "no sampling until PASS" "Never sample until PASS or erase failed directions."
require_semantic_clause "implementation failure classification" '- Implementation failure is `CRASH`, eligible only for a bounded diagnosed retry.'
require_semantic_clause "scientific no-improvement classification" '- Scientific no-improvement inside a valid frame is `DISCARD`, preserved as negative history.'
require_semantic_clause "suspected frame failure classification" '- Suspected frame failure is evidence for human RTG-02 consideration, never automatic `REFRAME`.'
require_semantic_clause "evaluator remains open to challenge" "Signals may prompt a human Global Frame Check but never score, trigger, block, advance, or mutate loop state automatically. Useful questions include whether progress serves the core objective, whether the evaluator still represents that objective, whether new evidence exposes a different bottleneck, and whether the research question would be chosen again today."
require_semantic_clause "RTG-03 exact Claims are independently authorized" "After independent evidence verification and Claim–Evidence–Limitation review, the human authorizes the exact Claim set allowed in the manuscript."
require_semantic_clause "RTG-03 identifies contract version and evidence" "The authorization identifies the active Optimization Contract version and exact evidence."
require_semantic_clause "RTG-03 exact Claims stay distinct from RTG-02" "RTG-03 is distinct from RTG-02: direction does not admit a Claim, and Claim approval does not redefine the frame."
require_semantic_clause "material change closes run" "A material change to the research question, evaluator, baseline, holdout, mutable surface, stop conditions, budget, or an RTG-03-authorized Claim closes the current run."
require_semantic_clause "successor run returns through intake" 'Return through Research Intake before a successor or fresh run; only a `ready` result may proceed to a new RTG-01, with preserved negative history.'
require_semantic_clause "unchanged frame continues run" "An unchanged frame may continue the current run."
printf '%s\n' "A material change to the research question, evaluator, baseline, holdout, mutable surface, stop conditions, budget, or an RTG-03-authorized Claim closes the current run." >> "$CONTINUITY_CLAUSES"
printf '%s\n' 'Return through Research Intake before a successor or fresh run; only a `ready` result may proceed to a new RTG-01, with preserved negative history.' >> "$CONTINUITY_CLAUSES"
require_semantic_clause "P.01 freezes Optimization Contract version" '1. **P.01 — spec:** after a `ready` Research Intake, freeze the active Optimization Contract version, including its Exploration Contract and Scientific Exploration Budget, and obtain RTG-01.'
require_semantic_clause "P.02 performs diagnosis and proposal" '2. **P.02 — design:** perform the research diagnosis and proposal chain, then design the evidence and Claim–Evidence–Limitation structure.'
require_semantic_clause "P.03 preregisters exploration budget" '3. **P.03 — plan:** preregister Task Scope, unit checks, Scientific Exploration Budget, and stop conditions.'
require_semantic_clause "P.04 implements admitted intervention" '4. **P.04 — build:** implement only the admitted intervention, update Exploration State and staged-report evidence, and add candidate evidence and claim-ledger entries.'
require_semantic_clause "P.06 updates Exploration State from replay" '6. **P.06 — e2e-verify:** independently assign KEEP, DISCARD, or CRASH from replayed evidence and update Exploration State.'
require_semantic_clause "P.12 distills contextual lessons" '12. **P.12 — e2e-verify:** admit research-stage evidence and distill contextual lessons while preserving raw history.'
require_semantic_clause "P.13 binds RTG-03 to active contract" '13. **P.13 — acceptance:** obtain RTG-03 for the exact Claim set against the active Optimization Contract version and exact evidence.'

require_frozen_clause "active Optimization Contract version is frozen" "- the active Optimization Contract version;"
require_frozen_clause "frozen Exploration Contract" "- the approved Exploration Contract;"
require_frozen_clause "frozen Scientific Exploration Budget" "- the approved Scientific Exploration Budget;"
require_frozen_clause "evidence and reports identify active contract version" "Every evidence artifact and staged report identifies the active Optimization Contract version."

require_exploration_clause "Exploration State is ordinary evidence" "Exploration State is ordinary evidence, not a new unit, schema, or runtime mechanism."
require_exploration_clause "Exploration State records directions and remaining budget" "It records active, narrowed, activated, archived, and discarded directions with rationale, evidence, remaining uncertainty, and category-level remaining Scientific Exploration Budget."
require_exploration_clause "AI executes only explicitly autonomous changes" "The AI may prioritize, narrow, execute, or archive only changes that the frozen Exploration Contract explicitly marks autonomous, only within the current active direction and Scientific Exploration Budget; it may not switch the active direction."
require_exploration_clause "human PIVOT owns RTG-required direction switch" 'A human `PIVOT` switches the active direction for an in-contract change explicitly marked RTG-required.'
require_exploration_clause "forbidden and expanding changes are unavailable" 'Forbidden or contract-expanding changes are unavailable in the current run and may only be considered through `REFRAME`.'
require_exploration_clause "exploration actions debit category before start" "Every applicable exploration action—candidate generation, failed-direction use, experiment trial, approved literature/search call, verifier/replay call, retry, or scope-expansion attempt—debits its frozen category before it starts."
require_exploration_clause "exhausted category cannot start and converges" 'An action cannot start when its applicable category is exhausted; exhaustion stops that category and yields `STOP` or a human RTG-02 choice among still-budgeted in-contract options.'
require_exploration_clause "budget increase or reallocation follows REFRAME" 'Increasing or reallocating frozen budget is a material Optimization Contract amendment and follows `REFRAME`, Research Intake, and a new RTG-01.'

require_diagnosis_clause "ordered diagnosis and proposal chain" "Before each candidate intervention, observe the evidence/objective gap, attribute affected components or root cause, propose a direction, compare it with current state, metrics/evidence, and Distilled research memory, then ground one admissible intervention."
require_diagnosis_clause "P.02 diagnoses and P.04 implements admitted intervention" "P.02 performs this research and diagnosis; P.04 implements only the admitted intervention."
require_diagnosis_clause "human suggestion is proposal not command" "A human suggestion is a candidate proposal, not an immediate command, unless recorded as a formal RTG decision."
require_diagnosis_clause "human suggestion enters admissibility chain" "It enters the same comparison and admissibility chain."

require_memory_clause "raw research evidence and rationale are preserved" "Preserve raw accepted, rejected, and crashed evidence plus human rationale."
require_memory_clause "distilled lessons remain contextual priors" "Derive contextual lessons with source links, context, applicability limits, confidence, and known regressions; use them only as priors for proposal comparison, never as evaluator output or scientific truth."

require_rtg01_clause "RTG-01 approves active Optimization Contract version" 'Before `init-loop`, the human approves one Optimization Contract version, including its Exploration Contract, Scientific Exploration Budget, and stop conditions.'
require_rtg01_clause "RTG-01 records active contract version" "Record that active version and decision as ordinary evidence alongside the frozen frame."

require_rtg02_clause "staged report precedes RTG-02" "Before RTG-02, produce a staged report compressing work tried since the last report, signal/evidence change, diagnosis and attribution, budget consumed and remaining, unresolved uncertainty, candidate directions, and the concrete human decision requested."
require_rtg02_clause "human rationale attaches without per-experiment approval" "Attach later human discussion and rationale to that report; this staged review does not require approval for every experiment."
require_rtg02_clause "PIVOT is human RTG-required direction switch" '- `PIVOT` is the human RTG-02 decision that switches the active direction for an in-contract change marked RTG-required; the Optimization Contract and frozen frame remain unchanged, and the work remains inside the current run.'
require_rtg02_clause "REFRAME proposes a new contract version" '- `REFRAME` proposes a new Optimization Contract version, including any changed Exploration Contract, rather than mutating in-run State; it closes the current run and returns through Research Intake before a successor or fresh run and new RTG-01.'

require_continuity_clause "evaluator changes require validation and replay" 'An evaluator/gate change requires a separate validation path and baseline replay before a new Research Intake may classify the proposed Optimization Contract `ready`.'

if scan_required_semantics "$CANONICAL"; then pass "all document-wide semantic clauses present"; else fail "all document-wide semantic clauses present"; fi
if scan_required_intake_semantics "$CANONICAL"; then pass "all Research Intake clauses are inside the Intake section"; else fail "all Research Intake clauses are inside the Intake section"; fi
if scan_required_frozen_semantics "$CANONICAL"; then pass "Exploration Contract and Budget are frozen-frame clauses"; else fail "Exploration Contract and Budget are frozen-frame clauses"; fi
if scan_required_exploration_semantics "$CANONICAL"; then pass "all Exploration State clauses are inside the state section"; else fail "all Exploration State clauses are inside the state section"; fi
if scan_required_diagnosis_semantics "$CANONICAL"; then pass "diagnosis and proposals are inside their ordered section"; else fail "diagnosis and proposals are inside their ordered section"; fi
if scan_required_memory_semantics "$CANONICAL"; then pass "distilled memory clauses are inside the memory section"; else fail "distilled memory clauses are inside the memory section"; fi
if scan_required_rtg01_semantics "$CANONICAL"; then pass "RTG-01 approves and records the contract version"; else fail "RTG-01 approves and records the contract version"; fi
if scan_required_rtg02_semantics "$CANONICAL"; then pass "staged reporting and human direction ownership are inside RTG-02"; else fail "staged reporting and human direction ownership are inside RTG-02"; fi
if scan_required_continuity_semantics "$CANONICAL"; then pass "evaluator change validation is inside run continuity"; else fail "evaluator change validation is inside run continuity"; fi

if node - "$CANONICAL" <<'NODE'
const fs = require('fs');
const lines = fs.readFileSync(process.argv[2], 'utf8').split(/\r?\n/);
const intakeHeading = '## Research Intake';
const frozenHeading = '## Frozen scientific frame';
const explorationHeading = '## Exploration state and budget';
const diagnosisHeading = '## Research diagnosis and proposals';
const claimHeading = '## Claim ledger and evidence discipline';
const memoryHeading = '## Distilled research memory';
const rtg01Heading = '## RTG-01 — Frame and budget';
const intakeIndexes = lines.flatMap((line, index) => line === intakeHeading ? [index] : []);
if (intakeIndexes.length !== 1) process.exit(1);
const frozenIndex = lines.indexOf(frozenHeading);
if (frozenIndex < 0 || intakeIndexes[0] >= frozenIndex) process.exit(1);
const explorationIndexes = lines.flatMap((line, index) => line === explorationHeading ? [index] : []);
const diagnosisIndexes = lines.flatMap((line, index) => line === diagnosisHeading ? [index] : []);
const claimIndex = lines.indexOf(claimHeading);
const memoryIndexes = lines.flatMap((line, index) => line === memoryHeading ? [index] : []);
const rtg01Index = lines.indexOf(rtg01Heading);
if (explorationIndexes.length !== 1 || diagnosisIndexes.length !== 1 || memoryIndexes.length !== 1) process.exit(1);
if (!(frozenIndex < explorationIndexes[0] && explorationIndexes[0] < diagnosisIndexes[0] && diagnosisIndexes[0] < claimIndex && claimIndex < memoryIndexes[0] && memoryIndexes[0] < rtg01Index)) process.exit(1);
const opening = lines[intakeIndexes[0] + 2] || '';
const rtgIndex = opening.indexOf('RTG-01');
const p01Index = opening.indexOf('P.01');
const initIndex = opening.indexOf('`init-loop`');
if (rtgIndex < 0 || p01Index <= rtgIndex || initIndex <= p01Index) process.exit(1);
const positions = lines.filter((line) => /^\d+\. \*\*P\.\d{2} —/.test(line));
if (positions.length !== 18) process.exit(1);
for (let index = 0; index < positions.length; index += 1) {
  const position = String(index + 1).padStart(2, '0');
  if (!positions[index].startsWith(`${index + 1}. **P.${position} —`)) process.exit(1);
}
NODE
then
  pass "Research Intake, Exploration State, and exact position structure"
else
  fail "Research Intake, Exploration State, and exact position structure"
fi

if scan_forbidden "$CANONICAL"; then pass "forbidden vocabulary absent"; else fail "forbidden vocabulary absent"; fi

MUTATED="$TMPDIR/mutated.md"
cp "$CANONICAL" "$MUTATED"
printf '\naction-gateway\n' >> "$MUTATED"
if scan_forbidden "$MUTATED" >/dev/null 2>&1; then
  fail "mutation proves deny scanner is live"
else
  pass "mutation proves deny scanner is live"
fi

SEMANTIC_MUTATED="$TMPDIR/semantic-mutated.md"
node - "$CANONICAL" "$SEMANTIC_MUTATED" <<'NODE'
const fs = require('fs');
const source = process.argv[2];
const destination = process.argv[3];
const lines = fs.readFileSync(source, 'utf8').split(/\r?\n/);
const intakeIndex = lines.indexOf('## Research Intake');
const frozenIndex = lines.indexOf('## Frozen scientific frame', intakeIndex + 1);
const routeIndex = lines.indexOf('Route the result as follows:', intakeIndex + 1);
const partialIndex = lines.findIndex((line, index) => index > routeIndex && line.startsWith('- `partial` or `missing`:'));
if (intakeIndex < 0 || frozenIndex < 0 || routeIndex < 0 || partialIndex < 0 || partialIndex >= frozenIndex) process.exit(1);
const routingBlock = lines.splice(routeIndex, partialIndex - routeIndex + 1);
lines.push('', '## Relocated routing test fixture', '', ...routingBlock);
fs.writeFileSync(destination, lines.join('\n'));
NODE
if scan_clause_file "$SEMANTIC_MUTATED" "$INTAKE_CLAUSES"; then
  pass "relocation mutation preserves every Intake clause document-wide"
else
  fail "relocation mutation preserves every Intake clause document-wide"
fi
if scan_required_intake_semantics "$SEMANTIC_MUTATED"; then
  fail "section-bound scanner rejects relocated Intake routing"
else
  pass "section-bound scanner rejects relocated Intake routing"
fi

OPTIMIZATION_MUTATED="$TMPDIR/optimization-contract-mutated.md"
node - "$CANONICAL" "$OPTIMIZATION_MUTATED" <<'NODE'
const fs = require('fs');
const source = fs.readFileSync(process.argv[2], 'utf8');
const required = 'The proposed versioned `Optimization Contract` is the envelope for RTG-01 approval. It binds the research objective/question, baseline or private proxy, evaluator/gate and acceptance policy, evidence/holdout and exact-Claim acceptance boundary, Exploration Contract as the admissible intervention space, allowed data/tools and risk boundaries, Scientific Exploration Budget, and stop conditions.';
const weakened = 'The proposed versioned `Optimization Contract` is the envelope for RTG-01 approval. It binds the research objective/question, Exploration Contract, Scientific Exploration Budget, and stop conditions.';
fs.writeFileSync(process.argv[3], source.includes(required) ? source.replace(required, weakened) : source);
NODE
if scan_required_intake_semantics "$OPTIMIZATION_MUTATED"; then
  fail "Optimization Contract mutation rejects incomplete envelope"
else
  pass "Optimization Contract mutation rejects incomplete envelope"
fi

EXPLORATION_MUTATED="$TMPDIR/exploration-mutated.md"
node - "$CANONICAL" "$EXPLORATION_MUTATED" <<'NODE'
const fs = require('fs');
const source = fs.readFileSync(process.argv[2], 'utf8');
const required = 'The AI may prioritize, narrow, execute, or archive only changes that the frozen Exploration Contract explicitly marks autonomous, only within the current active direction and Scientific Exploration Budget; it may not switch the active direction.';
const weakened = 'The AI may prioritize, narrow, execute, or archive changes autonomously inside the frozen Exploration Contract and Scientific Exploration Budget.';
fs.writeFileSync(process.argv[3], source.includes(required) ? source.replace(required, weakened) : source);
NODE
if scan_required_exploration_semantics "$EXPLORATION_MUTATED"; then
  fail "Exploration State mutation rejects ambiguous autonomy ownership"
else
  pass "Exploration State mutation rejects ambiguous autonomy ownership"
fi

DEBIT_MUTATED="$TMPDIR/exploration-debit-mutated.md"
node - "$CANONICAL" "$DEBIT_MUTATED" <<'NODE'
const fs = require('fs');
const source = fs.readFileSync(process.argv[2], 'utf8');
const required = 'Every applicable exploration action—candidate generation, failed-direction use, experiment trial, approved literature/search call, verifier/replay call, retry, or scope-expansion attempt—debits its frozen category before it starts.';
const weakened = 'Every applicable exploration action records its frozen budget category.';
fs.writeFileSync(process.argv[3], source.includes(required) ? source.replace(required, weakened) : source);
NODE
if scan_required_exploration_semantics "$DEBIT_MUTATED"; then
  fail "budget mutation rejects missing pre-start debit"
else
  pass "budget mutation rejects missing pre-start debit"
fi

EXHAUSTION_MUTATED="$TMPDIR/exploration-exhaustion-mutated.md"
node - "$CANONICAL" "$EXHAUSTION_MUTATED" <<'NODE'
const fs = require('fs');
const source = fs.readFileSync(process.argv[2], 'utf8');
const required = 'An action cannot start when its applicable category is exhausted; exhaustion stops that category and yields `STOP` or a human RTG-02 choice among still-budgeted in-contract options.';
const weakened = 'Category exhaustion is recorded before `STOP` or a human RTG-02 choice among in-contract options.';
fs.writeFileSync(process.argv[3], source.includes(required) ? source.replace(required, weakened) : source);
NODE
if scan_required_exploration_semantics "$EXHAUSTION_MUTATED"; then
  fail "budget mutation rejects action start after exhaustion"
else
  pass "budget mutation rejects action start after exhaustion"
fi

PIVOT_MUTATED="$TMPDIR/pivot-ownership-mutated.md"
mutate_exact_clause "$CANONICAL" "$PIVOT_MUTATED" \
  '- `PIVOT` is the human RTG-02 decision that switches the active direction for an in-contract change marked RTG-required; the Optimization Contract and frozen frame remain unchanged, and the work remains inside the current run.' \
  '- `PIVOT` is an AI decision that switches the active direction for an in-contract change marked RTG-required after human RTG-02 discussion; the Optimization Contract and frozen frame remain unchanged, and the work remains inside the current run.'
if scan_required_rtg02_semantics "$PIVOT_MUTATED"; then
  fail "PIVOT mutation rejects non-human RTG-required direction ownership"
else
  pass "PIVOT mutation rejects non-human RTG-required direction ownership"
fi

BUDGET_AMENDMENT_MUTATED="$TMPDIR/budget-amendment-mutated.md"
mutate_exact_clause "$CANONICAL" "$BUDGET_AMENDMENT_MUTATED" \
  'Increasing or reallocating frozen budget is a material Optimization Contract amendment and follows `REFRAME`, Research Intake, and a new RTG-01.' \
  'Increasing or reallocating frozen budget may continue inside the current run; `REFRAME`, Research Intake, and a new RTG-01 can follow after the reallocation.'
mutate_exact_clause "$BUDGET_AMENDMENT_MUTATED" "$BUDGET_AMENDMENT_MUTATED" \
  'A material change to the research question, evaluator, baseline, holdout, mutable surface, stop conditions, budget, or an RTG-03-authorized Claim closes the current run.' \
  'A material change to the research question, evaluator, baseline, holdout, mutable surface, stop conditions, budget, or an RTG-03-authorized Claim may continue in the current run before it closes.'
mutate_exact_clause "$BUDGET_AMENDMENT_MUTATED" "$BUDGET_AMENDMENT_MUTATED" \
  'Return through Research Intake before a successor or fresh run; only a `ready` result may proceed to a new RTG-01, with preserved negative history.' \
  'A successor or fresh run may proceed before Research Intake; a new RTG-01 and a later `ready` result may follow, with preserved negative history.'
BUDGET_EXPLORATION_REJECTED=0
BUDGET_CONTINUITY_REJECTED=0
if ! scan_required_exploration_semantics "$BUDGET_AMENDMENT_MUTATED"; then BUDGET_EXPLORATION_REJECTED=1; fi
if ! scan_required_continuity_semantics "$BUDGET_AMENDMENT_MUTATED"; then BUDGET_CONTINUITY_REJECTED=1; fi
if [ "$BUDGET_EXPLORATION_REJECTED" -eq 1 ] && [ "$BUDGET_CONTINUITY_REJECTED" -eq 1 ]; then
  pass "budget amendment mutation enforces REFRAME through Intake and new RTG-01"
else
  fail "budget amendment mutation enforces REFRAME through Intake and new RTG-01"
fi

DIAGNOSIS_ORDER_MUTATED="$TMPDIR/diagnosis-order-mutated.md"
mutate_exact_clause "$CANONICAL" "$DIAGNOSIS_ORDER_MUTATED" \
  'Before each candidate intervention, observe the evidence/objective gap, attribute affected components or root cause, propose a direction, compare it with current state, metrics/evidence, and Distilled research memory, then ground one admissible intervention.' \
  'Before each candidate intervention, ground one admissible intervention, then observe the evidence/objective gap, attribute affected components or root cause, propose a direction, and compare it with current state, metrics/evidence, and Distilled research memory.'
mutate_exact_clause "$DIAGNOSIS_ORDER_MUTATED" "$DIAGNOSIS_ORDER_MUTATED" \
  'P.02 performs this research and diagnosis; P.04 implements only the admitted intervention.' \
  'P.04 implements the admitted intervention first; P.02 performs this research and diagnosis afterward.'
if scan_required_diagnosis_semantics "$DIAGNOSIS_ORDER_MUTATED"; then
  fail "diagnosis mutation rejects intervention before attribution and admission"
else
  pass "diagnosis mutation rejects intervention before attribution and admission"
fi

HUMAN_PROPOSAL_MUTATED="$TMPDIR/human-proposal-mutated.md"
mutate_exact_clause "$CANONICAL" "$HUMAN_PROPOSAL_MUTATED" \
  'A human suggestion is a candidate proposal, not an immediate command, unless recorded as a formal RTG decision.' \
  'A human suggestion is a candidate proposal and an immediate command; no formal RTG decision is required.'
if scan_required_diagnosis_semantics "$HUMAN_PROPOSAL_MUTATED"; then
  fail "human-proposal mutation rejects immediate command without formal RTG"
else
  pass "human-proposal mutation rejects immediate command without formal RTG"
fi

STAGED_REPORT_MUTATED="$TMPDIR/staged-report-mutated.md"
node - "$CANONICAL" "$STAGED_REPORT_MUTATED" <<'NODE'
const fs = require('fs');
const source = fs.readFileSync(process.argv[2], 'utf8');
const required = 'Before RTG-02, produce a staged report compressing work tried since the last report, signal/evidence change, diagnosis and attribution, budget consumed and remaining, unresolved uncertainty, candidate directions, and the concrete human decision requested.';
const weakened = 'After RTG-02, produce a staged report compressing work tried since the last report, signal/evidence change, diagnosis, budget consumed, uncertainty, candidate directions, and the human decision requested.';
if (!source.includes(required) || source.indexOf(required) !== source.lastIndexOf(required)) process.exit(1);
fs.writeFileSync(process.argv[3], source.replace(required, weakened) + `\n\n## Relocated staged-report fixture\n\n${required}\n`);
NODE
if scan_clause_file "$STAGED_REPORT_MUTATED" "$RTG02_CLAUSES" && ! scan_required_rtg02_semantics "$STAGED_REPORT_MUTATED"; then
  pass "staged-report mutation rejects incomplete or relocated pre-RTG-02 report"
else
  fail "staged-report mutation rejects incomplete or relocated pre-RTG-02 report"
fi

EVALUATOR_CHANGE_MUTATED="$TMPDIR/evaluator-change-mutated.md"
mutate_exact_clause "$CANONICAL" "$EVALUATOR_CHANGE_MUTATED" \
  'An evaluator/gate change requires a separate validation path and baseline replay before a new Research Intake may classify the proposed Optimization Contract `ready`.' \
  'An evaluator/gate change requires a separate validation path and baseline replay; a new Research Intake may classify the proposed Optimization Contract `ready` before either is complete.'
if scan_required_continuity_semantics "$EVALUATOR_CHANGE_MUTATED"; then
  fail "evaluator-change mutation requires validation and baseline replay before ready"
else
  pass "evaluator-change mutation requires validation and baseline replay before ready"
fi

MEMORY_SCOPE_MUTATED="$TMPDIR/contextual-memory-mutated.md"
mutate_exact_clause "$CANONICAL" "$MEMORY_SCOPE_MUTATED" \
  'Derive contextual lessons with source links, context, applicability limits, confidence, and known regressions; use them only as priors for proposal comparison, never as evaluator output or scientific truth.' \
  'Derive contextual lessons with source links, context, optional applicability limits, confidence, and known regressions; use them as priors for proposal comparison that may override evaluator output as scientific truth.'
if scan_required_memory_semantics "$MEMORY_SCOPE_MUTATED"; then
  fail "memory mutation rejects decontextualized lessons as evaluator truth"
else
  pass "memory mutation rejects decontextualized lessons as evaluator truth"
fi

assert_protocol_step0 "repository Step 0 consumes matched runbook body before planning" "$REPO_PROTOCOL"

PROTOCOL_MUTATED="$TMPDIR/loop-protocol-mutated.md"
node - "$REPO_PROTOCOL" "$PROTOCOL_MUTATED" <<'NODE'
const fs = require('fs');
const source = fs.readFileSync(process.argv[2], 'utf8');
const mutated = source
  .split(/\r?\n/)
  .filter((line) => !line.includes('opc-harness runbook show "<matched-runbook-id>" --dir "<matched-runbook-dir>"'))
  .filter((line) => !line.includes('Read and apply the complete returned `body`'))
  .join('\n');
fs.writeFileSync(process.argv[3], mutated);
NODE
if scan_protocol_step0 "$PROTOCOL_MUTATED"; then
  fail "Step-0 mutation proves show/body scanner is live"
else
  pass "Step-0 mutation proves show/body scanner is live"
fi

mkdir -p "$TMPDIR/runbooks"
cp "$CANONICAL" "$TMPDIR/runbooks/claim-bound-paper-loop.md"

echo "=== R20 CLI fixtures ==="
$HARNESS runbook list --dir "$TMPDIR/runbooks" > "$TMPDIR/list.json"
assert_json "list contract" "$TMPDIR/list.json" "d.count===1 && d.runbooks[0].id==='claim-bound-paper-loop' && d.runbooks[0].version===1 && d.runbooks[0].title==='Claim-Bound Paper Research Loop' && d.runbooks[0].tier==='functional' && JSON.stringify(d.runbooks[0].match)===JSON.stringify(['自动写论文研究闭环','论文研究闭环自动化','claim-bound paper loop','claim bound paper loop','claim-bound research paper loop','claim bound research paper loop'])"
assert_json "exact 18-unit array" "$TMPDIR/list.json" "JSON.stringify(d.runbooks[0].units)===JSON.stringify(['spec','design','plan','build','test-design','e2e-verify','review','fix','test-design','e2e-verify','review','e2e-verify','acceptance','build','test-design','e2e-verify','review','e2e-verify'])"

$HARNESS runbook show claim-bound-paper-loop --dir "$TMPDIR/runbooks" > "$TMPDIR/show.json"
assert_json "show ID and R20 body" "$TMPDIR/show.json" "d.id==='claim-bound-paper-loop' && d.version===1 && d.body.includes('R20 — Research Intake and Bounded Exploration') && d.body.includes('## Research Intake')"

$HARNESS runbook match "run a claim-bound paper loop" --dir "$TMPDIR/runbooks" > "$TMPDIR/match-en.json"
assert_json "English positive match" "$TMPDIR/match-en.json" "d.matched===true && d.runbook.id==='claim-bound-paper-loop'"
assert_match_derived_show "English match-derived show reaches R20 body" "$TMPDIR/match-en.json" "$TMPDIR/match-show-en.json"

$HARNESS runbook match "自动写论文研究闭环" --dir "$TMPDIR/runbooks" > "$TMPDIR/match-zh.json"
assert_json "Chinese positive match" "$TMPDIR/match-zh.json" "d.matched===true && d.runbook.id==='claim-bound-paper-loop'"
assert_match_derived_show "Chinese match-derived show reaches R20 body" "$TMPDIR/match-zh.json" "$TMPDIR/match-show-zh.json"

set +e
$HARNESS runbook match "write a generic article" --dir "$TMPDIR/runbooks" > "$TMPDIR/match-none.json"
MISS_STATUS=$?
set -e
if [ "$MISS_STATUS" -eq 3 ]; then pass "negative match exits 3"; else fail "negative match exits 3 (got $MISS_STATUS)"; fi
assert_json "negative match payload" "$TMPDIR/match-none.json" "d.matched===false && d.score===0 && d.runbook===null"

if [ "$MODE" != "--source-only" ]; then
  echo "=== Installed-copy identity ==="
  if cmp -s "$CANONICAL" /Users/wdblink/.opc/runbooks/claim-bound-paper-loop.md; then pass "~/.opc copy is byte-identical"; else fail "~/.opc copy is byte-identical"; fi
  if cmp -s "$CANONICAL" /Users/wdblink/.claude/skills/opc/examples/runbooks/claim-bound-paper-loop.md; then pass "Claude copy is byte-identical"; else fail "Claude copy is byte-identical"; fi

  echo "=== Installed-directory CLI ==="
  $HARNESS runbook list --dir /Users/wdblink/.opc/runbooks > "$TMPDIR/installed-list.json"
  assert_json "installed list resolves Schema v1 and stable ID" "$TMPDIR/installed-list.json" "d.runbooks.some((runbook) => runbook.id==='claim-bound-paper-loop' && runbook.version===1)"

  $HARNESS runbook show claim-bound-paper-loop --dir /Users/wdblink/.opc/runbooks > "$TMPDIR/installed-show.json"
  assert_json "installed show resolves R20 Research Intake" "$TMPDIR/installed-show.json" "d.id==='claim-bound-paper-loop' && d.version===1 && d.body.includes('R20 — Research Intake and Bounded Exploration') && d.body.includes('## Research Intake')"

  $HARNESS runbook match "run a claim-bound paper loop" --dir /Users/wdblink/.opc/runbooks > "$TMPDIR/installed-match-en.json"
  assert_json "installed English match resolves Schema v1 and stable ID" "$TMPDIR/installed-match-en.json" "d.matched===true && d.runbook.id==='claim-bound-paper-loop' && d.runbook.version===1"
  assert_match_derived_show "installed English match-derived show reaches R20 body" "$TMPDIR/installed-match-en.json" "$TMPDIR/installed-match-show-en.json"

  $HARNESS runbook match "自动写论文研究闭环" --dir /Users/wdblink/.opc/runbooks > "$TMPDIR/installed-match-zh.json"
  assert_json "installed Chinese match resolves Schema v1 and stable ID" "$TMPDIR/installed-match-zh.json" "d.matched===true && d.runbook.id==='claim-bound-paper-loop' && d.runbook.version===1"
  assert_match_derived_show "installed Chinese match-derived show reaches R20 body" "$TMPDIR/installed-match-zh.json" "$TMPDIR/installed-match-show-zh.json"

  echo "=== Installed protocol semantics ==="
  assert_protocol_step0 "Codex Step 0 consumes matched runbook body before planning" "$CODEX_PROTOCOL"
  assert_protocol_step0 "Claude Step 0 consumes matched runbook body before planning" "$CLAUDE_PROTOCOL"
fi

print_results
