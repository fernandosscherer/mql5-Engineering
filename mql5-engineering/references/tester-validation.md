# Strategy Tester validation

## Fidelity matrix

Choose modes based on strategy mechanics rather than habit:

- real ticks;
- every tick/generated ticks;
- 1 minute OHLC;
- open prices only;
- execution delay when relevant;
- visual testing when useful.

A faster mode is not automatically valid for an intrabar strategy.

## Review tester assumptions

Check:

- current-bar logic;
- pending orders;
- intrabar SL/TP behavior;
- spread assumptions;
- delay/slippage sensitivity;
- multi-symbol data;
- custom/external data;
- files/global variables and tester sandbox behavior;
- features unavailable in tester.

## Real ticks versus generated ticks

Do not describe real-tick mode as merely simulated ticks. Treat the current MetaTrader documentation as authoritative on data mode/fallback behavior.

## Licensing

`WebRequest()` cannot be used in Strategy Tester. A licensed EA therefore needs an explicit tester policy. Never let a failed remote license call be misdiagnosed as a trading-code defect.

## Evidence

Never claim a strategy passed a backtest unless the test was actually run and the report/results were observed.
