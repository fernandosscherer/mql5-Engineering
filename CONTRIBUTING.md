# Contributing to mql5-engineering

Thank you for your interest in improving this skill. This guide covers conventions, file structure, and the release process.

## Scope

This is an agent skill for MQL5 Expert Advisor and indicator development. Contributions should improve:

- engineering workflows (BUILD, IMPROVE, DEBUG, REVIEW, AUDIT);
- reference coverage for MQL5 language, trading, risk, or market behavior;
- specialized auditor briefs;
- installer or activation experience;
- documentation clarity.

## File Structure

```
mql5-engineering/
├── SKILL.md                  ← Main skill entry point (agent reads this)
├── workflows/                ← One file per operating mode
├── auditors/                 ← Independent audit domain briefs
├── references/               ← Technical reference by topic
├── engineering/              ← Engineering methodology references
├── templates/                ← Output templates (reports, docs)
└── scripts/
    ├── banner.sh             ← Activation banner
    └── inspect-mql5.sh       ← Read-only project inspector
```

Root-level files:

```
install.sh      ← Installer (multi-target, multi-platform)
uninstall.sh    ← Uninstaller
CHANGELOG.md    ← Version history (update on every release)
VERSION         ← Single source of version number (e.g. "3.0")
```

## Conventions

### Versioning

This project uses a **simple major.minor** version scheme (e.g. `3.0`, `3.1`, `4.0`).

Before releasing, these four sources must all contain the **same** version string:

| Source | Location |
|--------|----------|
| `VERSION` | Root file, plain text, single line |
| `SKILL.md` metadata | `version:` field in YAML frontmatter |
| `scripts/banner.sh` | `VERSION="x.y"` variable |
| Git tag | `vX.Y` (e.g. `v3.0`) |

The CI workflow (`release.yml`) validates all four before building the release package.

### Markdown style

- Use LF line endings (enforced by `.gitattributes`).
- Keep lines under 120 characters where practical.
- Use ATX headings (`#`, `##`, `###`).
- Prefer fenced code blocks with explicit language tags.

### Shell scripts

- All scripts must pass `bash -n` (syntax check).
- Use `set -euo pipefail` at the top of every script.
- Honor `NO_COLOR` and `MQL5_ENGINEERING_NO_ANIMATION=1`.
- Never write to project directories — scripts are read-only utilities.

### Reference files (`references/`)

- One topic per file.
- Start with a `# Topic name` heading.
- List actionable checks the agent should perform, not abstract theory.
- Avoid reproducing the MQL5 documentation verbatim; link or cite instead.

### Auditor briefs (`auditors/`)

- Each file is an independent review brief for one audit domain.
- Write in adversarial tone: assume things can go wrong, not that they are fine.
- Use the evidence labels: `CONFIRMED BY CODE`, `CONFIRMED BY OFFICIAL DOCUMENTATION`, `PROBABLE RISK`, `HYPOTHESIS — TEST REQUIRED`, `BROKER / ENVIRONMENT DEPENDENT`.

## Making a Change

1. Fork the repository.
2. Create a feature branch: `git checkout -b fix/my-topic`.
3. Make your changes.
4. Update `CHANGELOG.md` under an `## Unreleased` section.
5. Verify scripts: `bash -n mql5-engineering/scripts/banner.sh && bash -n mql5-engineering/scripts/inspect-mql5.sh && bash -n install.sh`.
6. Open a pull request with a clear description of the problem and the fix.

## Releasing a New Version (maintainers)

1. Decide the new version string (e.g. `3.1`).
2. Update `VERSION` → `3.1`.
3. Update `SKILL.md` frontmatter → `version: "3.1"`.
4. Update `scripts/banner.sh` → `VERSION="3.1"`.
5. Move `## Unreleased` entries in `CHANGELOG.md` to `## 3.1 — YYYY-MM-DD`.
6. Commit: `git commit -m "Release v3.1"`.
7. Tag: `git tag v3.1`.
8. Push: `git push origin main --tags`.
9. The CI workflow (`release.yml`) will validate and create the GitHub Release automatically.

## Questions

Open an issue on GitHub for questions, bug reports, or feature requests.
