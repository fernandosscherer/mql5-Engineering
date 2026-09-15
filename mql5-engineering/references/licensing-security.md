# Licensing and client security

Use when the MQL5 product has paid/trial licensing, account binding, feature entitlements, remote validation, or an associated customer/admin panel.

## Core architecture

Prefer:

```text
customer/admin panel -> licensing backend/API -> database
                                      ^
                                      |
                                HTTPS WebRequest
                                      |
                                    MQL5 EA
```

Do not connect distributed MQL5 code directly to the database with privileged credentials.

## MQL5 limitations

According to official MQL5 documentation:

- `WebRequest()` is available to Expert Advisors and scripts, not indicators;
- the destination URL must be allowed in terminal settings;
- `WebRequest()` cannot execute in Strategy Tester.

Therefore define separate policies for:

- EA runtime;
- standalone indicators;
- Strategy Tester;
- offline/backend outage.

## License states

A backend may model states such as:

- ACTIVE
- EXPIRED
- SUSPENDED
- REVOKED
- NOT_FOUND
- ACCOUNT_MISMATCH
- PRODUCT_MISMATCH

Names are product choices, not MQL5 requirements.

## Failure-safe trading rule

A commercial entitlement failure may prevent **new exposure**. It must not prevent protective handling of an already-open position.

Never structure the main loop so an early `return` for invalid/unreachable license also disables:

- stop management;
- take profit management;
- trailing/breakeven;
- forced/session close;
- emergency close;
- other risk-reduction logic.

## Grace period

Backend outage is not identical to revocation. Consider a signed/trusted cached state and configurable grace period.

After grace expiry, a safe default is often:

- no new entries;
- continue reducing/protecting existing exposure;
- display degraded/invalid license state;
- retry validation periodically.

Final policy must be approved by the product owner.

## Secrets

Treat the MQL5 client as an untrusted distributed environment.

Never embed:

- database passwords;
- service-role keys;
- admin API secrets;
- license-generation secrets;
- secrets capable of modifying other customers/licenses.

Obfuscation/encryption inside the distributed client is not a substitute for server-side authorization.

## Audit checklist

Review:

- account/product binding;
- activation limits;
- expiry/revocation;
- replay resistance when needed;
- rate limiting;
- cache tampering assumptions;
- token/key exposure in logs;
- timeout/retry behavior;
- API versioning;
- demo/real/tester policy;
- feature entitlement boundaries;
- safe behavior while positions exist.
