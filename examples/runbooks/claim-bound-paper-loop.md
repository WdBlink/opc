---
version: 1
id: claim-bound-paper-loop
title: Claim-Bound Paper Research Loop
match:
  - 自动写论文研究闭环
  - 论文研究闭环自动化
  - claim-bound paper loop
  - claim bound paper loop
  - claim-bound research paper loop
  - claim bound research paper loop
tier: functional
units:
  - spec
  - design
  - plan
  - build
  - test-design
  - e2e-verify
  - review
  - fix
  - test-design
  - e2e-verify
  - review
  - e2e-verify
  - acceptance
  - build
  - test-design
  - e2e-verify
  - review
  - e2e-verify
protocolRefs:
  - discussion-protocol.md
  - implementer-prompt.md
  - test-design-protocol.md
  - executor-protocol.md
  - role-evaluator-prompt.md
---
# Claim-Bound Paper Research Loop

Use only for an automated research-and-paper loop whose claims are bounded by independently verified evidence and explicit human Claim authority. It is not for an ordinary article, generic paper draft, non-paper benchmark, extraction loop, or scheduler task. A match score is discovery evidence, never execution authorization.

The target is a replayable authorized claim set. Manuscript quality and simulated-review score are inner-loop signals, not scientific truth, external acceptance, or release authority.

## Task-intent adoption gate

After lexical runbook match but before materialization, session creation, initialization, trust binding, or capability issuance, an independently custodied `<execution-intent-validator>` must issue a signed `<execution-intent-permit>`. It binds the exact task digest, runbook ID/version, an affirmative request to execute an automated claim-bound paper-research loop, permitted research/scope boundaries, validator identity/policy, and confirmation identity when human confirmation is required. Match score or matched text never supplies this permit.

Negated, definitional, quoted, translation-only, comparison-only, audit-only, or review-only intent downgrades a lexical hit to suggestion/no-adoption: diagnostics may return this runbook, but no plan, session, initialization, registry, lease, claim/recovery/probe capability, or scientific action may start. An ambiguous bare phrase also remains suggestion-only until explicit human confirmation is validated into the permit. The permit digest is immutable in the adoption header, P.01/P.12/P.18, family registry, admissions, run closure, and every successor carry-forward; mismatch, absence, revocation, scope expansion, or task-digest drift stops before execution.

## Trust boundary and runtime bindings

- **Deli inner generation/repair:** Literature Survey, Structure & Logic, Experiment Design, Figures & Tables, and simulated Peer Review generate candidates and route weaknesses.
- **Outer control:** an independently custodied verifier recomputes
  evidence; fresh independent reviewers audit
  Claim–Evidence–Limitation alignment; authenticated human RTG /
  Claim authority selects direction, may reframe the governing
  research problem at RTG-02, and authorizes exact claims.
  REFRAME is a human disposition only.

Before P.01, bind `<research-brief>`, `<mutable-surface>`, `<evaluator-contract>`, `<evaluator-digest>`, `<evidence-contract>`, `<holdout-contract>`, `<baseline-replay-package>`, `<failure-taxonomy>`, `<independent-verifier>`, `<independent-reviewers>`, `<rtg-authority>`, `<claim-authority>`, and `<stop-contract>`.

Bind `<claim-ledger-contract>` only—not research claims. It fixes schema/canonicalization version, stable claim-ID policy, allowed status transitions, ledger authority, canonical claim-projection algorithm/version, and empty/genesis ledger digest. It also freezes a versioned inventory of every claim-bearing surface: title, abstract, headings, body, equations, tables and cells, captions, axes, legends, callouts, footnotes, appendices, supplementary artifacts, and any other textual, visual, or quantitative surface. Every assertion receives a stable surface/location ID and maps to exactly one authorized claim plus required limitation or fails closed. P.04 creates the first non-empty snapshot.

Bind `<execution-intent-validator>`, `<receipt-validator>`, `<digest-validator>`, `<admission-validator>`, `<manuscript-claim-extractor>`, `<action-gateway>`, `<position-dispatch-adapter>`, `<loop-transition-adapter>`, `<backlog-disposition-adapter>`, `<nonpass-closure-adapter>`, `<p07-backlog-intake-capability>`, `<obligation-resolution-schema>`, `<validated-handler-map>`, and `<validator-trust-contract>`. For every verifier/validator/extractor/gateway/adapter/handler and every capability/schema issuer the trust contract freezes identity/key/version, executable or model digest, policy/config digest, independent custodian outside actor-writable context, deterministic allowed inputs, phase/discriminator field allowlists, output signature/attestation, output write protection, and verification procedure. Generator/reviewer/verifier/admission/operator/scheduler/dispatch processes cannot select or supply these actors. Every admission and RTG receipt binds these identity/code/policy digests.

Bind stable `<research-family-id>` to RTG-01, research brief/question/direction, evaluator, holdout, ledger genesis, and stop contract. Bind separately trusted `<lineage-authority>` identity/key/policy inside `<validator-trust-contract>`. It owns one append-only family effort registry that atomically issues globally unique action/attempt/invocation sequence numbers and run nonces, records every run open/close and every action input/output/status plus applicable candidate/evidence/full-ledger/projection/manuscript digests, rejects duplicate genesis/counters, sibling issuance, and concurrent active children, and signs `<registry-head-digest>`. Negative, abandoned, discarded, and crashed results remain in the registry; a winner-only manifest is invalid.

Bind RTG-01/evaluator-approved `<effort-budget-contract>` inside `<stop-contract>`. It defines typed counters and ceilings for candidate-generation calls/branches, experiment executions/trials, claim-affecting literature/search calls, Deli repair iterations, Deli simulation/regression iterations, external verifier/extractor invocations, outer-review/evaluator invocations, fresh runs, and CRASH retries. `<rework-limit>` and `<crash-retry-budget>` are typed ceilings within that contract, not separate untracked allowances.

`<action-gateway>` is the independently custodied reference monitor for every metered backend: model/candidate sampler, literature/search provider, experiment executor, Deli action runner, external verifier/extractor, and outer reviewer service. Before a backend runs, lineage authority issues a single-use capability containing the unique family action sequence/nonce; gateway validates and consumes it exactly once, executes the backend, and automatically appends input/output/status and applicable digests to the registry. Generator/reviewer credentials, processes, tools, and network routes cannot reach alternate backends; gateway attests egress/tool containment. If mediation or containment cannot be proved, stop.

P.04, P.08, and P.14 `<attempt-manifest>` files and all review manifests are derived and signed by gateway+registry+custodian, never generator/reviewer self-report. Evaluator correction and stop rules consume them. Unregistered work, a missing result, reused capability, sequence/counter gap, incomplete negative history, typed-ceiling exhaustion, containment failure, or manifest/registry mismatch fails closed. Admissions bind gateway identity/key/policy and containment attestation.

Before the first verifier invocation freeze replay seed, environment/container digest, dependencies, hardware policy, and input order. Fresh runs and every in-place verifier/extractor invocation or CRASH retry consume the same family effort registry; each receives a unique action sequence and signed result, including CRASH. Identical-input nondeterminism or exhaustion closes the family fail-closed rather than sampling until PASS.

`<prior-run-chain>` is optional for the family genesis attempt and mandatory thereafter; it contains parent run ID, closure digest, complete negative tuple/review history, current registry head, and the lineage-authority-issued attempt/run identities. Bind `<single-driver-lease>` when the native owner gate is degraded: an independent custodian outside generator context exclusively acquires/releases the unique session, signs the lease, and records it in validator trust, registry, and run closure.

