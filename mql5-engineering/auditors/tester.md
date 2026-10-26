# Strategy Tester and validation auditor

Determine what has actually been validated and at what level. Do not equate compilation with behavioral evidence.

Use engineering/testing.md levels:
- LEVEL 0: static inspection
- LEVEL 1: compilation/build
- LEVEL 2: deterministic logic validation
- LEVEL 3: Strategy Tester scenario
- LEVEL 4: cross-symbol/account-model validation
- LEVEL 5: stress/adversarial validation
- LEVEL 6: demo forward validation

Inspect modelling assumptions, tick mode, data/history availability, multi-symbol synchronization, spreads, commissions, swaps, session behavior, Economic Calendar/backend limitations, tester-specific branches, optimization objectives, reproducibility and differences between tester and live runtime.

Use scenarios/tester.md and applicable domain scenarios. Report performed validation and unperformed validation separately.

A clean compile is LEVEL 1 evidence only.

References: references/error-handling.md, references/source-policy.md.
