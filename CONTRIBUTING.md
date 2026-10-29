# Contributing to mql5-engineering

Thank you for your interest in improving this skill. This guide covers conventions, file structure, documentation policy, and the release process.

## Scope

This is an agent skill for production-oriented MQL5 engineering. Contributions should improve:

- engineering workflows (BUILD, IMPROVE, DEBUG, REVIEW, AUDIT, RELEASE);
- technical references for MQL5 language, trading, risk, broker behavior, and release readiness;
- specialized auditor briefs;
- engineering invariants and adversarial scenarios;
- installer or activation experience;
- documentation clarity and consistency.

## File Structure

```text
mql5-engineering/
├── SKILL.md                  # Main skill entry point
├── workflows/                # One file per operating mode
├── auditors/                 # Independent audit-domain briefs
├── invariants/               # Cross-cutting correctness and safety properties
├── scenarios/                # Stable adversarial scenario packs
├── references/               # Technical references by topic
├── engineering/              # Engineering methodology references
├── templates/                # Output templates
└── scripts/                  # Read-only inspection and validation helpers
```

Root-level files:

```text
install.sh      # Installer
uninstall.sh    # Uninstaller
CHANGELOG.md    # Version history
VERSION         # Canonical version string
```

## Conventions

### Documentation language

All repository documentation must be written in **English**.

This applies to:

- `README.md` files;
- `SKILL.md`;
- `CONTRIBUTING.md` and `CHANGELOG.md`;
- files under `docs/`;
- workflow, auditor, invariant, scenario, engineering, reference, and template Markdown files;
- code comments intended to document public or repository-level behavior.

Do not introduce mixed-language documentation. User-facing product text may use another language only when the product requirement explicitly calls for it; the repository documentation that explains that behavior must still be written in English.

Before committing documentation changes, review newly added or modified prose for accidental non-English text.

### Versioning

This project uses semantic versioning (`major.minor.patch` for releases, for example `3.1.0`).

Before releasing, these canonical sources must contain the same version string:

| Source | Location |
|---|---|
| `VERSION` | Root file, plain text, single line |
| `SKILL.md` metadata | `version:` field in YAML frontmatter |
| `scripts/banner.sh` | `VERSION="x.y.z"` |
| `install.sh` | `INSTALLER_VERSION="x.y.z"` |
| Git tag | `vX.Y.Z` |

The release workflow validates these sources before building a release package.

### Markdown style

- Use LF line endings, enforced by `.gitattributes`.
- Use ATX headings (`#`, `##`, `###`).
- Keep lines reasonably short where practical, without harming readability.
- Prefer fenced code blocks with explicit language tags.
- Prefer actionable engineering language over generic prose.
- Avoid duplicating rules that already have a canonical source of truth.

### Shell scripts

- All scripts must pass `bash -n`.
- Use `set -euo pipefail` unless a script has a documented reason not to.
- Honor `NO_COLOR` and `MQL5_ENGINEERING_NO_ANIMATION=1` where applicable.
- Inspection and validation helpers must not silently modify target projects.

### Reference files (`references/`)

- Keep one primary topic per file.
- Start with a clear topic heading.
- List actionable checks the agent should perform, not abstract theory alone.
- Avoid reproducing official MQL5 documentation verbatim; cite or link to the authoritative source instead.

### Auditor briefs (`auditors/`)

- Each file is an independent review brief for one audit domain.
- Use an adversarial engineering stance: actively challenge assumptions.
- Distinguish confirmed defects from probable risks, environment-dependent behavior, and test gaps.
- Use evidence labels defined by the skill rather than inventing new confidence vocabularies casually.

### Invariants and scenarios

- Invariants must describe properties that can be verified or falsified.
- Scenario IDs must remain stable once published unless there is a strong compatibility reason to change them.
- Scenario packs should exercise real failure modes rather than restating auditor checklists.

## Making a Change

1. Create a focused branch.
2. Inspect the current source-of-truth files before editing.
3. Make the smallest coherent change that solves the problem.
4. Keep all repository documentation in English.
5. Update `CHANGELOG.md` under `## Unreleased` for material changes.
6. Run applicable syntax and consistency checks.
7. Review the final diff for duplication, stale references, and unintended behavior changes.
8. Open a pull request with a clear explanation of the problem, the change, and validation performed.

## Releasing a New Version

1. Decide the new version string.
2. Update `VERSION`.
3. Update `SKILL.md` metadata.
4. Update `scripts/banner.sh`.
5. Update `install.sh`.
6. Move applicable `## Unreleased` entries in `CHANGELOG.md` to the release section.
7. Run release validation.
8. Commit and tag the release.
9. Push the branch and matching tag.
10. Confirm that the release workflow completes successfully.

## Questions

Open a GitHub issue for questions, bug reports, or feature requests.