Fail closed if intent/trust/containment/custody/digests/signatures fail; if an actor can invoke protected transitions, mutate backlog/lineage, or mint capabilities; if two-channel records mismatch; if any actionable/warning/uncertain admission/release finding—including one from a future producer—lacks immediate origin and complete discovery intake; if an origin references future set/repair/gate fields or any placeholder/predicted/null future digest; if repair precedes origin/set, gate precedes repair, phases are laundered, discovery manifest is incomplete, or current/successor set omits any open/new ID; if a P.06/P.10 carry manifest is missing/non-total, an open ID is downgraded to discard prose, or KEEP with any per-ID defect reaches review/admission; if P.07 ID is NOOPed, routed only, repaired on wrong surface, omitted, or hidden by aggregate PASS; if P.07 backlog intake lacks the single-use joint transaction, exact append mapping, both-or-neither commit, or idempotent recovery; if P.12/P.18 new zero-ID defect takes empty generic fresh-run; if resolution uses the wrong set kind/digest/location, cross-kind relabeling, aggregate mutation, or duplicate capability; if reviewer nondeterminism is erased; if partition/subset/complement changes; if applicable records are missing/duplicate/unclassified/FAIL/CRASH under global PASS; if resolution lacks admission PASS and validated arm manifest; if concurrent/manual/bulk mutation occurs; or if terminal/full-chain/no-fork/lease/effort proofs fail.

## Human RTG-02 frame reorientation

### RTG-02 human-handoff boundary

Before any action that would scale resource commitment, initiate a
structural pivot, or materially change the research brief, question,
direction, evaluator, baseline contract, holdout, stop bindings, or
authorized effort, the existing RTG-02 human authorization must be
obtained.

Without a valid RTG-02 receipt, the proposed scope-expanding or
frame-changing action must not proceed.

Ordinary bounded work under unchanged bindings and budget continues
through the existing R17 loop without a new human decision.

The human may request an RTG-02 Global Frame Check at any time.

### PIVOT vs REFRAME

- `PIVOT` changes the direction or method within the current research
  problem and governing frame.

- `REFRAME` questions whether the research problem, primary
  contradiction, evaluator proxy, product or research philosophy,
  or definition of useful progress is still correctly framed.

`REFRAME` is an authenticated human RTG-02 disposition only.

No model, reviewer, verifier, evaluator result, finding count, signal
count, score, threshold, scheduler, adapter, or runtime condition may
trigger or apply it automatically.

REFRAME itself mutates nothing: it withholds approval for scope-expanding work under the current frame while the human re-evaluates it.

### Global Frame Check

1. What is the original core objective and current product or
   research philosophy?

2. Did recent progress improve the core objective, or did it only
   improve local metrics and internal correctness?

3. Does the currently stated primary contradiction still explain the
   most important research bottleneck?

4. If this research were started again today, would the human choose
   the same research question and governing frame?

### Possible REFRAME signals

- several successive directions or iterations improve local metrics
  but do not improve the core objective;

- the evaluator itself, or its ability to represent the real
  objective, is being questioned;

- a baseline, related work, or new evidence reveals a different
  primary contradiction;

- the current direction depends on an increasing number of
  workarounds to remain viable;

- if the work were restarted, the research question itself might be
  defined differently.

These are advisory signals only.

Their presence, absence, number, repetition, severity, or combination:

- never automatically triggers REFRAME;
- never creates a score or threshold;
- never changes loop state;
- never blocks or advances a position;
- never modifies the research brief or any frozen binding;
- never substitutes for an authenticated human RTG-02 decision.

### REFRAME disposition

- Human REFRAME pauses scope-expanding action under the current frame while the human may use optional context review, contradiction analysis, thinking models, external research, reading, or selective knowledge absorption.
- Those optional aids are not new runbook mechanisms and never write into the Research Brief automatically.
- If Research Brief, question, direction, evaluator, holdout, stop, and effort bindings are all unchanged, the original family remains valid; an applicable existing authenticated RTG-02 decision may continue R17.
- If any of those bindings materially changes, close the predecessor under the existing R17 rule, bind the changed content together with complete negative history, use the existing unique successor/fresh-run path, obtain a new RTG-01, and re-enter R17.
- If the new frame changes task or permitted scope, RTG-02 cannot expand authority; obtain the existing newly confirmed execution-intent permit before session creation.
- REFRAME cannot clear negative history, reset effort totals, create a sibling successor, bypass RTG-01, bypass a new execution-intent permit when required, or create a second lineage.

## Two digest domains

- `<full-ledger-digest>` hashes an immutable versioned full ledger snapshot over schema/canonicalization version, exact claims, evidence links, claim strength, required limitations, status, stable IDs, and parent ledger digest. Old snapshots remain retained.
- `<claim-projection-digest>` hashes only the canonical manuscript-relevant projection: normalized exact claim text, claim strength, required limitations, and stable IDs, using the frozen projection algorithm/version.
- `<coverage-manifest-digest>` hashes the complete surface inventory and the one-to-one mapping from every stable surface/location ID to its authorized claim and limitation.

Candidate admission and RTG-03 bind both claim domains. They are never substituted for each other. After manuscript creation, the trusted independent extractor uses the same frozen projection algorithm and total surface inventory to compute `<manuscript-claim-projection-digest>` plus `<coverage-manifest-digest>`; projection is compared with authorized `<claim-projection-digest>`, never with `<full-ledger-digest>`, and incomplete/ambiguous surface coverage fails closed.

## Verification tuple and transitions

P.06 and P.10 each consume a unique family-registry invocation sequence and emit a signed tuple `{evaluator-digest, candidate-digest, evidence-digest, full-ledger-digest, verdict}` plus the projection digest derived from that exact ledger snapshot, replay-package identities, invocation sequence, and resulting registry head. Verdict is KEEP, DISCARD, or CRASH. Any actionable/warning/uncertain external finding emitted with that result first creates a phase-valid origin and complete discovery manifest; ordinary scientific underperformance alone creates no origin.

Before any P.06/P.10 block, fail, close, or fresh-run transition, an independent custodian derives and signs `<verifier-carry-manifest>` exclusively from protected registry, backlog, and lifecycle manifests. It binds the exact tuple/projection, every source set/current-run-set digest, registry head, protected prestate digest, and a source-tagged enumeration whose canonical source classes are disjoint and complete and whose immutable-ID union is exactly `carry = all_open_inherited_ids ∪ all_open_current_run_ids ∪ all_open_successor/required-remediation_ids ∪ all_new_origins`. Each ID is assigned exactly once after deduplication; any raw multi-source appearance requires explicit alias proof to the same immutable ID and one canonical class. Omission, substitution, duplicate enumeration, prose-only carry, or actor-computed membership fails closed.

The P.06/P.10 outcome/carry matrix is exhaustive:

| Global result and per-ID state | Required transition |
|---|---|
| `CRASH` eligible for diagnosed non-scientific retry | Preserve the signed CRASH and carry manifest; before closure, retry only within frozen `<crash-retry-budget>`, with frozen scientific inputs and a new registry sequence. Never sample until PASS. |
| Plain scientific `DISCARD` or terminal `CRASH`; `carry = ∅`; no new actionable/warning/uncertain external finding | Preserve tuple/history and use ID-free discard lineage. This is the only ID-free P.06/P.10 closure. |
| Global `DISCARD` or terminal `CRASH`; `carry ≠ ∅` | Do not mint an origin merely for scientific underperformance. Before closure, atomically seal every original carry ID unchanged into the unique successor `<required-remediation-set>`, binding the DISCARD/CRASH tuple, carry manifest, original set/current-run digests, registry/prestate, and unique successor capability; successor P.01 reproduces each ID unchanged. |
| Global `KEEP`; any existing applicable per-ID verifier record is FAIL/CRASH/missing/duplicate/unclassified | Overall non-PASS. Seal the exact carry—including any new origins—into the same unique remediation successor before closure. Do not enter later review or admission. |
| Global `KEEP`; all applicable per-ID verifier records PASS (vacuously true when no IDs apply) | Complete and enter the next independent review on the identical tuple/projection and per-ID chain. KEEP is not Claim or release authorization. |

