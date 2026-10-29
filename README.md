# MQL5 Engineering

<img width="1672" height="941" alt="MQL5 Engineering" src="https://github.com/user-attachments/assets/d03259f8-0afb-4986-a201-1216078c3100" />

**Build • Improve • Debug • Review • Audit • Release**

Production-oriented engineering system for **MetaTrader 5 / MQL5**. Designed for Expert Advisors, indicators, libraries, panels, trade execution, financial-risk logic, Strategy Tester workflows, licensing/backend integrations, code review, production audits, and release readiness.

**Version:** 3.1.0  
**Created by:** Fernando Scherer  
**Repository:** https://github.com/fernandosscherer/mql5-Engineering

---

## Why v3.1

v3.1 keeps the discovery-first engineering router introduced in v3.0 and adds a stronger production/release layer.

> **Facts are the agent's job. Decisions are the user's job.**

The skill now uses three complementary mechanisms:

- **Independent auditors** for domain-specific review.
- **Engineering invariants** for cross-cutting correctness/safety properties.
- **Adversarial scenarios** for repeatable failure-mode validation.

The goal is not to turn the skill into a generic trading encyclopedia. The goal is to reduce the chance that an agent produces MQL5 code that looks correct but fails under real execution, broker, account, timing, state, or risk conditions.

---

## Modes

| Mode | Purpose |
|---|---|
| **BUILD** | Create EAs, indicators, libraries, panels, and integrations |
| **IMPROVE** | Add features or refactor existing projects while preserving unrelated behavior |
| **DEBUG** | Reproduce failures, form falsifiable hypotheses, establish root cause, fix, and regress |
| **REVIEW** | Review a bounded change such as a branch, commit, PR, or diff |
| **AUDIT** | Perform an adversarial product audit with independent technical passes and evidence-backed findings |
| **RELEASE** | Assess whether a fixed product version is ready to deliver, distribute, tag, or submit to MQL5 Market |

### Routing examples

```text
"Create a new EA"                → BUILD
"Add trailing stop"              → IMPROVE
"It sometimes opens twice"       → DEBUG
"Review this branch"             → REVIEW
"Audit this EA"                  → AUDIT
"Audit only financial risk"      → AUDIT / focused
"Is this ready for MQL5 Market?" → RELEASE
```

---

## Engineering model

```text
Intent
   ↓
Silent discovery
   ↓
Router
   ├─ BUILD
   ├─ IMPROVE
   ├─ DEBUG
   ├─ REVIEW
   ├─ AUDIT
   └─ RELEASE
   ↓
Applicable engineering / audit modules
   ↓
Invariants + adversarial scenarios
   ↓
Evidence / validation
   ↓
Documentation / release verdict
```

For source-changing work:

```text
Discover → Plan → Approve → Execute → Validate → Review → Document
```

Read-only discovery, diagnosis, review, audit, and release assessment do not require an extra approval gate when already requested. Source modification does.

---

## Audit model

Core EA passes:

- code correctness and MQL5 semantics;
- spec/documentation compliance;
- trading correctness and robustness;
- trade execution;
- position/order/deal state and ownership;
- financial risk and exposure;
- architecture.

Additional passes are loaded only when relevant:

- indicators/data;
- Strategy Tester / live fidelity;
- time/session semantics;
- Economic Calendar/news behavior;
- performance/resource lifecycle;
- UI/operational controls;
- licensing/backend/security;
- MQL5 Market readiness;
- documentation consistency;
- regulatory/user-claim flags.

Domains that do not exist are treated as **N/A**, not as questions to the user.

### Evidence gate

Material findings should include severity, confidence, exact location, failed invariant/requirement, evidence, concrete failure scenario, impact, recommended correction, and verification status. **CRITICAL** and **HIGH** findings must be re-checked before final reporting.

A clean audit with an uninspected critical path is `LIMITED COVERAGE`, not `READY`.

---

## New in v3.1

### Engineering invariants

`mql5-engineering/invariants/`

Covers execution lifecycle, financial risk, position ownership, state/restart lifecycle, and indicators/data.

### Adversarial scenarios

