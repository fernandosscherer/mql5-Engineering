# DEBUG workflow

Use DEBUG when the user reports a concrete defect, regression, intermittent failure, wrong trade behavior, tester/live mismatch, or performance problem.

The goal is root cause, not a plausible patch.

## 1. Establish the symptom

Inspect available logs, code, tester reports, docs, presets, and recent changes before asking the user.

Ask only for user-only information required to reproduce the exact symptom.

Define:
- expected behavior;
- observed behavior;
- environment;
- reproducible trigger or best available trace.

## 2. Build a feedback loop

Before theorizing deeply, create the tightest safe signal that can distinguish broken from fixed.

MQL5 examples:
- Strategy Tester preset reproducing the wrong trade;
- deterministic log assertion;
- minimal symbol/timeframe test;
- script/harness calling a pure risk or calculation module;
- replay of a captured price/state sequence;
- differential run between known-good and failing versions.

If no reliable loop is possible, state that explicitly and identify the missing artifact or environment.

## 3. Reproduce and minimize

Run the loop and confirm it catches the user's actual bug.

Reduce the scenario until unrelated conditions are removed while the failure remains.

## 4. Hypotheses

Generate 3-5 ranked, falsifiable hypotheses.

Each must predict what evidence would strengthen or weaken it.

Do not patch the first plausible explanation.

## 5. Instrument

Instrument only boundaries that distinguish hypotheses.

For trading defects, prefer evidence around:
- signal creation;
- state before request;
- request/retcode;
- transaction/deal/position confirmation;
- ownership selection;
- risk state before/after event.

Tag temporary diagnostics so they can be removed.

## 6. Root cause and plan

Classify:
- CONFIRMED ROOT CAUSE
- PROBABLE ROOT CAUSE
- HYPOTHESIS - TEST REQUIRED

Before modifying source, present the smallest safe correction and regression plan. Request approval.

## 7. Fix and regress

After approval:
- add a regression check at the best available seam when practical;
- apply the minimal correction;
- re-run the original feedback loop;
- run adjacent risk/state/execution checks;
- remove temporary instrumentation;
- update documentation when behavior or assumptions changed.

## 8. Post-fix review

Run a focused review of the corrected path. Do not declare success because the symptom disappeared if the root cause remains unverified.
