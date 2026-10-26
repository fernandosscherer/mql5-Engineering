# MQL5 Market readiness auditor

Apply when the product is intended for MQL5 Market or automated product validation.

Inspect initialization/deinitialization, unexpected symbols/timeframes, netting and hedging, small deposits, minimum volume, unavailable/invalid symbol properties, missing history/indicator data, sparse or zero ticks, invalid inputs, stops/freeze/filling/volume/margin constraints, external DLL/file/WebRequest/API dependencies, tester behavior, logging, version metadata and documentation consistency.

A symbol-specific product must fail safely when automated validation runs a different symbol. Avoid unnecessary INIT_FAILED when graceful no-trade behavior is safer and compatible with product intent.

Classify each observation additionally as one of:
- BLOCKER
- RELEASE RISK
- BROKER DEPENDENT
- MARKET VALIDATION RISK
- INFORMATIONAL

This release classification supplements, and does not replace, the global severity/confidence model.

Use scenarios/market-validation.md and references/broker-compatibility.md.
