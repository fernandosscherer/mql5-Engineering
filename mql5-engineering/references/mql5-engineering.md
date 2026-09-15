# MQL5 engineering baseline

## Lifecycle and resources

Review applicable handlers:

- `OnInit`
- `OnDeinit`
- `OnTick`
- `OnTimer`
- `OnTrade`
- `OnTradeTransaction`
- `OnChartEvent`
- `OnCalculate`

Check initialization failure paths, cleanup, timer lifecycle, market-book subscriptions, indicator handles, files, dynamic objects, and state reset.

Audit dynamic ownership for `new`/`delete` and avoid repeated allocation in hot paths without reason.

For indicator handles check `INVALID_HANDLE`, readiness, `BarsCalculated`, `CopyBuffer` return values, and `IndicatorRelease` where applicable. Remember that tester behavior can differ; do not infer resource correctness only from a backtest.

## Event model

Do not describe EA event handlers as ordinary parallel threads. MQL5 program events are processed through event queues, while terminal/server trading activity may progress asynchronously relative to the program.

Review:

- assumptions about handler order;
- duplicated responsibilities across handlers;
- long handlers delaying event processing;
- state set before external execution confirmation;
- missing/coalesced tick/timer assumptions;
- stale external trade state.

## Arrays and time series

Check:

- bounds;
- `ArraySetAsSeries` assumptions;
- index 0/current bar versus index 1/closed bar;
- `rates_total` / `prev_calculated`;
- incomplete history;
- off-by-one loops;
- data readiness.

## Precision

Do not assume `_Digits`/`_Point` alone define tradable price increments or financial value. Validate tick size, volume step, stops/freeze levels, and symbol-specific properties.

## Errors

Check return values before reading dependent outputs. Use `ResetLastError`/`GetLastError` appropriately, while distinguishing terminal/runtime errors from trade-server retcodes.

## Maintainability

Flag giant functions, duplicated trading logic, magic constants, hidden state coupling, dead code, inconsistent naming, and code that makes financial behavior difficult to verify.
