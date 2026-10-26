# mql5-engineering v3.1.0 — Agent Skill

Reusable engineering system for production-oriented MQL5 work.

**Modes:** BUILD • IMPROVE • DEBUG • REVIEW • AUDIT • RELEASE

## Core principle

> **Facts are the agent's job. Decisions are the user's job.**

v3.1 performs repository discovery before questions, routes into the narrowest workflow, and uses specialized auditors, engineering invariants, adversarial scenarios, broker-compatibility reasoning, and explicit validation coverage.

## What changed in v3.1

- RELEASE readiness workflow for delivery and MQL5 Market submission.
- Engineering invariants for execution, financial risk, position ownership, state lifecycle, and indicators.
- Stable adversarial scenario packs for execution, risk, state, tester, market validation, and XAUUSD.
- Deeper auditors for risk, execution, state, tester, time/session, Economic Calendar, and MQL5 Market readiness.
- Broker Compatibility Matrix and time-semantics guidance.
- Structured evidence schema and validation-level vocabulary.
- Triage scripts for trade calls, ownership, indicator handles, risk formulas, and volume normalization.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

Default target: `~/.agents/skills/mql5-engineering`.

Other targets:

```bash
./install.sh --target opencode
./install.sh --target claude
./install.sh --target project
```

## Activation

```text
MQL5 ENGINEERING v3.1.0
[ BUILD ] [ IMPROVE ] [ DEBUG ] [ REVIEW ] [ AUDIT ] [ RELEASE ]

Discover → Route → Engineer → Validate → Audit → Release
Facts → Agent | Decisions → User
```

## Audit

A full audit automatically determines which technical domains apply. Core EA passes cover code, spec compliance, trading logic, execution, state/ownership, financial risk, and architecture. Applicable optional passes cover indicators, tester fidelity, time/session, Economic Calendar, performance, UI, licensing/backend/security, documentation, regulatory flags, and MQL5 Market readiness.

If critical-path coverage is incomplete, the result is `LIMITED COVERAGE`, not `READY`.

## Release

RELEASE is a read-only readiness assessment. It evaluates the fixed point, compile/test evidence, critical paths, broker/account compatibility, tester behavior, risk controls, operational resilience, documentation consistency, and MQL5 Market validation risk when applicable.

Verdicts: `READY`, `CONDITIONAL`, `BLOCKED`, or `LIMITED COVERAGE`.

Release readiness never implies profitability.
