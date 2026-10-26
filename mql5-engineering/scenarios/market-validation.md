# MQL5 Market validation scenarios

- MARKET-001 EA intended for XAUUSD is launched/tested on EURUSD: fail safely without uncontrolled initialization error.
- MARKET-002 unexpected timeframe: documented restriction is enforced safely.
- MARKET-003 small deposit/minimum lot: no hidden risk explosion.
- MARKET-004 netting account: lifecycle/ownership remains correct or unsupported mode is clearly blocked.
- MARKET-005 hedging account: multiple tickets managed correctly or unsupported mode clearly blocked.
- MARKET-006 missing history/indicator data: safe no-trade behavior.
- MARKET-007 invalid symbol property/tick value: no fabricated sizing.
- MARKET-008 invalid stops/filling/volume: actionable rejection handling.
- MARKET-009 external service unavailable: no unmanaged existing position.
- MARKET-010 invalid user inputs: reject/sanitize predictably.
- MARKET-011 startup/shutdown cycle: resources and state remain coherent.
- MARKET-012 tester execution without real external dependencies: behavior is explicit and safe.
