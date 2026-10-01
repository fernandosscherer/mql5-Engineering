# Error handling review

## Terminal errors vs. trade-server retcodes

MQL5 exposes two separate error channels that must not be conflated:

- **Terminal/runtime errors** — accessed via `GetLastError()` / `ResetLastError()`. These describe failures in the MQL5 runtime environment (bad handle, invalid parameter, out-of-memory, etc.).
- **Trade-server retcodes** — returned in `MqlTradeResult.retcode` after `OrderSend()`. These describe the broker's decision on a trade request (e.g. `TRADE_RETCODE_DONE`, `TRADE_RETCODE_REQUOTE`, `TRADE_RETCODE_REJECT`).

Never check only one and ignore the other. A successful `OrderSend()` return (`true`) does not mean `retcode == TRADE_RETCODE_DONE`.

## `GetLastError()` and `ResetLastError()`

Check:

- `ResetLastError()` is called before operations whose error code will be inspected.
- `GetLastError()` is read immediately after the operation — other calls in between may overwrite the error.
- The code distinguishes zero (no error) from a previous unchecked error carried over because `ResetLastError()` was missed.

## Return value discipline

Every function that can fail must have its return value inspected before the result is used.

Flag:

- `CopyBuffer()` / `CopyRates()` / `CopyTicks()` return values ignored (returns count or -1);
- indicator handle returned as `INVALID_HANDLE` but used anyway;
- `ObjectCreate()` failure ignored;
- `FileOpen()` / `FileRead()` / `FileWrite()` without error check;
- `WebRequest()` without checking the return code and HTTP status;
- `PositionSelect()` / `OrderSelect()` / `HistorySelect()` result ignored.

## OrderSend retcode handling

For every `OrderSend()` call, check:

- `result.retcode == TRADE_RETCODE_DONE` or `TRADE_RETCODE_PLACED` (async);
- requote handling: `TRADE_RETCODE_REQUOTE`, `TRADE_RETCODE_PRICE_CHANGED`, `TRADE_RETCODE_PRICE_OFF`;
- rejection: `TRADE_RETCODE_REJECT`, `TRADE_RETCODE_INVALID`, `TRADE_RETCODE_MARKET_CLOSED`, etc.;
- whether the code retries on transient errors and whether the retry can produce duplicate orders.

Do not treat `result.order != 0` or `result.deal != 0` as proof of final execution; they indicate order placement, not fill confirmation.

## Retry logic

Retries on transient trade errors (requote, timeout, off-quotes) must:

- limit the number of retry attempts;
- verify position/order state before retrying to avoid duplicates;
- not retry on permanent rejections (invalid request, insufficient margin, etc.).

## Indicator handle errors

For every indicator handle:

- check for `INVALID_HANDLE` immediately after creation;
- call `BarsCalculated(handle)` before `CopyBuffer()` to confirm readiness;
- check `CopyBuffer()` return value (count of copied values, or -1 on error);
- call `IndicatorRelease(handle)` in `OnDeinit()`.

In Strategy Tester, indicator initialization timing differs from live; do not assume a handle is ready on the first tick.

## File I/O errors

- Always check `FileOpen()` result against `INVALID_HANDLE`.
- Check `FileRead()` / `FileReadString()` against `FileIsEnding()` or expected byte count.
- Ensure `FileClose()` is called in all paths, including error paths.

## WebRequest errors

`WebRequest()` returns -1 on connection failure and sets `GetLastError()`. The HTTP response code is in the out-parameter. Check:

- return value for -1;
- HTTP status code (200 vs. 4xx/5xx);
- whether the URL is in the terminal's allowed list (user must configure);
- that `WebRequest()` is not called from an indicator or in Strategy Tester (not supported).

## Logging discipline

When logging errors:

- include the function name, the error code, and the context (e.g., symbol, operation);
- use `ErrorDescription(code)` or `TradeResultRetcodeDescription(retcode)` for readable messages when available;
- do not log secrets, license keys, tokens, or account credentials;
- distinguish severity: use different prefixes or log levels (e.g., `[ERROR]`, `[WARNING]`, `[TRADE]`).
