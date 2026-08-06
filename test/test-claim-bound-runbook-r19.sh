#!/bin/bash
set -e

TEST_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_DIR="$(cd "$TEST_DIR/.." && pwd)"
CANONICAL="$REPO_DIR/examples/runbooks/claim-bound-paper-loop.md"
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
: > "$SEMANTIC_CLAUSES"

require_semantic_clause() {
  local label="$1" needle="$2"
  require_fixed "$label" "$needle"
  printf '%s\n' "$needle" >> "$SEMANTIC_CLAUSES"
}

scan_required_semantics() {
  local source="$1" clause
  while IFS= read -r clause; do
    grep -Fq -- "$clause" "$source" || return 1
  done < "$SEMANTIC_CLAUSES"
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

echo "=== R19 source contract ==="
require_fixed "Schema v1" "version: 1"
require_fixed "stable runbook ID" "id: claim-bound-paper-loop"
require_fixed "R19 marker" "R19 — Native OPC Loop"
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
require_semantic_clause "reviewer feedback is not scientific truth" "Reviewer feedback is evidence about quality, not scientific truth."
require_semantic_clause "scientific roles remain distinct" "Evaluator output, independently replayed evidence, human direction, and exact Claim authorization are distinct facts and must remain distinguishable in the evidence artifacts."
require_semantic_clause "no sampling until PASS" "Never sample until PASS or erase failed directions."
require_semantic_clause "evaluator remains open to challenge" "Signals may prompt a human Global Frame Check but never score, trigger, block, advance, or mutate loop state automatically. Useful questions include whether progress serves the core objective, whether the evaluator still represents that objective, whether new evidence exposes a different bottleneck, and whether the research question would be chosen again today."
require_semantic_clause "RTG-03 exact Claims stay distinct from RTG-02" "After independent evidence verification and Claim–Evidence–Limitation review, the human authorizes the exact Claim set allowed in the manuscript. RTG-03 is distinct from RTG-02: direction does not admit a Claim, and Claim approval does not redefine the frame."
require_semantic_clause "material change closes run" "A material change to the research question, evaluator, baseline, holdout, mutable surface, stop conditions, budget, or an RTG-03-authorized Claim closes the current run. Continue through a successor or fresh run with preserved negative history and a new RTG-01. An unchanged frame may continue the current run."

if scan_required_semantics "$CANONICAL"; then pass "all normative semantic clauses present"; else fail "all normative semantic clauses present"; fi

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
sed 's/Never sample until PASS/Never stop sampling at PASS/' "$CANONICAL" > "$SEMANTIC_MUTATED"
if scan_required_semantics "$SEMANTIC_MUTATED"; then
  fail "mutation proves semantic scanner is live"
else
  pass "mutation proves semantic scanner is live"
fi

mkdir -p "$TMPDIR/runbooks"
cp "$CANONICAL" "$TMPDIR/runbooks/claim-bound-paper-loop.md"

echo "=== R19 CLI fixtures ==="
$HARNESS runbook list --dir "$TMPDIR/runbooks" > "$TMPDIR/list.json"
assert_json "list contract" "$TMPDIR/list.json" "d.count===1 && d.runbooks[0].id==='claim-bound-paper-loop' && d.runbooks[0].version===1 && d.runbooks[0].tier==='functional'"
assert_json "exact 18-unit array" "$TMPDIR/list.json" "JSON.stringify(d.runbooks[0].units)===JSON.stringify(['spec','design','plan','build','test-design','e2e-verify','review','fix','test-design','e2e-verify','review','e2e-verify','acceptance','build','test-design','e2e-verify','review','e2e-verify'])"

$HARNESS runbook show claim-bound-paper-loop --dir "$TMPDIR/runbooks" > "$TMPDIR/show.json"
assert_json "show ID and R19 body" "$TMPDIR/show.json" "d.id==='claim-bound-paper-loop' && d.body.includes('R19 — Native OPC Loop')"

$HARNESS runbook match "run a claim-bound paper loop" --dir "$TMPDIR/runbooks" > "$TMPDIR/match-en.json"
assert_json "English positive match" "$TMPDIR/match-en.json" "d.matched===true && d.runbook.id==='claim-bound-paper-loop'"

$HARNESS runbook match "自动写论文研究闭环" --dir "$TMPDIR/runbooks" > "$TMPDIR/match-zh.json"
assert_json "Chinese positive match" "$TMPDIR/match-zh.json" "d.matched===true && d.runbook.id==='claim-bound-paper-loop'"

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
fi

print_results
