# Licensing backend options

During planning, if licensing is selected and architecture is not fixed, present recommended options instead of silently choosing one.

## Option A — Supabase/PostgreSQL + server-side functions

**Recommended default for a small/medium SaaS/product team** when rapid development and managed infrastructure are priorities.

Use:

- PostgreSQL for customers/products/licenses/activations/events;
- server-side function/API for validation;
- customer/admin panel using authenticated backend access;
- MQL5 client calling only the restricted HTTPS license API.

Never expose a Supabase service-role/admin secret in MQL5.

## Option B — Node.js/TypeScript + PostgreSQL

Good when the team wants full control, custom middleware, deployment flexibility, and a dedicated API service.

Possible frameworks include Fastify or NestJS; framework choice is secondary to correct authorization and API design.

## Option C — Serverless API + managed SQL

Good for simple license workloads and low operations overhead. Verify cold-start/latency characteristics against the chosen refresh policy.

## Option D — Existing backend

Integrate with the product's current auth/customer/billing system. Prefer one source of truth for entitlements instead of duplicating license state.

## Suggested data model

Adapt to the project; do not force these exact names.

```text
customers
products
licenses
license_activations
license_events
```

Typical license fields:

```text
id
license_key_hash
customer_id
product_id
plan/status
starts_at
expires_at
revoked_at
max_activations
grace_period
created_at/updated_at
```

Typical activation fields:

```text
license_id
mt5_account
broker_server
environment
activated_at
last_seen_at
deactivated_at
```

Prefer storing a one-way hash of license keys when plaintext recovery is not required.

## Wizard questions

If licensing applies, ask only unresolved items:

1. backend exists, create new, or recommend?
2. license type: subscription, annual, lifetime, trial, other?
3. binding: customer, product, MT5 account(s), environment, plan/features?
4. max activations?
5. demo/real separate?
6. expiry behavior?
7. grace period?
8. Strategy Tester policy?
9. feature entitlements?
10. customer/admin panel requirements?
11. API versioning/audit requirements?
12. dedicated licensing documentation?
