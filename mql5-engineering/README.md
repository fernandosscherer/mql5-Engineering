# mql5-engineering v2.7 — OpenCode Skill

Reusable engineering skill for MQL5 products. It supports planning, creation, improvement, debugging, auditing, documentation maintenance, licensing design, backend integration planning, risk review, and production readiness.

## Installation

Global installation:

```bash
mkdir -p ~/.config/opencode/skills
cp -R mql5-engineering ~/.config/opencode/skills/
```

Or unzip the package directly into `~/.config/opencode/skills/`.

Project-local installation:

```text
.opencode/skills/mql5-engineering/
```

OpenCode discovers skills from these locations and loads supporting files on demand.


## Activation banner

When explicitly activated in an interactive terminal, the skill runs `scripts/banner.sh` once before the planning questionnaire.

The startup presentation is intentionally minimal:

1. retro green MQL5 ASCII banner;
2. author and GitHub credits;
3. animated `Carregando...`;
4. `Pronto para uso!`;
5. planning questionnaire.

The activation phase does not echo internal reference contents, file-loading lists, or routine discovery narration in assistant text.

Credits displayed in the banner:

- **Created by:** Fernando Scherer
- **Repository:** https://github.com/fernandosscherer/mql5-Engineering.git

Disable the animation while preserving static output with:

```bash
MQL5_ENGINEERING_NO_ANIMATION=1
```

The script also honors `NO_COLOR` and falls back to non-animated output when no interactive TTY is available.

The terminal identity uses a monochrome retro CRT palette: black background with bright, normal, and dim green ANSI text only. No cyan, magenta, yellow, or red are used.


## Start a task

```text
Use a skill mql5-engineering.
```

The skill starts with an Interactive Planning Wizard that asks one question at a time. It waits for each answer, skips questions that are already answered or not applicable, and finishes with an open-ended prompt for the user's objective. It does not modify source files until discovery is complete, an execution plan has been presented, and explicit approval has been received.

## Main modes

- BUILD — create EAs, indicators, libraries, panels, or integrations.
- IMPROVE — add features to an existing project.
- DEBUG — establish root cause and apply the smallest safe correction.
- AUDIT — read-only source audit with production-readiness reporting.

## Documentation behavior

Documentation is part of the definition of done. After approved project changes, relevant existing docs are updated by default. During planning, the skill also asks whether a dedicated task/project document should be created.

## Licensing

The skill can plan MQL5 licensing and backend connectivity, including recommended architectures, API contracts, account/product entitlement, activation limits, caching/grace periods, Strategy Tester behavior, and failure-safe trading behavior.


## GitHub installer

When this skill is distributed from the official repository, the recommended install location is the universal Agent Skills directory:

```text
~/.agents/skills/mql5-engineering
```

One-line installation:

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

The repository installer also supports:

```bash
# OpenCode-specific location
./install.sh --target opencode

# Claude-compatible location
./install.sh --target claude

# Current repository/project
./install.sh --target project

# Update
./install.sh update

# Install a tag/branch/commit
./install.sh install --ref v2.7

# Uninstall
./install.sh uninstall --target universal --yes
```

Before replacing an existing installation, the installer creates a timestamped backup by default. No `sudo` is required.