Global DISCARD dominates any accompanying per-ID PASS/FAIL for routing but never erases those signed records or open IDs: non-empty carry still takes the remediation successor. Existing obligations can never be downgraded to negative history. Only P.10 KEEP with all applicable per-ID PASS may reach P.11 and candidate admission.

## Outer reviewer accounting

Before every P.07/P.11/P.17 reviewer call, lineage authority issues a unique action sequence, single-use capability, and designated reviewer slot. Gateway invokes the outer reviewer service and registers every output/status, including negative, unusable, abandoned, and crashed evaluations. Each review position emits a gateway/registry/custodian-signed `<review-attempt-manifest>` binding every designated slot, capability, output hash, status, retry, and cumulative outer-review total.

Replacement is allowed only under a frozen typed retry rule for a diagnosed crash or structurally unusable output, never dissatisfaction with a verdict. The replacement receives a new slot/sequence and retains the failed output. Missing, extra, duplicate, or unregistered slots/calls/outputs close the run. P.12/P.13 bind the applicable P.07/P.11 manifest digests and reviewer totals; P.18 binds all P.07/P.11/P.17 manifests and cumulative totals.

## Universal finding lifecycle and non-PASS successor

Freeze producer-defined, versioned, phase-tagged `<per-id-lifecycle-schema>` as a discriminated union in validator trust before P.01. Common fields bind schema version, phase enum, immutable remediation ID, producer identity, registry sequence/head, source run, and signature; phase-specific fields are non-interchangeable:

| Phase | Required fields and forbidden future fields |
|---|---|
| `remediation-origin` / `finding-discovery` | Emitted immediately at discovery. Bind source position, finding/sub-check/result digest, source manifest, failed snapshot and affected surface, candidate/manuscript/evidence/full-ledger/projection digests as applicable at that point, and severity/uncertainty. It explicitly forbids and does not require any future remediation-set, repair, or gate field, including a repair artifact/result, gate identity/result, or placeholder/predicted/null future digest. |
| `repair-evidence` | Emitted only by actual P.04/P.08/P.14 repair producer after a valid origin and sealed `<required-remediation-set>` or `<current-run-obligation-set>`. Bind origin digest, exact set/current-run obligation-set digest, old/new surfaces and candidate/manuscript/evidence/ledger/projection digests, repair artifact, repaired/preserved disposition, producer identity, registry head, and signed applicability decision. |
| `gate-evidence` / `admission` | Emitted only after valid repair-evidence. Bind repair record digest, exact set digest, affected surfaces and exact current candidate/manuscript/evidence digests, gate identity, PASS/FAIL/CRASH and result digest, registry sequence/head, applicability decision/evidence, and predecessor gate records. Admission is a tagged gate subtype. |

Cross-phase field laundering, placeholder/predicted/null future digests, gate before set sealing or repair-evidence, repair before origin/set, wrong-surface/digest, missing/duplicate/unclassified records, or generator-chosen `not-applicable` fail closed. The only legal lifecycle is: complete discovery manifest → immutable current-run set seal (P.07) or successor set seal (P.06/P.10 carry closure, P.11/P.12/P.16/P.17/P.18/drain) → repair-evidence → applicable per-ID gates → admission PASS → single-use resolution capability and validated resolution manifest.

**Universal actionable-finding intake:** every review, audit, admission, external verifier/evaluator, or future admission/release-affecting producer must immediately mint a stable origin ID for every actionable, warning, or uncertain finding and include it in a complete signed immutable `<finding-discovery-manifest>`. A new producer/position without this intake fails closed. Plain P.06/P.10 scientific DISCARD is exempt only from inventing an origin for underperformance; any accompanying actionable external finding enters this intake, and ID-free discard lineage is legal only under the zero-carry outcome-matrix row.

- **P.07 current-run intake:** before P.08, every actionable/warning/uncertain review finding becomes an origin and the independent custodian atomically seals the complete discovery manifest into immutable `<current-run-obligation-set>`. P.08 must emit one repaired/preserved disposition and repair-evidence record per ID with exact changed/unchanged surfaces. NOOP, weakness-routing prose, repair of another surface, or omission cannot resolve or satisfy an ID. P.10 verifier, both P.11 reviewers plus synthesis, and P.12 admission gate the same IDs; P.12 two-phase resolution alone closes them.
- **Successor intake:** before any P.11/P.16/P.17 covered non-PASS closure, `<nonpass-closure-adapter>` seals ALL still-open inherited/current-run IDs plus ALL new origin IDs from complete manifests into one immutable successor `<required-remediation-set>`, then consumes one `<nonpass-successor-capability>` for exactly one successor before closing/releasing the predecessor. P.06/P.10 non-empty carry closure uses the same sealing/unique-successor invariant with its exhaustive carry manifest and tuple. P.11 with a new finding therefore carries unresolved P.07 IDs and new IDs together. P.16 new failed sub-check emits origin only—not gate evidence—then the complete discovery manifest seals the successor set; successor P.14 emits repair-evidence, and later P.16→P.17→P.18 emits gates.
- **Admission-created findings:** if P.12/P.18 global admission discovers a new actionable/warning/uncertain chain defect not covered by an open ID, it immediately emits an origin and either seals that ID plus every open ID into the unique successor set or emits a validator-trust-frozen typed non-remediable terminal reason and enters `CLOSED` with no release. Existing-ID FAIL/CRASH remains open and enters the same successor. Generic fresh-run with empty set is forbidden.

The gate producers remain exact after repair-evidence exists: P.10 independent verifier; both P.11 reviewers and synthesis; P.12 admission for research IDs; P.16 applicable audit sub-checks; both P.17 reviewers and synthesis; P.18 admission for manuscript/final IDs. Each emits phase-valid per-ID PASS/FAIL/CRASH. Global KEEP/PASS is necessary but insufficient; any applicable missing/duplicate/unclassified/FAIL/CRASH fails overall. Reviewer disagreement/nondeterminism is uncertain origin/non-PASS, never erased.

Freeze `<obligation-resolution-schema>` in validator trust as a set-tagged discriminated union shared by both the single-use `<backlog-resolution-capability>` and signed `<backlog-resolution-manifest>`:

| `set_kind` arm | Required binding |
|---|---|
| `current-run` | Exact `<current-run-obligation-set>` digest, origin digest, current protected obligation/backlog location expressed as append-line hash/index→immutable-ID mapping, and the complete P.08 repair plus P.10 verifier, both P.11 reviewer/synthesis, and P.12 admission PASS chain. P.12 uses this arm to close same-run P.07 IDs. |
| `successor` | Exact `<required-remediation-set>` digest, origin/source-successor identity, inherited protected backlog location, and the applicable complete P.10→P.11→P.12 or P.16→P.17→P.18 repair/gate/admission PASS chain. P.12/P.18 use this arm for inherited IDs. |

Both capability and manifest carry the same discriminator, immutable ID, exact set digest and location mapping, pre/post protected backlog digests, registry head, lease/fence, transaction identity, and chain digest. The independently custodied backlog adapter has named-ID-field mutation authority for both protected current-run and inherited obligations and may change only that named ID's resolution/status field. Wrong kind/digest/location, cross-kind relabeling/substitution, aggregate resolution, duplicate/reused capability, mutation of another field/ID, or incomplete chain fails closed.

At P.12/P.18, admission PASS first authorizes exactly one arm-valid ID-scoped capability; the adapter emits the corresponding arm manifest; the same admission validates discriminator, exact set/location, pre/post digests, and chain. Only after every applicable arm manifest validates may the position complete. FAIL/CRASH keeps IDs open and enters successor closure. Successor P.01 reproduces every ID into protected backlog, Task Scope, acceptance, header, plan, and registry; P.04/P.08/P.14 bind repair-evidence; parent stays signed closed/read-only. Negative-history prose is never a substitute.

