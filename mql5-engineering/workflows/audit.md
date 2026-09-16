# AUDIT workflow

Use AUDIT for a product, full repository, EA, indicator, subsystem, release candidate, or production-readiness assessment.

## Default behavior

A request such as "audit this EA" authorizes read-only repository inspection immediately.

Do not begin with a questionnaire.

Discover the project, determine which audit domains apply, run the applicable independent auditor passes, verify high-impact findings, and produce the report.

## Phase 1: Scope from evidence

Inspect code and documentation to determine:

- product topology;
- critical runtime paths;
- strategy/risk source of truth;
- presence of indicators, UI, licensing, backend, tester assets, persistence, multi-symbol behavior, optimization, and external integrations.

Create an internal applicability matrix.

Do not ask the user to choose domains that the repository can establish.

## Phase 2: Behavior map

Before looking for isolated smells, reconstruct the system:

Signal/data
-> filters
-> risk permission
-> sizing
-> request construction
-> server response
-> order/deal/position state
-> protection/management
-> exit
-> accounting/daily state
-> restart/recovery

For indicators, reconstruct:

Source data
-> dependency handles
-> buffer calculations
-> current/closed bar semantics
-> plots/buffers
-> EA-consumed signals

## Phase 3: Independent passes

Minimum for a full EA audit:

- auditors/code.md
- auditors/spec-compliance.md
- auditors/trading-logic.md
- auditors/trade-execution.md
- auditors/state.md
- auditors/risk.md
- auditors/architecture.md

Add as applicable:

- auditors/indicator.md
- auditors/tester.md
- auditors/performance.md
- auditors/ui.md
- auditors/licensing.md
- auditors/regulatory.md

Each pass should collect its own evidence before seeing the final conclusions of other passes.

## Phase 4: Adversarial scenarios

Challenge discovered assumptions with relevant failure scenarios. Do not use a generic scenario list blindly.

Prioritize scenarios capable of causing:
- extra exposure;
- lost protection;
- wrong-position management;
- inconsistent state;
- divergence between intended and actual strategy behavior;
- live/tester divergence;
- customer lockout or unsafe license failure.

## Phase 5: Verification

Re-check all CRITICAL and HIGH candidates.

Try to falsify them against:
- the full call path;
- guards elsewhere in the system;
- project specs;
- official MQL5 semantics;
- account/symbol conditions.

Only findings that survive verification keep CRITICAL/HIGH severity.

## Phase 6: Aggregate

Merge duplicate findings only when they share the same root cause. Preserve distinct impacts when one defect creates different failure modes.

Use references/report-template.md.

Production readiness:
- READY: no known production blocker inside adequately reviewed scope.
- CONDITIONAL: material issues exist but no confirmed blocker under the stated deployment conditions.
- BLOCKED: at least one confirmed blocker makes production use unsafe or materially incorrect.
- LIMITED COVERAGE: a critical path could not be meaningfully inspected or verified.

A clean audit with incomplete critical-path coverage is LIMITED COVERAGE, not READY.
