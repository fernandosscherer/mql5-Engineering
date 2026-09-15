# Expert Advisor review

## Reconstruct behavior

Map:

```text
market data -> indicators -> filters -> signal -> validation -> risk -> request -> execution -> position management -> exit -> accounting -> UI/logging
```

Identify:

- strategy entry/exit rules;
- symbol/timeframe dependencies;
- current/closed-candle semantics;
- stop/target/trailing/breakeven;
- scaling/grid;
- daily/session controls;
- Magic/ownership;
- persistence/restart behavior;
- manual control buttons;
- licensing gate.

## Duplicate-entry protection

Check whether entry can repeat:

- on every tick;
- on every timer call;
- before trade confirmation;
- after a timeout/retry;
- after reconnect/restart;
- on the same signal/candle;
- from two different handlers.

## Position ownership

Do not treat `PositionSelect(_Symbol)` as sufficient ownership proof in a generic production EA. Determine whether the code intends to target:

- any position on the symbol;
- only this EA;
- only this strategy instance;
- a specific position identifier/ticket.

Review symbol, Magic, tickets/position IDs, reasons, and account mode together.

## Safe licensing boundary

License invalidation may stop new entries, but must not bypass management or protective exit logic for existing exposure.
