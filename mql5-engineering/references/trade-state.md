# Trade state and transaction review

## Order / deal / position model

Do not collapse these into a single state. Model:

```text
request -> order(s) -> deal(s) -> position state
```

A trade request can produce multiple transactions and deals.

## `OnTradeTransaction`

Review:

- transaction type handling;
- use of `request`/`result` only where meaningful;
- `request_id` correlation for asynchronous flows;
- assumptions about transaction arrival order;
- handler runtime;
- stale order/deal/position state;
- re-selection of current state when required.

Do not build a state machine that requires transaction notifications to arrive in one deterministic business sequence.

## State machine

Infer explicit states, for example:

```text
IDLE -> SIGNALLED -> REQUEST_SENT -> PENDING_CONFIRMATION -> OPEN -> MANAGING -> EXIT_REQUESTED -> FLAT
```

Names vary by strategy. Report hidden transitions and ambiguous states.

## Restart/reconnect

Determine how the EA reconstructs:

- open position ownership;
- pending orders;
- current scaling level;
- protective state;
- daily counters;
- last signal/bar;
- license state.

Never trust stale in-memory state after restart when account/server state can be queried.
