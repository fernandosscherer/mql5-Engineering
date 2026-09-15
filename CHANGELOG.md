# Changelog

## 2.7 — 2026-09-15

- Replaced the grouped startup questionnaire with an Interactive Planning Wizard.
- The wizard now asks one question at a time and waits for the user's answer before continuing.
- Added dynamic question skipping when information is already known or not applicable.
- Preserved the final open-ended prompt so the user can describe the objective in their own words.
- After the wizard, the skill summarizes the requirements, performs discovery, presents the plan, and waits for approval before execution.
- Kept activation output silent: banner, `Carregando...`, `Pronto para uso!`, then the first wizard question only.
- Renamed activation credit labels to `Created by` and `Repository`.
- Updated version to 2.7.

## 2.6 — 2026-09-15

- Added silent activation protocol for a cleaner OpenCode panel experience.
- Removed verbose boot-component lists from the activation output.
- Activation now shows only the retro green ASCII banner/credits, animated `Carregando...`, and `Pronto para uso!` before the planning questionnaire.
- Added instructions not to echo internal skill/reference file contents or narrate routine reads.
- Preserved ANSI green-only retro terminal styling and static/NO_COLOR fallbacks.
- Clarified that host applications may still render their own tool/activity UI independently of the skill.
- Updated skill version to 2.6.

## 2.5 — 2026-09-15

- Added GitHub-ready one-line terminal installer.
- Added install/update/uninstall actions.
- Added installation targets: universal, OpenCode, Claude, project-local, and all.
- Added automatic backup before replacement.
- Added `--ref` support for branch/tag/commit installation and rollback.
- Added green retro installer UI consistent with the skill activation banner.
- Added local-source mode for offline testing.
- Added GitHub Actions release workflow with version validation, ZIP artifact, and SHA-256 checksum.
- Added GitHub repository distribution documentation.
- Updated skill version to 2.5.

## 2.4

- Replaced website credit with the official GitHub repository URL.
- Retained retro green terminal activation experience.
