# Performance review

Review hot paths:

- `OnTick`;
- `OnTimer`;
- `OnCalculate`;
- `OnTradeTransaction`;
- UI refresh loops.

Flag:

- full history scans every tick;
- indicator handle recreation;
- excessive `CopyBuffer`/`CopyRates` calls;
- repeated object creation/destruction;
- repeated `ChartRedraw`;
- synchronous network requests in hot paths;
- heavy transaction handlers;
- unnecessary logging volume;
- algorithms that depend on every tick being queued/processed independently.

Performance findings should connect to an operational consequence, not only micro-optimization.
