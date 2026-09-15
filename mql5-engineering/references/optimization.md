# Optimization robustness

Optimization is not proof of profitability.

## Review criteria

Avoid approving parameter sets solely because of maximum profit or one best metric. Consider as applicable:

- number of trades;
- drawdown;
- recovery factor;
- expected payoff;
- Sharpe or other risk-adjusted measures;
- parameter-neighborhood stability;
- sensitivity to spread/delay;
- multiple market regimes;
- out-of-sample / forward validation;
- realistic trading costs.

## Overfitting flags

Report:

- huge search spaces relative to data;
- isolated parameter peaks;
- repeated re-optimization on the same sample;
- no out-of-sample validation;
- custom criterion that indirectly optimizes the same data repeatedly;
- implausibly perfect or low-trade results.

Do not make a statistical-validity claim unless the evidence supports it.
