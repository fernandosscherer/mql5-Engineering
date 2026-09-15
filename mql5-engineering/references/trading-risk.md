# Trading and financial risk review

## Volume

Validate against symbol properties:

- `SYMBOL_VOLUME_MIN`
- `SYMBOL_VOLUME_MAX`
- `SYMBOL_VOLUME_STEP`
- `SYMBOL_VOLUME_LIMIT`

Do not assume decimal precision from one market applies to another.

## Monetary risk

Reconstruct expected loss at stop and compare:

```text
DISPLAYED VALUE
CONFIGURED VALUE
ACTUAL IMPLEMENTED EXPOSURE
```

Use symbol-aware calculations. `OrderCalcProfit()` and `OrderCalcMargin()` are useful validation tools when applicable, but margin estimates still require awareness of account/position context.

Review:

- risk per trade;
- total/cumulative exposure;
- risk after scaling;
- margin/free margin;
- daily gain/loss limits;
- drawdown controls;
- maximum number of operations;
- stop/target relation;
- leverage assumptions.

## Trading costs

When financial totals are used for controls or displayed to users, determine whether the intended value is gross or net. Review commissions, swaps, fees, spread, slippage, and other relevant costs.

## Daily controls

Check reset logic, timezone/server-time assumptions, date transitions, restart behavior, and whether new entries are really blocked after the limit.

## Failure invariant

When the system enters a risk-lock or license-lock state, it may block new exposure, but must retain the ability to reduce/close/protect existing exposure.
