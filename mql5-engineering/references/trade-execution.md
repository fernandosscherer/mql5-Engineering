# Trade execution review

## Pre-trade validation

For every order path, determine whether the EA appropriately validates:

- trading permissions;
- symbol trade mode/order permissions;
- request fields;
- price/tick alignment;
- volume min/max/step/limit;
- stop/freeze constraints;
- filling/execution policy;
- available margin and projected margin level;
- session state;
- configured risk limits.

Use `OrderCheck()` where appropriate. A successful `OrderCheck()` is not a guarantee that a later order will execute.

## `OrderSend`

Never equate `OrderSend(...) == true` with a confirmed deal or position. Review:

- `result.retcode`;
- `retcode_external` when relevant;
- returned order/deal/request identifiers;
- delayed execution consequences;
- transaction/state confirmation.

The same principle applies when using `CTrade`; review the class result/retcode semantics rather than assuming a boolean call means final execution.

## Filling/execution modes

Do not hardcode FOK/IOC/RETURN generically. Validate the current symbol execution and allowed filling modes. Treat a hardcoded filling mode as suspicious unless code proves compatibility.

## Partial fills

One order can result in multiple deals. Check assumptions that requested volume equals immediately filled volume or that one `deal` field represents the full lifecycle.

## Protective stop integrity

If the strategy requires a hard protective stop, trace:

```text
request -> fill -> position confirmation -> stop attachment/modification
```

Find any failure path leaving confirmed exposure without required protection. This can be CRITICAL.

## Request initialization

Review `MqlTradeRequest`/result structures for deterministic initialization and required fields. Avoid stale values reused across different request types.
