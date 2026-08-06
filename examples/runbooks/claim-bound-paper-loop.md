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

R19 — Native OPC Loop

This runbook is semantic guidance executed with stock OPC v0.12 loop behavior and project-native validators. It is for a claim-bound paper research loop, not an ordinary article, generic paper draft, non-paper benchmark, extraction loop, or scheduler task.

Lexical `runbook match` is discovery only. The human/operator chooses whether to use this runbook; there is no pre-adoption executable gate.

## Stock lifecycle

1. Use `runbook match` to discover this recipe, then let the human/operator decide whether it fits.
2. Materialize a `plan.md` containing `## Task Scope` plus per-unit `verify:` and `eval:` lines for the exact positions below.
3. Freeze the scientific frame, obtain RTG-01, and only then call `init-loop`.
4. Begin every tick with `next-tick`, perform only the claimed unit, and retain its evidence artifacts.
5. Finish that tick with one `complete-tick`. Do not combine units or complete the same tick twice.
6. Use separate independent `review` ticks. Honor native owner conflict, cycle/stall, backlog-drain, bounded-stop, and terminal results without bypass.

Every review tick requires at least two fresh independent reviewers. The candidate builder/writer must not verify or review its own output. Reviewer feedback is evidence about quality, not scientific truth.

OPC records human decisions as ordinary evidence; it does not verify human identity or enforce human judgment mechanically.

## Frozen scientific frame

Before candidate work, freeze for the run:

- the research question;
- the baseline replay;
- the evaluator and evaluation procedure;
- the holdout/evidence boundary;
- the mutable surface;
- the budget;
- bounded stop conditions; and
- an empty claim ledger.

These remain fixed for the run. Evaluator output, independently replayed evidence, human direction, and exact Claim authorization are distinct facts and must remain distinguishable in the evidence artifacts.

## Claim ledger and evidence discipline

The claim ledger records the exact Claim text, evidence links, strength, limitations, status, and negative history. Every manuscript Claim maps to evidence and, where applicable, a limitation. Claim–Evidence–Limitation review checks that mapping without treating a score or reviewer opinion as scientific truth.

Use these dispositions consistently:

- `KEEP`: independently replayed evidence supports continued consideration.
- `DISCARD`: preserve the candidate and reason as negative history.
- `CRASH`: an execution failure, never a scientific negative. A bounded diagnosed retry may follow only inside the frozen budget.

Preserve negative, discarded, crashed, abandoned, and reviewer-disagreement history in ordinary evidence artifacts. Never sample until PASS or erase failed directions. The frozen budget and bounded stop conditions govern retries and continued work.

## RTG-01 — Frame and budget

Before `init-loop`, the human approves the research question, evaluator, baseline, mutable surface, budget, and stop conditions. Record the decision as ordinary evidence alongside the frozen frame.

## RTG-02 — Continue, pivot, stop, or reframe

Before scaling effort, making a structural pivot, or proposing a material frame change, the human makes a repeatable decision. `CONTINUE`, `PIVOT`, `STOP`, and `REFRAME` are plain semantic dispositions:

- `CONTINUE` keeps working inside the unchanged frame and budget.
- `PIVOT` changes the approach while leaving the frozen frame unchanged.
- `STOP` ends work under the current run.
- `REFRAME` closes the current run so a changed frame can be considered separately.

### REFRAME signals are advisory

Signals may prompt a human Global Frame Check but never score, trigger, block, advance, or mutate loop state automatically. Useful questions include whether progress serves the core objective, whether the evaluator still represents that objective, whether new evidence exposes a different bottleneck, and whether the research question would be chosen again today.

## RTG-03 — Exact Claim authorization

After independent evidence verification and Claim–Evidence–Limitation review, the human authorizes the exact Claim set allowed in the manuscript. RTG-03 is distinct from RTG-02: direction does not admit a Claim, and Claim approval does not redefine the frame.

## Run continuity

A material change to the research question, evaluator, baseline, holdout, mutable surface, stop conditions, budget, or an RTG-03-authorized Claim closes the current run. Continue through a successor or fresh run with preserved negative history and a new RTG-01. An unchanged frame may continue the current run.

## Exact 18-position sequence

1. **P.01 — spec:** freeze the frame and obtain RTG-01.
2. **P.02 — design:** design the evidence and Claim–Evidence–Limitation structure.
3. **P.03 — plan:** preregister Task Scope, unit checks, budget, and stop conditions.
4. **P.04 — build:** create the candidate, evidence artifacts, and claim-ledger entries.
5. **P.05 — test-design:** specify independent replay checks for the candidate.
6. **P.06 — e2e-verify:** independently assign KEEP, DISCARD, or CRASH from replayed evidence.
7. **P.07 — review:** conduct fresh independent review with at least two reviewers.
8. **P.08 — fix:** perform only bounded repair supported by the evidence.
9. **P.09 — test-design:** design checks for the repaired candidate.
10. **P.10 — e2e-verify:** independently replay the repaired candidate.
11. **P.11 — review:** independently review Claim alignment and limitations.
12. **P.12 — e2e-verify:** admit research-stage evidence while preserving all history.
13. **P.13 — acceptance:** obtain RTG-03 for the exact Claim set.
14. **P.14 — build:** compile the manuscript only from the authorized Claim set.
15. **P.15 — test-design:** design the final evidence and manuscript audit.
16. **P.16 — e2e-verify:** independently audit final evidence and limitations.
17. **P.17 — review:** independently review manuscript Claim alignment.
18. **P.18 — e2e-verify:** check release against evidence, limitations, authorization, negative history, and stop conditions.
