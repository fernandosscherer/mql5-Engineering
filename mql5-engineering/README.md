# mql5-engineering v3.0 — Agent Skill

Reusable engineering system for MQL5 products.

v3.0 routes work into **BUILD, IMPROVE, DEBUG, REVIEW, or AUDIT**, discovers facts before asking questions, coordinates specialized engineering/audit passes, and keeps project documentation synchronized.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

Default location:

```text
~/.agents/skills/mql5-engineering
```

## Activation

The skill runs the retro green terminal banner, then:

```text
Carregando...
Pronto para uso!
```

Activation does not echo internal references, file-loading lists, or discovery narration.

## Core rule

> **Facts are the agent's job. Decisions are the user's job.**

When the request already establishes the objective, v3.0 does not force a generic questionnaire. It performs repository discovery first and asks only material decisions that cannot be inferred safely.

## Modes

- **BUILD**
- **IMPROVE**
- **DEBUG**
- **REVIEW**
- **AUDIT**

## Audit model

A full audit determines applicability automatically.

Core EA passes include code, spec compliance, trading logic, trade execution, state/ownership, financial risk, and architecture.

Additional passes load only when relevant: indicators, tester, performance, UI, licensing, documentation, and regulatory.

A clean result with an uninspected critical path is **LIMITED COVERAGE**, not READY.

## Documentation

Complete architecture guide:

```text
docs/MQL5-ENGINEERING-v3.0.md
```

## Tagged install

```bash
./install.sh install --ref v3.0
```
