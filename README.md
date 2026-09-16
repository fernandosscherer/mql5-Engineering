# MQL5 Engineering

<img width="1672" height="941" alt="MQL5 Engineering" src="https://github.com/user-attachments/assets/d03259f8-0afb-4986-a201-1216078c3100" />

**Build • Improve • Debug • Review • Audit**

Production-oriented engineering system for **MetaTrader 5 / MQL5**. Designed for Expert Advisors, indicators, libraries, panels, trading execution, financial-risk logic, Strategy Tester workflows, licensing, backend integrations, code review, and production audits.

**Version:** 3.0  
**Created by:** Fernando Scherer  
**Repository:** https://github.com/fernandosscherer/mql5-Engineering

---

## Why v3.0

v3.0 replaces the old questionnaire-first workflow with an **intelligent engineering router**.

> **Facts are the agent's job. Decisions are the user's job.**

If the answer can be discovered from source code, documentation, presets, logs, tester reports, configuration, or Git history, the skill should discover it before asking the user.

A request such as:

```text
Audit this Expert Advisor.
```

should not trigger a long generic questionnaire. The skill first inspects the project, determines which audit domains actually apply, and then runs the relevant engineering passes.

---

## Modes

| Mode | Purpose |
|---|---|
| **BUILD** | Create EAs, indicators, libraries, panels, and integrations |
| **IMPROVE** | Add features or improve existing projects while preserving unrelated behavior |
| **DEBUG** | Reproduce failures, form falsifiable hypotheses, establish root cause, fix, and regress |
| **REVIEW** | Review a bounded change such as a branch, commit, PR, or diff |
| **AUDIT** | Perform an adversarial product audit with independent technical passes and evidence-backed findings |

### Routing examples

```text
"Create a new EA"                → BUILD
"Add trailing stop"              → IMPROVE
"It sometimes opens twice"       → DEBUG
"Review this branch"             → REVIEW
"Audit this EA"                  → AUDIT
"Audit only financial risk"      → AUDIT / focused
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
   └─ AUDIT
   ↓
Applicable engineering / audit modules
   ↓
Evidence / validation
   ↓
Documentation
```

For source-changing work:

```text
Discover → Plan → Approve → Execute → Validate → Review → Document
```

Read-only discovery, diagnosis, review, and audit do not require an extra approval gate when the user already requested them. Source modification does.

---

## Audit model

A full audit automatically determines applicability.

Core EA passes:

- code correctness and MQL5 semantics;
- spec/documentation compliance;
- trading and operational logic;
- trade execution;
- position/order/deal state and ownership;
- financial risk and exposure;
- architecture.

Additional passes are loaded only when relevant:

- indicators;
- Strategy Tester / live fidelity;
- performance;
- UI / operational controls;
- licensing / backend / security;
- documentation consistency;
- regulatory or user-claim flags.

Domains that do not exist in the project are treated as **N/A**, not as questions to the user.

### Adversarial review

The audit does not only ask whether the code looks reasonable. It actively challenges assumptions with relevant scenarios such as:

```text
duplicate signal
partial fill
rejected order
delayed transaction
restart / reconnect
stale position state
netting / hedging
manual trade interference
invalid volume / stops
insufficient margin
spread spike / gap
session transition
history reload
license/API outage
```

### Evidence gate

Material findings should include:

- severity;
- confidence;
- nature;
- exact location;
- violated invariant or assumption;
- evidence;
- failure scenario;
- operational / financial impact;
- recommended correction;
- technical reference when required.

**CRITICAL** and **HIGH** findings must be re-checked before the final report.

A clean audit with an uninspected critical path is:

```text
LIMITED COVERAGE
```

not `READY`.

---

## Production readiness

Audit conclusions use:

- `READY`
- `CONDITIONAL`
- `BLOCKED`
- `LIMITED COVERAGE`

The project deliberately does **not** use artificial `/10` quality scores.

`READY` means no known blocker inside adequately reviewed scope. It does **not** mean profitable.

---

## Quick install

Recommended universal installation:

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
# Universal Agent Skills
./install.sh --target universal

# OpenCode
./install.sh --target opencode

# Claude
./install.sh --target claude

# Current project
./install.sh --target project

