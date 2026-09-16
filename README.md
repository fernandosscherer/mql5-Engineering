# MQL5 Engineering

**Build • Improve • Debug • Audit**

Production-oriented engineering skill for MQL5 Expert Advisors, indicators, libraries, panels, licensing, backend integration, testing, risk review, and documentation maintenance.

**Created by:** Fernando Scherer
**Repository:** https://github.com/fernandosscherer/mql5-Engineering

## Quick install

Recommended universal installation:

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

The default target is:

```text
~/.agents/skills/mql5-engineering
```

Then restart your AI agent/session and activate the skill:

```text
Use the mql5-engineering skill.
```

## Safer install: inspect before executing

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh -o install.sh
less install.sh
bash install.sh
```

## Install targets

```bash
# Universal
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

Target paths:

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

Existing installations are backed up before replacement by default.

## Install a tagged version / rollback

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- install --ref v2.8
```

You can also use a branch or commit SHA with `--ref`.

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- uninstall --target universal --yes
```

## Installer options

```text
install.sh [install|update|uninstall]

--target universal|opencode|claude|project|all
--ref <branch|tag|commit>
--yes
--static
--no-backup
--help
```

The installer requires `curl` and `tar` and does not require `sudo`. It writes to the selected skill location and, by default, keeps the previous installation in a timestamped sibling backup.

## Releases

Push a matching Git tag such as `v2.8` to trigger `.github/workflows/release.yml`. The workflow:

1. verifies that the tag matches `VERSION`, `mql5-engineering/SKILL.md`, and the activation banner;
2. validates shell syntax;
3. creates `mql5-engineering-v2.8.zip`;
4. generates a SHA-256 checksum;
5. publishes both files as a GitHub Release.

## Repository layout

```text
mql5-Engineering/
├── mql5-engineering/
│   ├── SKILL.md
│   ├── README.md
│   ├── references/
│   ├── workflows/
│   ├── templates/
│   └── scripts/
├── .github/workflows/release.yml
├── docs/INSTALLER-GITHUB.md
├── install.sh
├── uninstall.sh
├── VERSION
├── CHANGELOG.md
├── LICENSE
└── README.md
```


## Silent activation experience

When activated, the skill keeps the startup UI intentionally minimal. It shows the retro green ASCII banner, an ANSI `Carregando...` animation, and then `Pronto para uso!`. It does not echo internal reference contents, file-loading lists, or routine discovery narration in assistant text. After the activation splash, the Interactive Planning Wizard asks exactly one question per turn, with lettered options (A, B, C...). No project discovery or project text is shown before the wizard is complete.

## Workflow

```text
Interactive Planning Wizard
   ↓
Requirements summary
   ↓
Discovery
   ↓
Plan
   ↓
Approve
   ↓
Execute
   ↓
Validate
   ↓
Auditar
   ↓
Documentation update
```

The skill never treats successful compilation or backtesting as proof of profitability.