## Loop transition reference monitor

Independently custodied `<loop-transition-adapter>` runs as an isolated state-mutation service and is the sole holder of executable routes, fencing credentials/tokens, and loop-state write ACL for both stock `next-tick` claim and stock `complete-tick` completion. Generator/reviewer/verifier/admission/operator/scheduler/dispatch processes receive session/state read-only and cannot invoke either state-mutating command directly.

For every next-tick or complete-tick invocation, the service holds the same exclusive ACL/fencing boundary for one serialized critical section: it atomically reads and canonically hashes protected persisted pre-state, invokes the stock command, captures raw stdout plus its hash and documented content discriminator, then rereads and canonically hashes protected persisted post-state. A signed `<transition-record>` binds command/capability identity, pre-state digest and selected protected fields, raw-output hash/content discriminator, post-state digest and selected protected fields, registry head, and service attestation. The registry records the complete transition record before dispatch or another mutation. Stdout is never assumed to contain a state head, persisted status, or authoritative transition result; classification requires both the documented raw discriminator and the independently service-read post-state.

**Claim-attempt automaton:** the service persists one signed state from `IDLE`, `CLAIM_ATTEMPT`, `CLAIMED_AWAITING_COMPLETION`, `IDLE_RETRYABLE`, `DRAIN_REQUIRED`, `ESCALATION/CLOSED`, or `TERMINAL`, bound to protected-state digest and registry head. From `IDLE` or `IDLE_RETRYABLE`, lineage authority may issue one single-use claim capability bound to expected position, last attested protected-state digest/registry head, lease, owner, and fencing. Receipt of every claim capability atomically enters `CLAIM_ATTEMPT`; the service validates it, consumes it exactly once, executes the two-channel next-tick transition record inside isolation, and applies this exhaustive map:

| Stock result class | Required transition |
|---|---|
| Raw documented `ready:true` payload with a valid unit | Require service-read persisted post-state status `in_progress` at the expected unit/next unit. Bind the attested post-state digest into trusted sanitizer's signed read-only `<work-envelope>`; enter `CLAIMED_AWAITING_COMPLETION`. The envelope contains only sanitized prompt, ID, type, handler, actor role, attested post-state digest, registry head, and transition-service identity. |
| Lock/no-claim or owner-conflict raw discriminator | Require unchanged pre-state/post-state digests and expected protected ownership fields; register the attempt, emit no envelope, and enter `IDLE_RETRYABLE`. A retry requires a newly issued claim capability bound to the last attested post-state digest and registry head. |
| Raw `stale`, `stalled`, or `terminated` discriminator | Require the matching persisted status/fields from protected post-state. `stale` or `stalled` enters `ESCALATION/CLOSED`; `terminated` enters `TERMINAL` without final-release authority. Emit no envelope. |
| Raw `drain_required:true` | Require a signed backlog digest plus unchanged completed/null-next-unit protected persisted state across pre/post digests; emit no envelope and enter `DRAIN_REQUIRED`. |
| Missing, contradictory, malformed, or unrecognized raw discriminator, or any post-state mismatch | Register the raw output and both state digests, emit no envelope, and enter `ESCALATION/CLOSED`; never infer a reset or retry. |

Only the `ready:true` row may pass raw payload to trusted `<position-dispatch-adapter>`. The sanitizer discards the stock prompt and returns the signed envelope; the actor receives only that envelope. No `ready:false` class may reset to `IDLE`, mint an envelope, or imply another attempt.

**Completion edge:** lineage authority issues one single-use completion capability bound to the claimed envelope's attested post-state digest and registry head. Immediately before mutation, the service validates position, signed artifacts/manifests, verdict/disposition, current service-read protected-state digest, registry head, envelope, and capability history; consumes it once; executes the same two-channel complete-tick transition record inside isolation; and attests command/CLI/filesystem/ACL containment. Every allowed completion requires the documented raw completion discriminator plus a service-read persisted post-state whose cursor/unit/status fields match the frozen map; stdout supplies no state head or authoritative status.

**P.07 joint backlog-intake completion:** stock P.07 `complete-tick` may append review findings before advancing, so the backlog custodian/adapter retains the only standing backlog write ACL and authorization authority while `<loop-transition-adapter>` has no standing backlog ACL. Only after authoritative review/discovery manifests are complete and origins plus immutable current-run set are sealed may that custodian issue one single-use `<p07-backlog-intake-capability>`. It binds exact evaluation/discovery manifests, origin IDs, pre-backlog digest, expected normalized append-only delta with each actual stock backlog line hash/index mapped to one origin ID, loop pre-state digest, stock command/completion capability, transaction ID, fence, path allowlist, and expiry.

For that one invocation only, a custodian-controlled transactional protected-store/overlay grants the stock command temporary write delegation restricted to the exact backlog path/delta; it stages both backlog and loop-state effects. Before any externally visible commit, a joint validator proves the backlog diff is exactly the authorized append—no extra/duplicate/missing line and exact origin mapping—the loop-state diff is exactly P.07→P.08, every other file/field is unchanged, and raw output contains no warning/partial result. A journaled two-phase commit or equivalent provably serializable protocol publishes both effects atomically. Every crash point and retry is transaction-ID idempotent and recovers both-or-neither: backlog-written/state-not-advanced, state-advanced/backlog-not-written, partial writes, or repeated append are impossible. Commit revokes the capability and temporary ACL; backlog and transition custodians co-sign `<p07-backlog-intake-transition-manifest>`. P.08 dispatch requires that combined manifest. ACL denial, attempted state move outside the transaction, wrong path/delta, mapping mismatch, concurrent mutation, capability reuse, or recovery ambiguity fails closed without publishing either side.

- P.06/P.10 complete on KEEP only when all applicable per-ID records PASS; any other terminal outcome follows the frozen carry matrix before block/fail/close/fresh-run, after CRASH retry policy where applicable.
- P.07 advances to P.08 only with complete review/discovery manifests and, when origins exist, a validated combined backlog-intake transition manifest: only PASS with zero actionable/warning/uncertain origins selects NOOP; any such origin, FAIL, or ITERATE seals the current-run obligation set and selects ID-bound REPAIR; missing/crashed/incomplete intake or a non-atomic append/advance blocks before publication.
- P.11/P.17 complete only on global synthesized PASS plus complete applicable per-ID producer PASS records. Any reviewer/synthesis non-PASS first seals the unified remediation set and unique successor, then completes blocked/failed and closes/fresh-runs.
- P.12/P.18 complete only after global admission PASS, every applicable ID-bound admission PASS, issued resolution capabilities, and validation of resulting resolution manifests; an admission-created new defect first emits origin and successor set or typed non-remediable CLOSED. P.13 completes only on valid RTG-03. P.16 completes only when every sub-check and repaired applicable ID is PASS; a new FAIL/CRASH first emits origin (never future gate/repair fields) and seals the unified successor set. No path alone completes.
- Build/fix/planning/test-design positions complete only when their positional verify contract, gateway manifests, and current registry head succeed. Every other failure retains the cursor or closes as specified.

Successful completion from `CLAIMED_AWAITING_COMPLETION` consumes its distinct completion capability and either returns to `IDLE` with the service-attested post-state digest/registry head or follows the frozen block/closure map. A raw-output/post-state mismatch enters `ESCALATION/CLOSED`. Thus normal work alternates claim attempt → signed work envelope → completion. A second claim before completion, completion without a live claim, stale protected-state digest/registry head, reused/wrong capability, or out-of-order mutation is rejected. All loop-state mutations, including initialization/reinitialization, takeover, stall recovery, abandoned-claim recovery, drain handling, terminal probing, and fresh-session initialization, remain inside this trusted mutation plane or stop.