# Universal + OpenCode + Claude
./install.sh --target all
```

| Target | Path |
|---|---|
| universal | `~/.agents/skills/mql5-engineering` |
| opencode | `~/.config/opencode/skills/mql5-engineering` |
| claude | `~/.claude/skills/mql5-engineering` |
| project | `./.agents/skills/mql5-engineering` |

---

## Installer commands

### Update

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash -s -- update
```

### Install a tagged version

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- install --ref v3.0
```

### OpenCode-specific install

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- install --target opencode
```

### Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- uninstall --target universal --yes
```

### Help / version

```bash
./install.sh --help
./install.sh --version
```

Existing installations are backed up before replacement unless `--no-backup` is used. The installer does not require `sudo`.

---

## Terminal experience

The installer and activation experience use a monochrome retro-green terminal identity. The installer now combines the large MQL5 ASCII mark with a compact candlestick market panel.

```text
╔════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
║                                                                                                                    ║
║   ███╗   ███╗ ██████╗ ██╗     ███████╗                       │  MARKET // EURUSD H1                                ║
║   ████╗ ████║██╔═══██╗██║     ██╔════╝                       │                                                     ║
║   ██╔████╔██║██║   ██║██║     ███████╗                       │  1.1060 ┤                                      │    ║
║   ██║╚██╔╝██║██║▄▄ ██║██║     ╚════██║                       │  1.1040 ┤                               │     █    ║
║   ██║ ╚═╝ ██║╚██████╔╝███████╗███████║                       │  1.1020 ┤                         │     █     │    ║
║   ╚═╝     ╚═╝ ╚══▀▀═╝ ╚══════╝╚══════╝                       │  1.1000 ┤                    │    █ │   █     ║
║                                                               │  1.0980 ┤              │     █ │ █         ║
║                 E N G I N E E R I N G                         │  1.0960 ┤         │    █ │  █              ║
║                                                               │  1.0940 ┤    │    █ │  █                  ║
║                         I N S T A L L E R                      │  1.0920 ┤    █ │  █                       ║
║                                                               │  1.0900 ┼─│──█─│──────────────────────── ║
║      [ BUILD ] [ IMPROVE ] [ DEBUG ] [ REVIEW ] [ AUDIT ]     │             ↑ trend / structure           ║
╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝

                     MQL5 Engineering v3.0
             Discover → Route → Engineer → Validate → Audit
                  Facts → Agent | Decisions → User
```

The candlestick panel is decorative terminal art only; it does not display live market data.

ANSI output uses bright, normal, and dim green only. `NO_COLOR` and `MQL5_ENGINEERING_NO_ANIMATION=1` are supported.

---

## Repository layout

```text
mql5-Engineering/
├── mql5-engineering/
│   ├── SKILL.md
│   ├── README.md
│   ├── workflows/
│   ├── auditors/
│   ├── engineering/
│   ├── references/
│   ├── templates/
│   └── scripts/
├── docs/
│   ├── MQL5-ENGINEERING-v3.0.md
│   └── INSTALLER-GITHUB.md
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

For MQL5 language, runtime, event, trading, symbol, indicator, and Strategy Tester semantics, the current official **MQL5 Reference** is the primary technical authority:

https://www.mql5.com/en/docs

Repository documentation is the authority for intended product behavior.

---

## Safety

- Never use live money merely to validate code.
- Never claim profitability from source review, compilation, backtests, or optimization.
- Never invent compilation, tester, broker, or market results.
- Licensing failure may block new exposure, but must not disable protective management of existing positions.
- Never embed administrative secrets or service-role credentials in distributed MQL5 clients.

---

## Documentation

Complete v3.0 architecture and operating model:

[docs/MQL5-ENGINEERING-v3.0.md](docs/MQL5-ENGINEERING-v3.0.md)

Installer documentation:

[docs/INSTALLER-GITHUB.md](docs/INSTALLER-GITHUB.md)

---

## Release

Push a matching Git tag such as `v3.0` to trigger the release workflow.

The workflow validates:

- `VERSION`;
- `SKILL.md` metadata;
- terminal banner version;
- required v3 structure;
- shell syntax.

It then builds the release ZIP, generates SHA-256, and publishes the GitHub Release.
