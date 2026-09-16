# mql5-engineering v3.0 — Agent Skill

Reusable engineering system for production-oriented MQL5 work.

**Modes:** BUILD • IMPROVE • DEBUG • REVIEW • AUDIT

## Core principle

> **Facts are the agent's job. Decisions are the user's job.**

v3.0 performs repository discovery before asking questions whenever possible. It routes the request into the narrowest workflow and loads only the applicable engineering/audit modules.

## Installation

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

Default:

```text
~/.agents/skills/mql5-engineering
```

OpenCode:

```bash
./install.sh --target opencode
```

Claude:

```bash
./install.sh --target claude
```

Project-local:

```bash
./install.sh --target project
```

## Activation

```text
MQL5 ENGINEERING v3.0
[ BUILD ] [ IMPROVE ] [ DEBUG ] [ REVIEW ] [ AUDIT ]

Discover → Route → Engineer → Validate → Audit
Facts → Agent | Decisions → User

Carregando...
Pronto para uso!
```

Activation does not echo internal references, file-loading lists, or discovery narration.

## Audit

A full audit automatically determines which technical domains apply.

Core EA passes:

- code;
- spec compliance;
- trading logic;
- trade execution;
- state/ownership;
- financial risk;
- architecture.

Optional passes:

- indicators;
- Strategy Tester;
- performance;
- UI;
- licensing/backend/security;
- documentation;
- regulatory flags.

If critical-path coverage is incomplete, the result is `LIMITED COVERAGE`, not `READY`.

## Documentation

Complete architecture guide:

```text
docs/MQL5-ENGINEERING-v3.0.md
```

## Tagged install

```bash
./install.sh install --ref v3.0
```
