# DEBUG workflow

Use when behavior is incorrect, intermittent, inconsistent between tester/live, or unexplained.

## Investigation order

1. Symptom.
2. Expected behavior.
3. Actual behavior.
4. Environment: tester/demo/live report supplied by user; account mode; symbol; timeframe; version.
5. Reproduction path or best available trace.
6. Candidate causes.
7. Evidence collection.
8. Root cause classification.
9. Minimal safe correction.
10. Regression checks.

## Root cause labels

Use exactly one when presenting the main conclusion:

- `CONFIRMED ROOT CAUSE`
- `PROBABLE ROOT CAUSE`
- `HYPOTHESIS — TEST REQUIRED`

Do not patch a symptom merely to make it disappear if the root cause remains unknown.

## Common MQL5 bug families

Check as applicable:

- duplicate signal / duplicate same-bar entry;
- state updated before trade confirmation;
- event-order assumptions;
- retcode ignored;
- retry logic duplicating orders;
- stale position/order selection;
- Magic/position ownership collision;
- netting versus hedging assumption;
- CopyBuffer/indexing/current-bar error;
- unsynchronized symbol/timeframe data;
- time/session/reset bug;
- restart/reconnect state loss;
- hardcoded symbol economics;
- invalid filling/stops/volume;
- tester-only behavior.

After the fix, document cause, correction, validation, and prevention when the user requested a dedicated task document.

## Final audit gate

After verifying the fix, run a focused final audit to confirm the correction did not introduce execution, state, risk, market-compatibility, or documentation regressions.
