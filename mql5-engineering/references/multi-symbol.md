# Multi-symbol and multi-timeframe review

## Synchronization

A new bar on one symbol/timeframe does not prove another symbol/timeframe is already synchronized.

Review:

- `SymbolSelect` / history readiness;
- `SymbolIsSynchronized` when applicable;
- `SeriesInfoInteger`/bar timestamps;
- `BarsCalculated` and `CopyBuffer` readiness;
- stale data;
- different sessions/holidays;
- missing ticks;
- symbol-specific new-bar detection.

## Event source

`OnTick` is driven by the chart symbol. A multi-symbol EA must not assume OnTick events correspond to ticks from every instrument it consumes.

## Risk

Multi-symbol systems require aggregate exposure/margin review. Per-symbol risk limits alone may not cap portfolio exposure.