**Abandoned-claim recovery:** only after the live envelope's signed deadline expires may lineage authority issue a separate single-use `<abandoned-claim-recovery-capability>` binding that envelope, attested protected-state digest/registry head, deadline, lease/fencing, and independently attested worker-liveness failure. The isolated service validates and consumes it once, enters `CLAIM_ATTEMPT`, and executes one two-channel next-tick transition record. Its exact result table is:

| Recovery result | Required transition |
|---|---|
| Raw `ready:false` plus exact `stalled` discriminator and service-read persisted post-state status `stalled` | Register/attest raw-output hash/discriminator and pre/post-state digests; enter `ESCALATION/CLOSED`; apply signed closure/reinitialization policy. |
| Early invocation, raw `ready:true`, non-stalled discriminator, persisted post-state mismatch, or malformed/unrecognized result | Register raw output and pre/post-state digests; emit no envelope; enter `ESCALATION/CLOSED`; fail closed without dispatch. |

Recovery cannot mint a replacement envelope, reset silently, reuse the old claim, or retry scientific work.

**Terminal probe and drain:** after validated P.18 release admission and its isolated complete-tick, the completion transition record must show service-read persisted post-state `next_unit: null`. Lineage authority may then issue one single-use `<terminal-probe-capability>` bound to the P.18 artifacts, live intent permit, that attested post-state digest/registry head, lease/fencing, and null-next-unit protected-state fact. The service consumes it once and executes one two-channel next-tick transition record. Its exact result table is:

| Terminal-probe result | Required transition |
|---|---|
| Pre-state has `next_unit:null`; raw stdout has `ready:false`, `terminate:true`, and the exact documented pipeline-complete reason discriminator; service-read persisted post-state status is `pipeline_complete` | Bind raw-output hash/discriminator and pre/post-state digests; enter `TERMINAL`; emit signed `<terminal-attestation>` containing the attested post-state digest. |
| Raw `drain_required:true` with a signed backlog digest and unchanged completed/null-next-unit protected state | Enter `DRAIN_REQUIRED`; freeze a signed backlog snapshot/digest. Every open item must traverse the independently custodied disposition transition below before any new terminal probe; mixed/actionable/uncertain backlog cannot terminalize. |
| Raw `terminated` without the exact pipeline-complete reason, raw `ready:true`, missing/invalid backlog digest, persisted post-state mismatch, or any other result | Register raw output and pre/post-state digests; enter `ESCALATION/CLOSED`; no final release. |

**Backlog-disposition transition:** independently custodied `<backlog-disposition-adapter>` holds the only standing backlog write ACL and is the sole authorization issuer; actors, operators, scheduler, dispatch, reviewers, and loop workers remain read-only. The only exception is its own single-use, path/delta-confined, jointly supervised P.07 transactional delegation defined above; that delegation grants no standing ACL and cannot perform classification, disposition, or resolution. After every `DRAIN_REQUIRED`, the adapter receives the signed frozen backlog snapshot/digest and emits one complete signed immutable `<backlog-classification-manifest>` that assigns every open ID exactly once into a disjoint/exhaustive total partition: `NON_ACTIONABLE_TO_CLOSE` or `REMEDIATION_REQUIRED`; every actionable 🔴/🟡 and every uncertain ID must be in `REMEDIATION_REQUIRED`. The manifest binds full snapshot, evidence and immutable disposition IDs/statuses, both ordered subsets, their complement relation, and `<partition-digest>`. Missing/duplicate/substituted/unclassified IDs or classification drift fail closed.

The partition protocol is mandatory and atomic/serializable:

| Partition outcome | Required transition |
|---|---|
| `REMEDIATION_REQUIRED` is empty | Lineage issues one single-use `<backlog-subset-disposition-capability>` binding the full snapshot, entire `NON_ACTIONABLE_TO_CLOSE` subset, empty complement, partition digest, lease/fencing, backlog/loop-state/registry digests. The adapter must close ALL AND ONLY that subset, reread/hash post-backlog, prove every other field and protected loop state unchanged, and emit `<backlog-subset-disposition-manifest>`. `open_items == 0` then permits a newly gated terminal probe. |
| `NON_ACTIONABLE_TO_CLOSE` is empty | No subset mutation occurs; its signed emptiness is retained. A successor capability may seal ALL AND ONLY the still-open `REMEDIATION_REQUIRED` set. |
| Both subsets are non-empty (mixed) | The subset-disposition capability and transition are mandatory first: close ALL AND ONLY `NON_ACTIONABLE_TO_CLOSE`, bind full snapshot/complement/partition digest and pre/post backlog digests, prove complement remains open and all other fields/loop state unchanged. Only after validating that manifest may the successor capability seal the exact still-open `REMEDIATION_REQUIRED` complement. |

Skipping the non-empty subset transition, placing a proven non-actionable ID into remediation, closing an actionable/uncertain ID, changing classification/partition between operations, wrong complement, omission/duplicate, or concurrent mutation fails closed. Both classification and subset-disposition manifests plus partition digest bind predecessor closure and successor P.01.

When `REMEDIATION_REQUIRED` is non-empty, lineage authority issues one distinct single-use `<backlog-successor-capability>` bound to the classification and any required subset-disposition manifests, partition digest, current backlog/loop-state/registry digests, lease/fencing, predecessor run, and exact still-open complement. Under adapter/lineage custody it is consumed once to atomically seal that complement into immutable `<required-remediation-set>`, emit predecessor `<run-closure-artifact>`, release lease, forbid predecessor final release, and issue exactly one unique successor edge. Each remediation entry binds source run, backlog item, disposition/evidence IDs/digests, severity/uncertainty, affected claim/manuscript surface, required repair scope, applicable independent verifier/reviewer/admission gates, and required acceptance evidence. The parent remains signed closed/read-only.

Successor P.01 must reproduce every remediation ID unchanged as a protected open backlog obligation and explicit Task Scope/acceptance requirement, binding the set digest in registry, adoption header, plan, P.01, P.12, and P.18. Omission, substitution, duplicate consumption, blank successor backlog, sibling issuance/consumption, or generic negative-history carry-forward fails closed. P.04/P.08/P.14 repair artifacts bind every relevant remediation ID. Research obligations require per-ID PASS/FAIL/CRASH evidence through P.10→P.11→P.12; manuscript/final obligations require it through P.16→P.17→P.18. Claim-changing repair must traverse new candidate admission and RTG-03. Generator or reviewer output alone never resolves an ID.

Only after the required per-ID admission PASS reaches its applicable independent gate may lineage issue one single-use `<backlog-resolution-capability>` under the frozen `<obligation-resolution-schema>`. The backlog adapter consumes the exact `current-run` or `successor` arm once, atomically changes only the named immutable ID's protected resolution/status field at the bound location, rereads/hashes pre/post backlog, proves loop state and every other field unchanged, registers the result, and emits the same-arm signed `<backlog-resolution-manifest>`. P.12 validates `current-run` manifests for same-run P.07 IDs and `successor` manifests for inherited research IDs; P.18 validates `successor` manifests for inherited manuscript/final IDs before its position completes. FAIL/CRASH remains open and closes/fresh-runs with the same immutable ID. Wrong-arm relabeling, substitution, aggregation, duplicate use, or winner-only resolution is forbidden.

