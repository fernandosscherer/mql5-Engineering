# RELEASE workflow

Use RELEASE when the user asks whether a product is ready to deliver, distribute, publish, tag, or submit to MQL5 Market.

RELEASE is read-only unless the user separately authorizes fixes.

## Phase 1: Fix the release point

Identify the exact branch, commit, tag candidate, source package, version metadata, presets, documentation, and external dependencies being assessed. If a fixed point cannot be established, report LIMITED COVERAGE.

## Phase 2: Discover product topology

Map runtime entry points, trade/risk/state paths, indicators, UI, persistence, licensing/backend, Economic Calendar, WebRequest/DLL/files, tester assets, supported symbols/timeframes/account models, and documented deployment assumptions.

## Phase 3: Validation evidence

Use engineering/testing.md. Record the highest validation level actually demonstrated. Compilation alone is never sufficient for READY.

At minimum for a trading EA, determine evidence for:
- build/compile;
- critical trade lifecycle;
- risk sizing/exposure;
- position ownership/state recovery;
- intended account model;
- representative Strategy Tester scenarios;
- broker/symbol constraints;
- error paths and logging.

## Phase 4: Compatibility

Use references/broker-compatibility.md. Determine which conditions are guaranteed by code, constrained by documentation, broker dependent, symbol dependent, account-model dependent, or still require test evidence.

## Phase 5: MQL5 Market readiness

When MQL5 Market submission is relevant, run auditors/mql5-market.md and scenarios/market-validation.md. A product optimized for one symbol must still fail safely when automated validation runs unexpected symbols, timeframes, deposits, account models, or incomplete data.

## Phase 6: Adversarial release gate

Run applicable execution, state, risk, tester, time/session, Economic Calendar and product-specific scenarios. Re-verify all release blockers.

## Verdict

- READY: no known blocker inside adequately validated scope and stated deployment conditions.
- CONDITIONAL: shippable only under explicit conditions, with material non-blocking gaps documented.
- BLOCKED: one or more confirmed release blockers remain.
- LIMITED COVERAGE: a critical release path or required evidence could not be inspected or validated.

READY does not mean profitable and does not eliminate broker/environment risk.

Use templates/release-report.md when a formal report is requested.
