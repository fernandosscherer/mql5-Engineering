# State scenarios

- STATE-001 restart with open position: broker exposure is reconstructed before new decisions.
- STATE-002 restart with pending order: pending lifecycle is reconciled.
- STATE-003 delayed transaction after local timeout: later event cannot duplicate/contradict state.
- STATE-004 manual trade on same symbol: ownership logic does not capture it unintentionally.
- STATE-005 another EA on same symbol: foreign magic/identity remains isolated.
- STATE-006 netting merges exposure: strategy logic does not assume one independent ticket per entry.
- STATE-007 hedging contains multiple tickets: management targets the intended positions.
- STATE-008 reconnect: state and protection recover without duplicate entry.
- STATE-009 day/session reset with open trade: required management state persists.
- STATE-010 stale selected object: destructive action revalidates target identity/state.