In `DRAIN_REQUIRED`, force-terminate, `_drain_completed`, manual or unsigned edits, skip/pass, bulk closure, stock bypass flags, and equivalents are prohibited. A newly issued terminal-probe capability is allowed only after the current backlog proves `open_items == 0` and every `<current-run-obligation-set>` plus inherited `<required-remediation-set>` proves zero unresolved IDs through complete arm-valid per-ID `<backlog-resolution-manifest>` records. Any mixed/actionable/uncertain/open or unresolved current-run/successor set cannot terminalize and instead follows its signed successor/repair/fresh-run chain. Every later drain requires a fresh complete classification manifest and applicable outcome transition. `<final-release-predicate>` requires P.18 release admission, its completion transition record proving service-read persisted `next_unit:null`, and the fresh terminal record proving raw `ready:false`+`terminate:true`+exact pipeline-complete reason plus persisted post-state status `pipeline_complete`; the signed terminal attestation and release bind the full predecessor→successor remediation-set/classification/disposition/resolution manifest chain, zero-open/zero-unresolved proofs, and post-state digest. Stdout status/head is never required, and no earlier `terminated` discriminator is sufficient.

Materialization/dispatch validation requires all prior controls plus lifecycle-union discrimination/order, universal intake/current-run set, exhaustive verifier carry, set-tagged resolution, P.07 joint transaction, unified successor, total partition, two-phase resolution, and terminal maps. Fixtures retain every prior case and add: genesis P.16 new defect; inherited+new P.16 defect; fabricated placeholder/predicted repair/set/gate digest; all-PASS P.16 with zero IDs; inherited ID plus P.06 DISCARD; P.07 current-run ID plus P.10 DISCARD; KEEP plus existing per-ID FAIL; global DISCARD plus per-ID PASS and plus per-ID FAIL; zero-open plain DISCARD and CRASH; new external finding origin included in carry; P.07→P.08→P.10/P.11/P.12 same-run `current-run` arm resolution success; wrong set kind/digest/location, cross-kind relabel/substitution, aggregate resolution, and duplicate capability rejection; P.07 transactional append+advance success; ACL denial with attempted state move; duplicate/extra backlog line; origin/backlog mapping mismatch; wrong path/delta; concurrent mutation; crash at every prepare/commit/publish phase, partial-write recovery, retry idempotency, and capability reuse; P.07 finding repaired on wrong surface, omitted, NOOPed, routed-only, or hidden by aggregate PASS; P.12/P.18 new zero-ID defect choosing successor and typed non-remediable CLOSED; universal future-producer actionable finding; set derived from incomplete discovery manifest; gate before seal/repair; repair without origin/set; open current-run P.07 ID crossing P.11 closure; P.11 merging inherited/current-run+new IDs; admission resolution ordering; and all R15 mixed-partition/lineage fixtures. Each asserts exact phase tags/allowed fields, complete manifests, carry/set/partition/transaction/chain digests, both-or-neither publication, and zero-open/unresolved final gating.

## Stock-compatible fresh-run rule

Only P.06/P.10 plain scientific DISCARD or terminal CRASH with a signed exhaustive `carry = ∅` manifest and no new actionable/warning/uncertain external finding follows ID-free discard lineage; CRASH first obeys its frozen retry budget. For P.06/P.10 with non-empty carry, ordinary scientific underperformance creates no new ID, but all original carry IDs must be sealed unchanged into the unique successor set under the outcome matrix. Every other covered non-PASS likewise first seals its complete immutable remediation set and consumes the applicable single-use successor capability; only then may it emit signed `<run-closure-artifact>`, record tuple/carry/closure/set/manifests in the registry, release lease, stop the old driver, and preserve the predecessor read-only. Lineage issues the next run nonce only when no sibling/active child exists. Successor P.01 binds family/genesis, predecessor, tuple/carry/closure/set/manifest digests, complete negative history, new identities, registry head, and lease in `<prior-run-chain>`.

If Research Brief, question, direction, evaluator, holdout, stop, and effort bindings are all unchanged, the original family remains valid after an applicable existing authenticated human RTG-02 decision, and the still-valid family-bound RTG-01 may be reused. Any material change to those bindings closes the predecessor and uses the one existing unique successor/fresh-run lineage with complete negative history and cumulative effort, followed by a new RTG-01. RTG-02 signs the proposed new bindings plus predecessor family ID, closure digest, registry head, complete negative history, and cumulative typed totals; any human-authorized effort amendment is explicit in that chain.

Every fresh run and successor revalidates the immutable execution-intent permit against its exact task digest and permitted scope before session creation. Any task or scope change requires a newly confirmed permit; lineage or RTG receipts cannot silently expand it.

Lineage authority atomically issues exactly one successor `<research-family-id>` and genesis, forbids sibling or concurrent successors, and records the successor edge in both registries. The successor receives a new bounded-direction RTG-01 receipt binding the RTG-02 chain. All cumulative effort and negative history carry forward and cannot reset. Successor P.01, P.12, and P.18 validate predecessor closure/head/totals, unique successor issuance, new family head/genesis, new RTG-01 receipt, and every typed ceiling.

REFRAME creates no second lineage or alternate workflow.

For every drain or non-PASS remediation successor, `<required-remediation-set>` is protected lineage state, not generic negative history. The unique successor header/plan/registry and P.01 Task Scope/acceptance criteria reproduce every immutable ID as open; P.04/P.08/P.14 and the applicable P.10–P.12 or P.16–P.18 producer chain carry it until a gated resolution manifest closes it. The predecessor remains closed/read-only, and the same set cannot be consumed by a sibling or blank successor.

## Positional semantics

Frontmatter entries are repeated unit **types**, not plan IDs:

