# MQL5 Engineering

<img width="1672" height="941" alt="MQL5 Engineering" src="https://github.com/user-attachments/assets/d03259f8-0afb-4986-a201-1216078c3100" />

**Build • Improve • Debug • Review • Audit**

Production-oriented engineering system for MQL5 Expert Advisors, indicators, libraries, panels, licensing, backend integration, debugging, code review, product audit, testing, financial-risk review, and documentation maintenance.

**Created by:** Fernando Scherer  
**Repository:** https://github.com/fernandosscherer/mql5-Engineering

## Quick install

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

Default target:

```text
~/.agents/skills/mql5-engineering
```

Then restart your AI agent/session and use:

```text
Use the mql5-engineering skill to audit this EA.
```

## Engineering model

MQL5 Engineering v3.0 uses an intelligent router instead of a mandatory questionnaire.

> **Facts are the agent's job. Decisions are the user's job.**

The skill first performs silent repository discovery, selects the narrowest workflow, loads only relevant technical modules, and asks questions only when a material decision cannot be inferred safely.

### Modes

- **BUILD** — create EAs, indicators, libraries, panels, and integrations.
- **IMPROVE** — improve existing projects while preserving unrelated behavior.
- **DEBUG** — reproduce, hypothesize, establish root cause, fix, and regress.
- **REVIEW** — review a bounded change such as a branch, commit, PR, or diff.
- **AUDIT** — adversarial product audit with independent technical passes and evidence-backed findings.

## Workflow

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

For code-changing work:

```text
Discover → Plan → Approve → Execute → Validate → Review → Document
```

A full audit automatically determines which domains apply. It does not ask the user to manually choose code, logic, risk, architecture, UI, licensing, or other surfaces that can be discovered from the project.

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

## Update

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash -s -- update
```

## Install a tagged version / rollback

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- install --ref v3.0
```

## Documentation

Complete v3.0 architecture and operating model:

[docs/MQL5-ENGINEERING-v3.0.md](docs/MQL5-ENGINEERING-v3.0.md)

## Releases

Push a matching tag such as `v3.0` to trigger `.github/workflows/release.yml`.

## Safety

- No live-money validation.
- Compilation is not proof of trading correctness.
- Backtests are not proof of profitability.
- Audit findings require evidence.
- A clean audit with an uninspected critical path is `LIMITED COVERAGE`.
