# Security Policy

## Supported versions

Security fixes are applied to the current development line and, when practical, to the latest tagged release.

## Reporting a vulnerability

Do **not** open a public issue for a vulnerability that could expose credentials, licensing secrets, backend access, unsafe trade execution, or other exploitable behavior.

Report sensitive findings privately to the maintainer through the GitHub profile associated with this repository. Include:

- affected version or commit;
- affected file and component;
- reproduction steps or a minimal proof of concept;
- expected and observed behavior;
- potential impact;
- any suggested mitigation.

Please avoid accessing data, accounts, or infrastructure that you do not own or have permission to test.

## Security-sensitive areas

Reviewers should treat the following as security-sensitive:

- embedded credentials, API keys, database keys, or service-role secrets;
- licensing and entitlement endpoints;
- `WebRequest` integrations and remote configuration;
- file-system or external-process integration;
- unsafe update/download behavior;
- code that can place, modify, or close trades outside intended ownership boundaries;
- failure modes that disable protective management of open positions.

## Trading safety

A trading logic defect may also be a security or safety issue when it can cause unintended exposure, wrong-position actions, disabled protection, or remote manipulation of trading behavior.

Security review does not imply profitability and must never require validation with real money.