1. **P.01 `spec`:** validate execution-intent permit/task/scope, bindings, family-bound RTG-01/genesis, effort contract/ceilings, all trusted adapters/capabilities/ACL containment, two-channel schema, versioned phase-tagged lifecycle union and strict discovery→set→repair→gate→admission→resolution order, exhaustive verifier-carry matrix, set-tagged obligation resolution, P.07 joint transaction, universal intake/current-run/successor-set policies, drain partition, registry/run/lease/totals. A successor reproduces every ID/origin/set/carry/manifest as protected open backlog plus Task Scope/acceptance; omission/substitution/duplicate/sibling fails.
2. **P.02 `design`:** freeze baseline, question, mutable surface, hypotheses, evaluator, protected-evidence boundary, failure taxonomy, and genesis ledger identity before artifacts.
3. **P.03 `plan`:** preregister minimum discriminating experiments, analysis, provenance, citations, typed action accounting, evaluator correction, and stop/escalation rules; every planned claim-affecting action requires pre-issued registry identity.
4. **P.04 `build`:** before each candidate branch, experiment/trial, or claim-affecting literature/search action, obtain its family action sequence/nonce and register every result. Create candidate/evidence and first immutable full-ledger snapshot/digest with genesis parent; derive projection digest. Deli Literature and Experiment run here; Structure/Logic and Figures/Tables produce only claim skeletons, evidence tables, and diagnostic figures. On rework, consume prior findings for bounded repair; every research remediation artifact binds its applicable immutable remediation IDs. Emit complete signed `<attempt-manifest>` including negative/abandoned/crashed actions and typed totals.
5. **P.05 `test-design`:** record candidate replay guidance; schedule-only, with no OPC-required artifact.
6. **P.06 `e2e-verify`:** register a unique invocation against frozen replay seed/environment/container/dependencies/hardware/input order; external replay emits signed tuple/projection/result and exhaustive custodian carry manifest. Only KEEP+all per-ID PASS continues; DISCARD/terminal CRASH is ID-free only with empty carry, otherwise seals all original IDs unchanged into unique successor; account all effort/retries.
7. **P.07 `review`:** two designated gateway reviewers bind identical P.06 KEEP tuple/projection. Before P.08, every actionable/warning/uncertain finding emits origin and complete discovery manifest; custodian seals immutable current-run obligation set, then issues exact-delta P.07 backlog-intake capability. Joint journaled transaction atomically publishes normalized backlog append plus P.07→P.08 and co-signs combined manifest; only zero-origin PASS may select NOOP, otherwise ID-bound REPAIR.
8. **P.08 `fix`:** before dispatch validate the co-signed P.07 backlog-intake transition manifest against current backlog/loop digests. Pre-register all repair/routing actions and emit repaired/preserved disposition plus phase-valid repair-evidence per P.07 ID, binding origin/set, exact old/new changed/unchanged surfaces/digests, artifact, producer/applicability. Preserved remains open; wrong-surface, omitted ID, NOOP, routing prose, or aggregate repair cannot satisfy. Claim-changing repair requires new candidate admission/RTG-03.
9. **P.09 `test-design`:** record replay guidance consuming REPAIR or NOOP identities; schedule-only.
10. **P.10 `e2e-verify`:** register unique authoritative replay and global tuple; independent verifier additionally emits versioned per-ID PASS/FAIL/CRASH records for every applicable research remediation ID and custodian derives exhaustive carry. Only KEEP+all applicable ID PASS reaches P.11; KEEP+ID defect or DISCARD/terminal CRASH with non-empty carry seals the same unique successor, while empty-carry plain closure alone is ID-free.
11. **P.11 `review`:** two lineage-designated gateway reviewers each emit separate schema-valid per-ID PASS/FAIL/CRASH records on identical P.10 KEEP tuple/projection; trusted synthesis emits its own per-ID record retaining both. Global PASS requires every applicable ID PASS. Any reviewer/synthesis non-PASS or nondeterminism seals the complete unified remediation set and unique successor before closure.
12. **P.12 `e2e-verify` [SCOPE-1]:** admission validates global and phase-valid P.10/P.11 chains, then emits admission records. PASS issues exact `<obligation-resolution-schema>` arm: `current-run` closes same-run P.07 IDs and `successor` closes inherited research IDs; same-arm manifest validation precedes completion. Existing-ID FAIL/CRASH remains open in successor. A new admission chain defect emits origin and seals all open+new IDs to unique successor, or typed non-remediable CLOSED/no release; empty generic fresh-run is forbidden.
13. **P.13 `acceptance` [SCOPE-2]:** validate RTG-03 receipt binding candidate admission, both claim domains, evaluator/evidence, gateway/validator trust, P.07/P.11 review manifests/totals, candidate-stage attempt manifests, cumulative effort/history, and any successor chain. Completion requires the valid receipt; RTG-02 is not handled here. RTG-02, including its human-only REFRAME disposition, is not handled at P.13 and creates no additional position in the fixed sequence.
14. **P.14 `build` [SCOPE-3]:** pre-register every compile, Deli simulation/regression, and presentation/logic/figure repair action. Read immutable authorized full-ledger snapshot. Deli Structure & Logic and Figures & Tables compile the manuscript without expanding claims. Run Deli Peer Review Simulation plus regression check as non-authoritative inner build artifacts; bind score, weakness list, routing, and every relevant manuscript/final remediation ID. It may repair presentation/logic/figures only while preserving authorized digests, then recompile/recheck. Emit complete signed `<attempt-manifest>` covering every iteration/result, remediation IDs, and typed totals. If claims/evidence/limitations would change beyond projection, close and fresh-run through new candidate admission/RTG-03. Simulated artifacts never resolve an ID or control evaluator, ledger, RTG, validator, admission, or release. Emit manuscript digest; trusted extractor emits manuscript projection and coverage-manifest digests, and projection must equal authorized projection.
15. **P.15 `test-design`:** record post-manuscript replay/chain guidance; schedule-only.
16. **P.16 `e2e-verify`:** execute full audit. Repaired inherited IDs emit gate-evidence. Every newly failed sub-check immediately emits origin only with discovery-time fields; no future set/repair/gate digest. Complete discovery manifest then seals all open inherited+new IDs into successor set; successor P.14 repairs and later P.16–P.18 gates. All-PASS with zero IDs remains valid.
17. **P.17 `review`:** two independent gateway reviewers and trusted synthesis each emit separate schema-valid per-ID PASS/FAIL/CRASH records bound to exact P.16 bundle. Global PASS requires all applicable IDs PASS; reviewer/synthesis non-PASS or nondeterminism seals unified set/successor before closure.
18. **P.18 `e2e-verify` [SCOPE-4]:** final admission validates global/content/lineage and phase-valid P.16/P.17 chains. PASS resolves inherited IDs through the exact `successor` arm and validates same-arm manifest before completion. Existing FAIL/CRASH remains open in successor. A new zero-ID chain defect emits origin and successor set or typed non-remediable CLOSED/no release. Final release requires null-next-unit terminal record, zero open/unresolved IDs, and full lifecycle chain.

P.11/P.17 non-PASS and every new P.16 failure must seal complete immutable ID obligations before predecessor closure; applicable repair positions consume them. With unchanged claim domains P.14 may perform manuscript-only repair; any claim-set change traverses new P.10→P.13 admission/RTG-03. Negative history is never deleted or substituted for protected obligations.

## Executable adoption package

Runbook lookup returns types/body; it does not materialize a plan and this runbook declares no generic flow override. Immediately after lookup, run the task-intent adoption gate: without a valid `<execution-intent-permit>`, return suggestion/no-adoption and create nothing. Only after the permit may the adopter bind a trusted `<position-dispatch-adapter>` and serialize `<validated-handler-map>` with `spec`, `design`, and `plan` mapped to a discussion/planning-only handler, and `test-design` mapped to an isolated test-design handler. Handler identities/code/policy are frozen in validator trust.

The adapter policy is keyed by exact position even where the runtime map is type-based: P.01–P.03 discussion/planning-only; P.04/P.14 build generator; P.05/P.09/P.15 isolated test-design; P.06/P.10/P.12/P.16/P.18 executor/admission; P.07/P.11/P.17 isolated review-only; P.08 fix generator; P.13 authority/pre-release. After loop-transition service claims, dispatch sanitizer checks raw documented payload ID/type/handler/role against this table and cross-checks expected unit/next unit against the service-attested persisted post-state digest. Missing/mismatched handlers, post-state mismatch, identity drift, or role collision stops before envelope issuance.

For P.01–P.03 and P.05/P.09/P.15, stock `recommended_flow: build-verify` is advisory and unsafe. Following that fallback, or receiving it without the expected validated handler, is a hard stop before envelope issuance. The materialization validator rejects generic flow override, handler conflict, or role collision; dispatch sanitizer repeats every claimed tick.

Before any actor sees raw next-tick output, `<position-dispatch-adapter>` discards stock `resumePrompt` and emits the signed `<work-envelope>` with a separately signed replacement prompt. The prompt contains validated position/role and service-attested persisted post-state digest and instructs the actor to return artifacts plus proposed status/verdict to `<loop-transition-adapter>`; it contains no stock next-tick or complete-tick command. Sanitizer verifies replacement policy/digest, service/adapter identity, transition-record signature, raw-output hash, and post-state digest. Cold start/compaction reject raw or unsanitized payloads, missing signature, policy mismatch, post-state mismatch, or direct mutation instructions.

The adopter creates runtime-bound `acceptance-criteria.md` covering all four scopes below and passing the functional criteria lint. It also writes read-only reconnaissance `recon.md` of at least 200 meaningful characters covering workspace/source corpus, experiment executor/tests, protected evidence, validators/custodians, and prior runs.

The base parseable plan contains these mandatory scope lines:

```markdown
## Task Scope
- SCOPE-1: research admission
- SCOPE-2: exact Claim authorization
- SCOPE-3: authorized manuscript generation
- SCOPE-4: release admission/audit
```

A drain or non-PASS remediation successor appends one protected `REMEDIATION-{immutable-id}` Task Scope line and matching acceptance requirement for every required-remediation-set entry; it may not replace or omit the four base scopes.

