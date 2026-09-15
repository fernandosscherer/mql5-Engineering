# AUDIT workflow

Use for production readiness, product audit, code review, financial-risk review, release review, or re-audit.

## Default permissions

Source is read-only. Writing an audit report after plan approval is allowed. Do not implement fixes in the same pass unless the user later approves a remediation plan.

## Audit order

1. Behavior map.
2. Critical execution paths.
3. Financial exposure.
4. Data correctness.
5. State/recovery.
6. Tester/live divergence.
7. Market/broker portability.
8. Licensing/security when present.
9. Performance/maintainability.
10. UI/design against project source of truth.
11. Documentation consistency.
12. Regulatory flags when relevant.

Use `references/report-template.md`.

Conclude with exactly one production-readiness state:

- `READY`
- `CONDITIONAL`
- `BLOCKED`

READY means no known blocker within scope. It does not mean profitable.
