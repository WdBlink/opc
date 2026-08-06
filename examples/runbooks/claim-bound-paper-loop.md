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

R20 — Research Intake and Bounded Exploration

This runbook is semantic guidance executed with stock OPC v0.12 loop behavior and project-native validators. It is for a claim-bound paper research loop, not an ordinary article, generic paper draft, non-paper benchmark, extraction loop, or scheduler task.

Lexical `runbook match` is discovery only. The human/operator chooses whether to use this runbook; there is no pre-adoption executable gate.

## Stock lifecycle

1. Use `runbook match` to discover this recipe, then let the human/operator decide whether it fits.
2. Complete Research Intake once for the proposed frame. Only a `ready` result may proceed to human RTG-01, P.01, and then `init-loop`.
3. Materialize a `plan.md` containing `## Task Scope` plus per-unit `verify:` and `eval:` lines for the exact positions below.
4. Freeze the scientific frame, obtain RTG-01, and only then call `init-loop`.
5. Begin every tick with `next-tick`, perform only the claimed unit, and retain its evidence artifacts.
6. Finish that tick with one `complete-tick`. Do not combine units or complete the same tick twice.
7. Use separate independent `review` ticks. Honor native owner conflict, cycle/stall, backlog-drain, bounded-stop, and terminal results without bypass.

Every review tick requires at least two fresh independent reviewers. The candidate builder/writer must not verify or review its own output. Reviewer feedback is evidence about quality, not scientific truth.

OPC records human decisions as ordinary evidence; it does not verify human identity or enforce human judgment mechanically.

## Research Intake

Before RTG-01, P.01, or `init-loop`, complete one semantic Research Intake for the proposed scientific frame. Record it as ordinary evidence; it is not a nineteenth unit, executable gate, or change to OPC behavior.

The intake must:

- scan repository truth: the current implementation, experiments, evaluators, tests, datasets, evidence artifacts, and constraints;
- classify evaluator readiness as exactly one of `ready`, `partial`, or `missing`, without inferring or fabricating readiness when evidence is absent;
- research related work and relevant benchmarks only when the human has approved external research; otherwise record that external research was not approved and use the available repository evidence;
- analyze gaps among the research question, current baseline, evaluator, and available evidence;
- formulate falsifiable hypotheses;
- propose an `Exploration Contract` naming changes the AI may make autonomously, changes forbidden inside the run, and changes requiring human RTG-02 consideration;
- propose a `Scientific Exploration Budget` bounding each relevant category among candidate generations, failed directions, experiment trials, literature/search calls, verifier/replay calls, retries, and scope expansion; it is not merely a token or time budget;
- propose the baseline replay and evaluation procedure; and
- define the proposed mutable surface and explicit failure criteria.

The proposed versioned `Optimization Contract` is the envelope for RTG-01 approval. It binds the research objective/question, baseline or private proxy, evaluator/gate and acceptance policy, evidence/holdout and exact-Claim acceptance boundary, Exploration Contract as the admissible intervention space, allowed data/tools and risk boundaries, Scientific Exploration Budget, and stop conditions.

Route the result as follows:

- `ready`: record why the evaluator and evaluation procedure can replay the baseline and judge the hypotheses, then proceed to human RTG-01.
- `partial` or `missing`: do not enter RTG-01 or candidate optimization. End intake with an evaluator-construction plan that states the missing evaluator elements, construction and validation steps, evidence required for `ready`, and failure conditions; stop candidate work until a later Research Intake classifies the evaluator as `ready`.

## Frozen scientific frame

Before candidate work, freeze for the run:

- the research question;
- the baseline replay;
- the evaluator and evaluation procedure;
- the holdout/evidence boundary;
- the active Optimization Contract version;
- the approved Exploration Contract;
- the approved Scientific Exploration Budget;
- bounded stop conditions; and
- an empty claim ledger.

These remain fixed for the run. Every evidence artifact and staged report identifies the active Optimization Contract version. Evaluator output, independently replayed evidence, human direction, and exact Claim authorization are distinct facts and must remain distinguishable in the evidence artifacts.

## Exploration state and budget

Exploration State is ordinary evidence, not a new unit, schema, or runtime mechanism. It records active, narrowed, activated, archived, and discarded directions with rationale, evidence, remaining uncertainty, and category-level remaining Scientific Exploration Budget.

The AI may prioritize, narrow, execute, or archive only changes that the frozen Exploration Contract explicitly marks autonomous, only within the current active direction and Scientific Exploration Budget; it may not switch the active direction. A human `PIVOT` switches the active direction for an in-contract change explicitly marked RTG-required. Forbidden or contract-expanding changes are unavailable in the current run and may only be considered through `REFRAME`.

Every applicable exploration action—candidate generation, failed-direction use, experiment trial, approved literature/search call, verifier/replay call, retry, or scope-expansion attempt—debits its frozen category before it starts. An action cannot start when its applicable category is exhausted; exhaustion stops that category and yields `STOP` or a human RTG-02 choice among still-budgeted in-contract options. Increasing or reallocating frozen budget is a material Optimization Contract amendment and follows `REFRAME`, Research Intake, and a new RTG-01.

## Research diagnosis and proposals

Before each candidate intervention, observe the evidence/objective gap, attribute affected components or root cause, propose a direction, compare it with current state, metrics/evidence, and Distilled research memory, then ground one admissible intervention. P.02 performs this research and diagnosis; P.04 implements only the admitted intervention.

