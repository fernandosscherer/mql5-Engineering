# Position-ownership invariants

- An EA must not modify, close, or account as owned a position/order it cannot prove belongs to its intended strategy scope.
- Ownership evidence must use the identifiers required by the design, such as magic number, symbol, ticket, comment/strategy identity, or explicit reconciliation data.
- Netting and hedging semantics must not be treated as interchangeable.
- Manual trades and positions/orders from another EA must not be captured accidentally.
- Selected position/order data must be refreshed/validated before destructive action; stale selection is not ownership proof.
