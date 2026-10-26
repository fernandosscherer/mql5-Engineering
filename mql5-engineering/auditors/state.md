# State and ownership auditor

Reconstruct the product's real state machine instead of auditing isolated globals.

Infer states from code; do not force names. Typical lifecycle may resemble IDLE -> SETUP -> SIGNAL -> ORDER_PENDING -> POSITION_OPEN -> MANAGING -> EXIT_PENDING -> CLOSED.

Trace which events can mutate state: OnInit, OnTick, OnTimer, OnTrade, OnTradeTransaction, UI callbacks, backend responses, session/day reset, deinitialization and restart recovery.

Inspect order/deal/position identity, magic/symbol/strategy ownership, netting versus hedging behavior, manual/foreign positions, stale selected objects, persistence, broker reconciliation, delayed transactions, pending orders, orphaned state and duplicate callbacks.

Challenge restart/reconnect while exposure exists. Internal memory must not claim IDLE simply because the process restarted; broker state must be reconciled where required by the design.

Apply invariants/position-ownership.md, invariants/state-lifecycle.md and scenarios/state.md.

References: references/error-handling.md, references/broker-compatibility.md.