`mql5-engineering/scenarios/`

Stable scenario IDs cover duplicate signals, delayed/reordered transactions, partial/rejected fills, restart/reconnect, netting/hedging differences, risk sizing, aggregate exposure, tester/data edge cases, MQL5 Market validation, and XAUUSD broker variations.

### Release readiness

`RELEASE` evaluates a fixed product version across compile/test evidence, critical paths, broker/account compatibility, Strategy Tester behavior, risk controls, operational resilience, documentation consistency, and MQL5 Market validation risk.

Verdicts: `READY`, `CONDITIONAL`, `BLOCKED`, or `LIMITED COVERAGE`.

Release readiness does **not** mean profitable.

### Broker Compatibility Matrix

`mql5-engineering/references/broker-compatibility.md`

Covers execution/filling modes, account model, stops/freeze levels, volume limits, tick/contract economics, margin/currency, sessions, and symbol naming/availability.

### Validation levels

`engineering/testing.md` distinguishes LEVEL 0 static inspection through LEVEL 6 demo forward validation. Compilation alone is never treated as proof of trading correctness.

---

## Quick install

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

Default target:

```text
~/.agents/skills/mql5-engineering
```

Then restart your AI agent/session.

Example:

```text
Use the mql5-engineering skill to audit this EA.
```

---

## Install targets

```bash
./install.sh --target universal
./install.sh --target opencode
./install.sh --target claude
./install.sh --target project
./install.sh --target all
```

| Target | Path |
|---|---|
| universal | `~/.agents/skills/mql5-engineering` |
| opencode | `~/.config/opencode/skills/mql5-engineering` |
| claude | `~/.claude/skills/mql5-engineering` |
| project | `./.agents/skills/mql5-engineering` |

### Tagged install

```bash
./install.sh install --ref v3.1
```

Existing installations are backed up before replacement unless `--no-backup` is used. The installer does not require `sudo`.

---

## Terminal identity

```text
MQL5 ENGINEERING v3.1.0
[ BUILD ] [ IMPROVE ] [ DEBUG ] [ REVIEW ] [ AUDIT ] [ RELEASE ]

Discover → Route → Engineer → Validate → Audit → Release
Facts → Agent | Decisions → User
```

`NO_COLOR` and `MQL5_ENGINEERING_NO_ANIMATION=1` are supported.

---

## Repository layout

```text
mql5-Engineering/
├── mql5-engineering/
│   ├── SKILL.md
│   ├── README.md
│   ├── workflows/
│   ├── auditors/
│   ├── invariants/
│   ├── scenarios/
│   ├── engineering/
│   ├── references/
│   ├── templates/
│   └── scripts/
├── docs/
├── .github/workflows/release.yml
├── install.sh
├── uninstall.sh
├── VERSION
├── CHANGELOG.md
├── LICENSE
└── README.md
```

---

## Source authority

For MQL5 language, runtime, events, trading, symbol/account properties, indicators, Economic Calendar, and Strategy Tester semantics, the current official **MQL5 Reference** is the primary technical authority:

https://www.mql5.com/en/docs

Repository documentation remains the authority for intended product behavior.

---

## Safety

- Never use live money merely to validate code.
- Never claim profitability from source review, compilation, backtests, or optimization.
- Never invent compilation, tester, broker, or market results.
- Licensing/backend/news-filter failure may block new exposure, but must not disable protective management of existing positions.
- Never embed administrative secrets or service-role credentials in distributed MQL5 clients.

---

## Documentation

Complete architecture and operating model:

[docs/MQL5-ENGINEERING-v3.1.md](docs/MQL5-ENGINEERING-v3.1.md)

Installer documentation:

[docs/INSTALLER-GITHUB.md](docs/INSTALLER-GITHUB.md)

Repository documentation is maintained in English.

---

## Release

Push a matching tag such as `v3.1.0` to trigger the release workflow.

The workflow validates `VERSION`, `SKILL.md` metadata, terminal banner version, installer version, required v3.1 structure, shell syntax, and Python helper syntax. It then builds the release ZIP, generates SHA-256, and publishes the GitHub Release.
