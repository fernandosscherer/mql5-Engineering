# Trade execution auditor

Trace each trade action from decision to broker-confirmed lifecycle state.

Inspect MqlTradeRequest/MqlTradeResult or CTrade usage, OrderCheck(), OrderSend(), OrderSendAsync() when present, retcodes, request/result fields, OnTradeTransaction(), order/deal/position transitions, pending-order creation/cancel, close/modify/partial-close paths, retries and idempotency.

Never treat `OrderSend() == true` as proof that a deal is fully executed. Distinguish request acceptance, order state, deal creation, partial execution and final position state according to official MQL5 semantics.

Challenge execution mode, filling mode, price/deviation, stops level, freeze level, volume constraints, market/session state, insufficient margin, rejection, partial fill, delayed/reordered transactions, duplicate retry, restart during the lifecycle and symbol/account-model differences.

Verify that failure or rejection cannot update internal state as though exposure exists, and that delayed success cannot create duplicate exposure after a local retry/timeout path.

Apply invariants/execution.md, invariants/position-ownership.md and scenarios/execution.md.

References: references/error-handling.md, references/broker-compatibility.md.
