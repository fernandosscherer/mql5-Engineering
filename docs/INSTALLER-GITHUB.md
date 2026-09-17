# Installer via GitHub — MQL5 Engineering v3.0

The installer supports universal Agent Skills, OpenCode, Claude, project-local installation, updates, rollback through Git refs, backups, static terminal output, and uninstall.

## Quick install

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | bash
```

Default destination:

```text
~/.agents/skills/mql5-engineering
```

## OpenCode

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- install --target opencode
```

Destination:

```text
~/.config/opencode/skills/mql5-engineering
```

## Claude

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- install --target claude
```

## Project-local

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- install --target project
```

## Update

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- update
```

Existing installs are backed up by default before replacement.

## Install a release / branch / commit

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- install --ref v3.0
```

`--ref` accepts a tag, branch, or commit SHA.

## Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh | \
  bash -s -- uninstall --target universal --yes
```

## Options

```text
install.sh [install|update|uninstall]

--target universal|opencode|claude|project|all
--ref <branch|tag|commit>
--yes
--static
--no-backup
--version
--help
```

## Terminal behavior

The installer uses the final v3.0 retro **green + white** terminal identity.

The hero is split into two aligned fixed-width panels:

- left: large MQL5 ASCII mark, ENGINEERING, INSTALLER, and BUILD / IMPROVE / DEBUG / REVIEW / AUDIT modes;
- right: `GLOBAL FINANCIAL MARKET` with a decorative aligned candlestick chart and `TREND / STRUCTURE` legend.

Below the hero, a dedicated author block highlights:

```text
CREATED BY   FERNANDO SCHERER
GITHUB       github.com/fernandosscherer/mql5-Engineering
```

Color rules:

- green: borders, structural separators, status labels, progress and terminal accents;
- white / bright white: MQL5 identity, market information, author name, repository URL and primary completion text;
- black: terminal background supplied by the host terminal.

The market chart is decorative and does not display live market data.

The installer also shows:

- installer version;
- action;
- target;
- Git ref;
- environment validation;
- repository/package validation;
- detected skill version;
- destination;
- backup path when replacing an installation;
- final `SYSTEM READY` state.

It honors:

```text
NO_COLOR
MQL5_ENGINEERING_NO_ANIMATION=1
```

## Test before publishing

```bash
curl -fsSL https://raw.githubusercontent.com/fernandosscherer/mql5-Engineering/main/install.sh -o /tmp/mql5-install.sh

bash -n /tmp/mql5-install.sh
bash /tmp/mql5-install.sh --version
bash /tmp/mql5-install.sh --help
```

## Create release v3.0

Before tagging, confirm:

```text
VERSION                                  3.0
mql5-engineering/SKILL.md                version: "3.0"
mql5-engineering/scripts/banner.sh       VERSION="3.0"
```

Then:

```bash
git tag v3.0
git push origin v3.0
```

The release workflow validates the v3 structure and shell scripts, then produces the ZIP and SHA-256 checksum.