A human suggestion is a candidate proposal, not an immediate command, unless recorded as a formal RTG decision. It enters the same comparison and admissibility chain.

## Claim ledger and evidence discipline

The claim ledger records the exact Claim text, evidence links, strength, limitations, status, and negative history. Every manuscript Claim maps to evidence and, where applicable, a limitation. Claim–Evidence–Limitation review checks that mapping without treating a score or reviewer opinion as scientific truth.

Use these dispositions consistently:

- `KEEP`: independently replayed evidence supports continued consideration.
- `DISCARD`: preserve the candidate and reason as negative history.
- `CRASH`: an execution failure, never a scientific negative. A bounded diagnosed retry may follow only inside the frozen budget.

Classify outcomes without collapsing them:

- Implementation failure is `CRASH`, eligible only for a bounded diagnosed retry.
- Scientific no-improvement inside a valid frame is `DISCARD`, preserved as negative history.
- Suspected frame failure is evidence for human RTG-02 consideration, never automatic `REFRAME`.

Preserve negative, discarded, crashed, abandoned, and reviewer-disagreement history in ordinary evidence artifacts. Never sample until PASS or erase failed directions. The frozen budget and bounded stop conditions govern retries and continued work.

## Distilled research memory

Preserve raw accepted, rejected, and crashed evidence plus human rationale. Derive contextual lessons with source links, context, applicability limits, confidence, and known regressions; use them only as priors for proposal comparison, never as evaluator output or scientific truth.

## RTG-01 — Frame and budget

Before `init-loop`, the human approves one Optimization Contract version, including its Exploration Contract, Scientific Exploration Budget, and stop conditions. Record that active version and decision as ordinary evidence alongside the frozen frame.

## RTG-02 — Continue, pivot, stop, or reframe

Before RTG-02, produce a staged report compressing work tried since the last report, signal/evidence change, diagnosis and attribution, budget consumed and remaining, unresolved uncertainty, candidate directions, and the concrete human decision requested. Attach later human discussion and rationale to that report; this staged review does not require approval for every experiment.

Before scaling effort, making a structural pivot, or proposing a material frame change, the human makes a repeatable decision. `CONTINUE`, `PIVOT`, `STOP`, and `REFRAME` are plain semantic dispositions:

- `CONTINUE` keeps working inside the unchanged frame and budget.
- `PIVOT` is the human RTG-02 decision that switches the active direction for an in-contract change marked RTG-required; the Optimization Contract and frozen frame remain unchanged, and the work remains inside the current run.
- `STOP` ends work under the current run.
- `REFRAME` proposes a new Optimization Contract version, including any changed Exploration Contract, rather than mutating in-run State; it closes the current run and returns through Research Intake before a successor or fresh run and new RTG-01.

### REFRAME signals are advisory

Signals may prompt a human Global Frame Check but never score, trigger, block, advance, or mutate loop state automatically. Useful questions include whether progress serves the core objective, whether the evaluator still represents that objective, whether new evidence exposes a different bottleneck, and whether the research question would be chosen again today.

## RTG-03 — Exact Claim authorization

After independent evidence verification and Claim–Evidence–Limitation review, the human authorizes the exact Claim set allowed in the manuscript. The authorization identifies the active Optimization Contract version and exact evidence. RTG-03 is distinct from RTG-02: direction does not admit a Claim, and Claim approval does not redefine the frame.

## Run continuity

A material change to the research question, evaluator, baseline, holdout, mutable surface, stop conditions, budget, or an RTG-03-authorized Claim closes the current run. Return through Research Intake before a successor or fresh run; only a `ready` result may proceed to a new RTG-01, with preserved negative history. An unchanged frame may continue the current run.

An evaluator/gate change requires a separate validation path and baseline replay before a new Research Intake may classify the proposed Optimization Contract `ready`.

## Exact 18-position sequence

1. **P.01 — spec:** after a `ready` Research Intake, freeze the active Optimization Contract version, including its Exploration Contract and Scientific Exploration Budget, and obtain RTG-01.
2. **P.02 — design:** perform the research diagnosis and proposal chain, then design the evidence and Claim–Evidence–Limitation structure.
3. **P.03 — plan:** preregister Task Scope, unit checks, Scientific Exploration Budget, and stop conditions.
4. **P.04 — build:** implement only the admitted intervention, update Exploration State and staged-report evidence, and add candidate evidence and claim-ledger entries.
5. **P.05 — test-design:** specify independent replay checks for the candidate.
6. **P.06 — e2e-verify:** independently assign KEEP, DISCARD, or CRASH from replayed evidence and update Exploration State.
7. **P.07 — review:** conduct fresh independent review with at least two reviewers.
8. **P.08 — fix:** perform only bounded repair supported by the evidence.
9. **P.09 — test-design:** design checks for the repaired candidate.
10. **P.10 — e2e-verify:** independently replay the repaired candidate.
11. **P.11 — review:** independently review Claim alignment and limitations.
12. **P.12 — e2e-verify:** admit research-stage evidence and distill contextual lessons while preserving raw history.
13. **P.13 — acceptance:** obtain RTG-03 for the exact Claim set against the active Optimization Contract version and exact evidence.
14. **P.14 — build:** compile the manuscript only from the authorized Claim set.
15. **P.15 — test-design:** design the final evidence and manuscript audit.
16. **P.16 — e2e-verify:** independently audit final evidence and limitations.
17. **P.17 — review:** independently review manuscript Claim alignment.
18. **P.18 — e2e-verify:** check release against evidence, limitations, authorization, negative history, and stop conditions.
