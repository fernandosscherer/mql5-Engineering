# Execution scenarios

Each scenario: objective -> preconditions -> trigger -> expected behavior -> failure evidence.

- EXE-001 duplicate signal on same tick: one intended action must not become duplicate exposure.
- EXE-002 repeated signal on same bar: repeated evaluation must respect strategy re-entry rules.
- EXE-003 send accepted, execution incomplete: local state remains pending until confirmed.
- EXE-004 partial execution: state/risk/protection reflect actual filled quantity.
- EXE-005 rejected request: no synthetic local position; actionable error evidence.
- EXE-006 delayed OnTradeTransaction: later confirmation reconciles without duplicate retry.
- EXE-007 reordered transactions: lifecycle remains consistent without assuming callback order beyond documented guarantees.
- EXE-008 restart after request: reconcile broker state before new exposure.
- EXE-009 reconnect with existing position: protection/ownership recover safely.
- EXE-010 invalid filling mode: fail/adjust safely according to symbol execution properties.
- EXE-011 invalid stops: no false success state; report broker constraint.
- EXE-012 invalid volume: normalization/rejection is explicit.
- EXE-013 insufficient margin: no exposure state committed.
- EXE-014 freeze-level restriction: modification path handles refusal safely.
- EXE-015 trading unavailable/session closed: no uncontrolled retry storm or false state.
