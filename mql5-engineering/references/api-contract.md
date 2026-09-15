# Licensing API contract

The exact contract is project-specific. During planning, propose a contract and wait for approval before implementation.

## Common client endpoints

Possible endpoints:

```text
POST /api/v1/licenses/validate
POST /api/v1/licenses/activate
POST /api/v1/licenses/deactivate
POST /api/v1/licenses/heartbeat
```

Do not expose admin operations to the MQL5 client credential.

Admin/customer-panel operations can be separate, for example create, renew, revoke, inspect activations, and manage plans.

## Validation request

Typical inputs can include:

```text
license identifier/key
product identifier
MT5 account login
broker server
environment
client version
nonce/timestamp when replay protection is required
```

Do not send data merely because it is available. Minimize client/customer information.

## Validation response

Typical fields:

```text
valid/status
product/plan entitlement
expires_at
refresh_after
grace policy
feature entitlements
server time / response metadata
```

## Security controls

Consider:

- HTTPS;
- authentication/authorization;
- license-key hashing;
- rate limiting;
- audit logs;
- idempotency where needed;
- replay resistance when appropriate;
- versioned API;
- short-lived response/token semantics if used;
- revocation;
- environment separation.

## MQL5 runtime

Network validation should normally run at startup and/or controlled timer intervals, not on every market tick.

A synchronous network timeout must not block or destabilize protective trade management.
