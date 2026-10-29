# MQL5 Engineering

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-3.1.0-blue.svg)](VERSION)
[![Open Source](https://img.shields.io/badge/open%20source-community--driven-brightgreen.svg)](CONTRIBUTING.md)

<img width="1672" height="941" alt="MQL5 Engineering" src="https://github.com/user-attachments/assets/d03259f8-0afb-4986-a201-1216078c3100" />

**Open-source Agent Skill for production-grade MetaTrader 5 / MQL5 engineering.**

Build • Improve • Debug • Review • Audit • Release

MQL5 Engineering is a vendor-neutral, evidence-driven engineering system for Expert Advisors, indicators, libraries, panels, execution logic, financial risk, Strategy Tester workflows, licensing/backend integrations, code review, product audits, and release readiness.

**Open source • MIT licensed • Vendor-neutral • Community-driven**

**Version:** 3.1.0  
**Maintainer:** Fernando Scherer  
**Repository:** https://github.com/fernandosscherer/mql5-Engineering

---

## Why this project exists

AI agents can produce MQL5 code that compiles and still fails under real execution, broker, account, timing, state, or risk conditions.

MQL5 Engineering adds an engineering layer around that work.

> **Facts are the agent's job. Decisions are the user's job.**

The skill combines:

- **independent auditors** for domain-specific review;
- **engineering invariants** for cross-cutting correctness and safety properties;
- **adversarial scenarios** for repeatable failure-mode validation;
- **explicit validation levels** instead of treating compilation as proof;
- **release readiness** for delivery and MQL5 Market preparation.

The project does not promise profitability and does not treat backtests, compilation, or code review as proof of live-trading safety.

---

## Modes

| Mode | Purpose |
|---|---|
| **BUILD** | Create EAs, indicators, libraries, panels, and integrations |
| **IMPROVE** | Add features or refactor existing projects while preserving unrelated behavior |
| **DEBUG** | Reproduce failures, test hypotheses, establish root cause, fix, and regress |
| **REVIEW** | Review a bounded change such as a branch, commit, PR, or diff |
| **AUDIT** | Perform an adversarial product audit with independent technical passes and evidence-backed findings |
| **RELEASE** | Assess whether a fixed product version is ready to deliver, distribute, tag, or submit to MQL5 Market |

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

---

## Core and extensions

The project is intentionally split into a small engineering core and extensible domain knowledge.

### Core

- router and operating modes;
- evidence model;
- validation model;
- approval and safety boundaries;
- release-readiness semantics.

### Extensions

- auditors;
- invariants;
- adversarial scenarios;
- technical references;
- templates;
- examples;
- benchmarks;
- helper tooling.

This separation is designed to make external contributions easier without turning `SKILL.md` into a monolith.

---

## Audit model

Core EA passes cover:

- code correctness and MQL5 semantics;
- spec/documentation compliance;
- trading correctness and robustness;
- trade execution;
- position/order/deal state and ownership;
- financial risk and exposure;
- architecture.

Additional passes are loaded when relevant:

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

A clean audit with an uninspected critical path is `LIMITED COVERAGE`, not `READY`.

---

## Validation levels

`mql5-engineering/engineering/testing.md` distinguishes:

- LEVEL 0 — static inspection
- LEVEL 1 — compilation/build
- LEVEL 2 — deterministic logic validation
- LEVEL 3 — Strategy Tester scenario
- LEVEL 4 — cross-symbol/account-model validation
- LEVEL 5 — stress/adversarial validation
- LEVEL 6 — demo forward validation

Compilation alone is never treated as proof of trading correctness.

---

## Quick install

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

Default target:

```text
~/.agents/skills/mql5-engineering
```

Then restart your AI agent/session and activate it, for example:

```text
Use the mql5-engineering skill to audit this EA.
```

### Install targets

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

The project aims to remain compatible with OpenCode and compatible Agent Skills runtimes without requiring vendor-specific behavior in the core.

---

## Repository layout

```text
mql5-Engineering/
├── mql5-engineering/
│   ├── SKILL.md
│   ├── workflows/
│   ├── auditors/
│   ├── invariants/
│   ├── scenarios/
│   ├── engineering/
│   ├── references/
│   ├── templates/
│   └── scripts/
├── examples/
├── benchmarks/
├── docs/
├── .github/
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── GOVERNANCE.md
├── ROADMAP.md
├── SECURITY.md
├── CHANGELOG.md
├── LICENSE
└── README.md
```

---

## Contributing

Contributions are welcome.

Useful contribution types include:

- bug fixes;
- new or improved auditors;
- engineering invariants;
- adversarial scenarios;
- broker/environment references;
- reproducible benchmark cases;
- golden-report expectations;
- helper scripts;
- documentation improvements;
- compatibility improvements for Agent Skills runtimes.

Start with [CONTRIBUTING.md](CONTRIBUTING.md). Project decisions and compatibility rules are described in [GOVERNANCE.md](GOVERNANCE.md).

Repository documentation is maintained in **English**.

Community participation is covered by [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

---

## Benchmarks

The `benchmarks/` directory is the foundation for the planned v3.2 verification layer.

The goal is to measure whether the skill:

- detects known defects;
- avoids unsupported findings;
- preserves critical semantics across versions;
- behaves consistently across compatible runtimes.

See [benchmarks/README.md](benchmarks/README.md).

---

## Security

Do not publish credentials, private broker/account data, licensing secrets, or exploitable vulnerabilities in public issues.

See [SECURITY.md](SECURITY.md) for responsible reporting guidance.

---

## Roadmap

The next major development direction is **Verification & Benchmarking**: benchmark fixtures, golden reports, self-audit checks, false-positive tracking, and stronger deterministic validation helpers.

See [ROADMAP.md](ROADMAP.md).

---

## Documentation

- [MQL5 Engineering v3.1 architecture and operating model](docs/MQL5-ENGINEERING-v3.1.md)
- [Installer documentation](docs/INSTALLER-GITHUB.md)
- [Contributing guide](CONTRIBUTING.md)
- [Governance](GOVERNANCE.md)
- [Security policy](SECURITY.md)

For MQL5 language, runtime, events, trading, symbol/account properties, indicators, Economic Calendar, and Strategy Tester semantics, the current official **MQL5 Reference** is the primary technical authority:

https://www.mql5.com/en/docs

---

## Safety

- Never use live money merely to validate code.
- Never claim profitability from source review, compilation, backtests, or optimization.
- Never invent compilation, tester, broker, or market results.
- Licensing/backend/news-filter failure may block new exposure, but must not disable protective management of existing positions.
- Never embed administrative secrets or service-role credentials in distributed MQL5 clients.

---

## License

MQL5 Engineering is released under the [MIT License](LICENSE).

You may use, modify, fork, and redistribute the project under the terms of that license.
