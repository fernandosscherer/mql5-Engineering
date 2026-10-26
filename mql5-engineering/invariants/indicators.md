# Indicator/data invariants

- Indicator handles must be validated before use and released when lifecycle ownership requires it.
- CopyBuffer/data-copy success and available element count must be checked before consuming values.
- Insufficient history/bars must produce safe no-signal behavior, not fabricated data.
- Current forming-bar versus closed-bar semantics must be explicit when signal stability depends on them.
- Multi-symbol/timeframe data must not be assumed synchronized without evidence.
- Missing or stale data must not silently become a valid trading signal.
