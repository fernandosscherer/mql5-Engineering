# Testing and validation

Validate behavior through the highest practical seam. Prefer scenarios capable of failing for the exact requirement/defect. Avoid tests that merely mirror implementation details or use "does not crash" as the only assertion.

Validation levels:
- LEVEL 0 — Static inspection
- LEVEL 1 — Compilation/build
- LEVEL 2 — Deterministic logic validation
- LEVEL 3 — Strategy Tester scenario
- LEVEL 4 — Cross-symbol/account-model validation
- LEVEL 5 — Stress/adversarial validation
- LEVEL 6 — Demo forward validation

Compilation is LEVEL 1 only. It proves build correctness, not trading correctness, safety, release readiness or profitability.

For bugs, establish a red-capable feedback loop when practical. For release/audit work, report validation performed and validation not performed separately, including symbol, timeframe, account model, tester mode, preset/config and relevant environment assumptions.

Never use real money for validation.
