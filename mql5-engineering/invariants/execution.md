# Execution invariants

Use only when applicable to the discovered trade architecture.

- Request acceptance is not equivalent to completed execution.
- Internal exposure state must not advance to filled/position-open solely from a successful send return value when broker confirmation is still pending.
- Rejection/failure must not create synthetic local exposure.
- Delayed or reordered trade transactions must not create duplicate exposure or destructive rollback.
- Retry logic must be idempotent with respect to the intended trade action.
- Broker execution/filling/stops/volume constraints must be checked or safely handled before assumptions are committed to state.
- Protective management must remain possible after partial execution, restart or external-service failure.