The header records runbook id/version, exact task/intent digests, session/RTG/family identities, trusted adapter policies, two-channel and versioned phase-tagged lifecycle-union schema digests, verifier-carry outcome matrix, set-tagged obligation-resolution schema, P.07 transactional backlog-intake policy, universal intake/current-run/successor-set policies, drain partition/subset policies, required-remediation/full chain digests when applicable, and effort contract. Materialize P.01–P.18 in exact order with SCOPE/remediation references.

Plan guidance:

- **P.01 spec** — verify: intent/RTG/registry/trust, two-channel plus phase-tagged lifecycle schema/order, exhaustive carry matrix, set-tagged resolution, P.07 joint transaction, universal intake, total partition, capabilities/no-fork, and exact ID/origin/set/scope/backlog reproduction pass. eval: placeholder/cross-phase/out-of-order, wrong arm, non-total carry, or omitted lineage stops.
- **P.02 design** — verify: frozen design binds baseline/question/evaluator/genesis identities. eval: hypotheses discriminate without result access.
- **P.03 plan** — verify: preregistration binds experiments/analysis/provenance, typed counters/ceilings, per-action pre-issuance, evaluator correction, and stop rules. eval: frozen inputs cannot drift and optional search cannot be hidden.
- **P.04 build** — verify: gateway/registry/custodian-derived manifest and containment match gap-free action history/totals and bind every applicable research remediation ID to repair artifacts. eval: candidate/evidence/ledger/projection validate; no hidden work or ID laundering exists.
- **P.05 test-design** — verify: guidance names tuple/projection/transitions. eval: independent replay inputs are explicit.
- **P.06 e2e-verify** — verify: gateway-mediated invocation, signed tuple/result/registry-head, exhaustive custodian carry, effort, and containment validate. eval: KEEP+all ID PASS continues; non-empty carry DISCARD/terminal CRASH seals unique successor; only empty-carry plain closure is ID-free.
- **P.07 review** — verify: complete attempts plus origin per actionable/warning/uncertain finding, sealed immutable current-run obligation set, and exact append mapping. eval: zero-origin PASS selects NOOP; otherwise joint two-phase transaction publishes backlog append+P.07→P.08 both-or-neither and P.08 requires combined manifest.
- **P.08 fix** — verify: co-signed P.07 combined transaction manifest matches current backlog/loop state, and every P.07 ID has repaired/preserved disposition and repair-evidence with exact old/new surfaces/digests. eval: missing/partial intake or preserved/NOOP/wrong surface/omission/aggregate repair stays open or fails; claim change re-enters admission/RTG-03.
- **P.09 test-design** — verify: replay guidance consumes disposition identities. eval: full replay and custody are specified.
- **P.10 e2e-verify** — verify: global tuple, independent-verifier record for every applicable research ID, and exhaustive carry bind exact repair/surfaces/digests/gate/result/registry/applicability. eval: only KEEP+all ID PASS reaches P.11; KEEP+ID defect or non-empty-carry DISCARD/terminal CRASH seals unique successor.
- **P.11 review** — verify: both reviewers and synthesis emit distinct schema-valid per-ID records retaining disagreements. eval: global PASS requires all IDs PASS; any non-PASS/nondeterminism seals complete unified successor set before closure.
- **P.12 e2e-verify [SCOPE-1]** — verify: phase-valid admission after repair/gates and exact `current-run` or `successor` set/location arm. eval: PASS→same-arm resolution→manifest validation→completion; wrong/cross-kind or aggregate resolve fails; existing FAIL/CRASH stays open; new defect emits origin+successor or typed CLOSED/no release.
- **P.13 acceptance [SCOPE-2]** — verify: valid RTG-03 binds gateway/validator trust, review/attempt manifests/totals, effort/history, domains/lineage, and successor chain, and RTG-02 with human-only REFRAME remains outside P.13 with no additional position in the fixed sequence. eval: loop-transition service receives valid receipt against live claim/post-state digest; Claim authorization stays distinct from RTG-02, which is not handled at P.13 and creates no additional position.
- **P.14 build [SCOPE-3]** — verify: gateway manifest covers every compile/simulation/regression/repair and binds all relevant manuscript/final remediation IDs; extractor/coverage/projection validate. eval: simulation cannot resolve IDs; manuscript-only stays within projection, claim-changing work re-enters candidate admission/RTG-03.
- **P.15 test-design** — verify: guidance names manuscript/evidence/authorization/P.16/P.17/full-chain checks. eval: outer verifier independence is explicit.
- **P.16 e2e-verify** — verify: repaired IDs emit gate-evidence; new failed sub-check emits origin only and complete discovery manifest. eval: seal inherited+new successor set before closure; no future digest; zero-ID all-PASS remains reachable.
- **P.17 review** — verify: both reviewers+synthesis emit separate per-ID records on exact bundle. eval: all applicable IDs must PASS; non-PASS/disagreement seals unified successor before closure.
- **P.18 e2e-verify [SCOPE-4]** — verify: phase-valid admission/full chain plus exact inherited `successor` resolution arm. eval: same-arm two-phase resolution; existing FAIL/CRASH remains open; new zero-ID defect emits origin+successor or typed CLOSED/no release; final zero-open/unresolved remains mandatory.

Run a separate materialization validator requiring valid intent before session creation; exact 18 IDs/guidance/SCOPE/remediation; trusted adapter/producer/lineage identities and privileges; two-channel plus lifecycle-union, verifier-carry, obligation-resolution, and P.07 transaction schema versions/discriminators/field allowlists; universal intake, current-run/successor set, partition/subset, per-ID gate, same-arm two-phase resolution, joint commit/recovery, and terminal maps; all conformance fixtures; zero direct mutation/lineage instructions. Run functional criteria lint without bypass. OPC stock commands remain transport only; no external lifecycle mechanism is native or bypassable.

Parse adoption/preflight output: it must first report a valid execution-intent permit, then initialization must report `initialized: true`, exact 18 types/order, and zero plan/structure/criteria/materialization/automaton/transition-record warnings. The adoption validator explicitly rejects negated, definitional, quotation, translation, comparison, audit/review-only, or ambiguous-unconfirmed intent even if lexical match diagnostics succeed. A session-ownership degradation warning stops before P.01 unless an independently enforced valid `<single-driver-lease>` is verified and bound into validator trust, family registry, run closure, and unique-session acquisition/release. The adoption validator asserts either a healthy native owner gate or that lease; `--force-takeover` is prohibited as a normal bypass. Any other unclassified warning stops fail-closed.

## OPC v0.12 boundary

OPC validates Schema v1 and provides stock next-tick/complete-tick transport, but does not natively implement any declared permit, custodian, ACL/fencing monitor, two-channel record, universal finding intake, exhaustive verifier carry, phase-tagged origin/repair/gate lifecycle schema, current-run or successor obligation set, set-tagged obligation resolution, total partition, unique successor, per-ID admission/resolution, or chain attestation. Stock P.07 completion may append backlog before cursor advance, but OPC v0.12 provides no independently custodied single-use delegation, transactional overlay, atomic joint validation/commit, or both-or-neither crash recovery. All such P.07 intake machinery is an external runtime binding; if it is not deployed and provable, P.07 with findings fails closed before publication/advance. Stock review exposes aggregate verdicts only and cannot infer missing origins or future fields; stdout is not persisted-state authority. Independently custodied backlog/transition adapters, repair producers, verifiers, reviewers, admission actors, and lineage authority provide these external guarantees. Without provable lifecycle/order, carry, joint transaction, and transition/partition/successor/resolution containment, the runbook cannot execute or finalize.

OPC v0.12 does not detect, score, trigger, apply, or enforce REFRAME.
Global Frame Check and Possible REFRAME signals are human-governance
guidance only.
