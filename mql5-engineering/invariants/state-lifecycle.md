# State-lifecycle invariants

- Internal state must be reconcilable with broker-visible orders/deals/positions after initialization, restart and reconnect when the product carries exposure/state across events.
- Duplicate callbacks or repeated ticks must not create invalid state transitions.
- Pending operations must not be forgotten merely because local timers/timeouts expire.
- Session/day reset must not erase state required to manage positions that remain open.
- Persistence must not restore stale state without validating current broker reality.
- An orphaned or contradictory state must fail safely and emit actionable evidence/logging.
