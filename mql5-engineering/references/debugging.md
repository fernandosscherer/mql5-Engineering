# Debugging method

## Evidence first

Prefer logs, code path, transaction history, tester journal, exact inputs, account mode, and symbol specification over guesswork.

## Trace template

For a trading bug reconstruct:

```text
TIME
EVENT/HANDLER
STATE BEFORE
INPUT/SIGNAL
REQUEST
RETCODE
TRANSACTION(S)
STATE AFTER
POSITION/ORDER/DEAL SNAPSHOT
```

## Logging levels

When adding logs, distinguish as useful:

- DEBUG
- INFO
- WARNING
- ERROR
- TRADE

Do not expose full license keys, credentials, tokens, secrets, or customer-sensitive data in logs.

## Minimal correction

Prefer the smallest correction that fixes the confirmed cause. A broader refactor needs separate justification in the approved plan.
