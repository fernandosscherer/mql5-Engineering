# Financial risk auditor

Reconstruct the full path from configured risk to actual requested exposure. Do not stop at the sizing formula.

## Trace

Account/equity -> risk configuration -> entry -> protective stop/structural invalidation -> stop distance -> symbol economics -> monetary loss per lot -> raw volume -> broker normalization -> requested volume -> existing exposure -> aggregate exposure -> margin -> worst plausible loss.

## Symbol economics

Verify discovered use of contract size, tick size, tick value (including profit/loss variants when material), volume min/max/step, point/digits, account currency, profit currency and margin currency. Treat zero, missing, stale or broker-specific properties explicitly.

## Sizing and constraints

Inspect percent risk, fixed lot, stopless trades, zero/negative stop distance, price normalization, volume normalization, min lot forcing, max lot clipping, commissions, swaps, spread, gap risk, margin and emergency exits.

If normalization can increase risk above the configured ceiling, determine whether the product rejects the trade, reduces exposure, or silently violates the budget.

## Aggregate exposure

Reconstruct per-trade, per-symbol and campaign/portfolio exposure as applicable. Include pyramiding, scaling, averaging, grids, martingale-like multipliers, repeated entries before state update, pending orders and restart with existing positions.

Apply invariants/financial-risk.md and relevant scenarios/risk.md.

Required question: **What is the maximum plausible financial exposure this product can create under the discovered configuration?**

If this cannot be answered because a critical path or symbol/account property is unavailable, report the limitation rather than inventing precision.

References: references/trading-risk.md, references/position-scaling.md, references/broker-compatibility.md.
