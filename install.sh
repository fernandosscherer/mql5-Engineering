#!/usr/bin/env bash
set -Eeuo pipefail

PROGRAM="MQL5 Engineering Installer"
REPO_SLUG="fernandosscherer/mql5-Engineering"
DEFAULT_REF="main"
SKILL_NAME="mql5-engineering"
ACTION="install"
TARGET="universal"
REF="${MQL5_ENGINEERING_REF:-$DEFAULT_REF}"
ASSUME_YES=0
STATIC=0
KEEP_BACKUP=1

usage() {
  cat <<'USAGE'
MQL5 Engineering Installer

Usage:
  install.sh [install|update|uninstall] [options]

Options:
  --target TARGET   universal | opencode | claude | project | all
                    default: universal
  --ref REF         Git branch, tag, or commit to install. default: main
  --yes, -y         Do not ask for confirmation
  --static          Disable installer animation
  --no-backup       Do not keep backup when replacing an existing install
  --help, -h        Show this help

Targets:
  universal   ~/.agents/skills/mql5-engineering
  opencode    ~/.config/opencode/skills/mql5-engineering
  claude      ~/.claude/skills/mql5-engineering
  project     ./.agents/skills/mql5-engineering
  all         Install to universal, OpenCode, and Claude locations

Examples:
  ./install.sh
  ./install.sh update
  ./install.sh install --target opencode
  ./install.sh install --target project --ref v2.8
  ./install.sh uninstall --target universal --yes
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    install|update|uninstall) ACTION="$1"; shift ;;
    --target) TARGET="${2:-}"; shift 2 ;;
    --ref) REF="${2:-}"; shift 2 ;;
    --yes|-y) ASSUME_YES=1; shift ;;
    --static) STATIC=1; shift ;;
    --no-backup) KEEP_BACKUP=0; shift ;;
    --help|-h) usage; exit 0 ;;
    *) printf 'Unknown argument: %s\n\n' "$1" >&2; usage >&2; exit 2 ;;
  esac
done

case "$TARGET" in
  universal|opencode|claude|project|all) ;;
  *) printf 'Invalid target: %s\n' "$TARGET" >&2; exit 2 ;;
esac

if [[ "${MQL5_ENGINEERING_NO_ANIMATION:-0}" == "1" ]]; then STATIC=1; fi

supports_ansi=0
if [[ -t 1 && "${TERM:-dumb}" != "dumb" && -z "${NO_COLOR:-}" ]]; then supports_ansi=1; fi
if [[ "$supports_ansi" -eq 1 ]]; then
  G=$'\033[0;32m'; GB=$'\033[1;32m'; GD=$'\033[2;32m'; R=$'\033[0m'
else
  G=""; GB=""; GD=""; R=""
fi

cleanup_tmp=""
cleanup() {
  [[ -n "$cleanup_tmp" && -d "$cleanup_tmp" ]] && rm -rf "$cleanup_tmp"
  if [[ -t 1 ]]; then printf '\033[?25h' 2>/dev/null || true; fi
}
trap cleanup EXIT INT TERM

hero() {
  printf '\n%s╔══════════════════════════════════════════════════════════════╗%s\n' "$GB" "$R"
  printf '%s║                    MQL5 ENGINEERING                          ║%s\n' "$GB" "$R"
  printf '%s║                      INSTALLER                               ║%s\n' "$GB" "$R"
  printf '%s╚══════════════════════════════════════════════════════════════╝%s\n' "$GB" "$R"
  printf '%sAuthor : Fernando Scherer%s\n' "$GD" "$R"
  printf '%sGitHub : https://github.com/%s%s\n\n' "$GD" "$REPO_SLUG" "$R"
}

step() {
  local label="$1"
  if [[ "$STATIC" -eq 0 && -t 1 ]]; then
    printf '%s[▓▓▓░░░░░░░] %s%s' "$G" "$label" "$R"
    sleep 0.08
    printf '\r\033[2K%s[▓▓▓▓▓▓▓▓▓▓] %-34s %s[OK]%s\n' "$G" "$label" "$GB" "$R"
  else
    printf '%s[OK]%s %s\n' "$GB" "$R" "$label"
  fi
}

need_cmd() {
  command -v "$1" >/dev/null 2>&1 || { printf '%s[FAIL]%s Required command not found: %s\n' "$GB" "$R" "$1" >&2; exit 1; }
}

confirm() {
  local prompt="$1"
  if [[ "$ASSUME_YES" -eq 1 ]]; then return 0; fi
  if [[ -r /dev/tty ]]; then
    printf '%s [y/N] ' "$prompt" > /dev/tty
    local answer=""
    IFS= read -r answer < /dev/tty || true
    [[ "$answer" =~ ^[Yy]([Ee][Ss])?$ ]]
  else
    return 1
  fi
}

resolve_targets() {
  case "$TARGET" in
    universal) printf '%s\n' "$HOME/.agents/skills/$SKILL_NAME" ;;
    opencode) printf '%s\n' "$HOME/.config/opencode/skills/$SKILL_NAME" ;;
    claude) printf '%s\n' "$HOME/.claude/skills/$SKILL_NAME" ;;
    project) printf '%s\n' "$PWD/.agents/skills/$SKILL_NAME" ;;
    all)
      printf '%s\n' "$HOME/.agents/skills/$SKILL_NAME"
      printf '%s\n' "$HOME/.config/opencode/skills/$SKILL_NAME"
      printf '%s\n' "$HOME/.claude/skills/$SKILL_NAME"
      ;;
  esac
}

remove_target() {
  local dest="$1"
  if [[ ! -e "$dest" ]]; then
    printf '%s[INFO]%s Not installed: %s\n' "$GD" "$R" "$dest"
    return 0
  fi
  if [[ "$ASSUME_YES" -ne 1 ]] && ! confirm "Remove $dest?"; then
    printf '%s[SKIP]%s %s\n' "$GD" "$R" "$dest"
    return 0
  fi
  rm -rf "$dest"
  printf '%s[OK]%s Removed %s\n' "$GB" "$R" "$dest"
}

install_to() {
  local source_dir="$1" dest="$2"
  local parent backup=""
  parent="$(dirname "$dest")"
  mkdir -p "$parent"

  if [[ -e "$dest" ]]; then
    if [[ "$ACTION" == "install" && "$ASSUME_YES" -ne 1 ]]; then
      if ! confirm "Existing installation found at $dest. Replace it?"; then
        printf '%s[SKIP]%s %s\n' "$GD" "$R" "$dest"
        return 0
      fi
    fi
    if [[ "$KEEP_BACKUP" -eq 1 ]]; then
      backup="${dest}.backup.$(date +%Y%m%d%H%M%S).$$"
      mv "$dest" "$backup"
      printf '%s[BACKUP]%s %s\n' "$GD" "$R" "$backup"
    else
      rm -rf "$dest"
    fi
  fi

  if ! cp -R "$source_dir" "$dest"; then
    rm -rf "$dest" || true
    if [[ -n "$backup" && -d "$backup" ]]; then mv "$backup" "$dest"; fi
    printf '%s[FAIL]%s Installation failed for %s\n' "$GB" "$R" "$dest" >&2
    exit 1
  fi

  find "$dest/scripts" -type f -name '*.sh' -exec chmod +x {} + 2>/dev/null || true

  if [[ ! -f "$dest/SKILL.md" ]]; then
    rm -rf "$dest"
    if [[ -n "$backup" && -d "$backup" ]]; then mv "$backup" "$dest"; fi
    printf '%s[FAIL]%s SKILL.md missing after installation.\n' "$GB" "$R" >&2
    exit 1
  fi

  local installed_version
  installed_version="$(awk '/^[[:space:]]*version:[[:space:]]*/ {gsub(/["[:space:]]/, "", $2); print $2; exit}' "$dest/SKILL.md" || true)"
  printf '%s[OK]%s Installed %s%s%s to %s\n' "$GB" "$R" "$SKILL_NAME" "${installed_version:+ v}" "$installed_version" "$dest"
}

hero

if [[ "$ACTION" == "uninstall" ]]; then
  while IFS= read -r dest; do remove_target "$dest"; done < <(resolve_targets)
  printf '\n%sUNINSTALL COMPLETE%s\n' "$GB" "$R"
  exit 0
fi

need_cmd curl
need_cmd tar
step "Checking environment"

cleanup_tmp="$(mktemp -d)"
source_dir=""

if [[ -n "${MQL5_ENGINEERING_SOURCE_DIR:-}" ]]; then
  candidate="${MQL5_ENGINEERING_SOURCE_DIR%/}/$SKILL_NAME"
  if [[ -f "$candidate/SKILL.md" ]]; then source_dir="$candidate";
  elif [[ -f "${MQL5_ENGINEERING_SOURCE_DIR%/}/SKILL.md" ]]; then source_dir="${MQL5_ENGINEERING_SOURCE_DIR%/}";
  else
    printf '%s[FAIL]%s MQL5_ENGINEERING_SOURCE_DIR does not contain %s/SKILL.md\n' "$GB" "$R" "$SKILL_NAME" >&2
    exit 1
  fi
  step "Using local source"
else
  archive="$cleanup_tmp/repo.tar.gz"
  url="https://codeload.github.com/$REPO_SLUG/tar.gz/$REF"
  printf '%s> Source:%s %s @ %s\n' "$GD" "$R" "$REPO_SLUG" "$REF"
  curl -fL --retry 3 --connect-timeout 15 --max-time 120 "$url" -o "$archive"
  step "Downloading repository"
  mkdir -p "$cleanup_tmp/extract"
  tar -xzf "$archive" -C "$cleanup_tmp/extract"
  skill_file="$(find "$cleanup_tmp/extract" -type f -path "*/$SKILL_NAME/SKILL.md" -print -quit)"
  if [[ -z "$skill_file" ]]; then
    source_dir=""
  else
    source_dir="$(dirname "$skill_file")"
  fi
  if [[ -z "$source_dir" || ! -f "$source_dir/SKILL.md" ]]; then
    printf '%s[FAIL]%s Could not locate %s/SKILL.md in repository ref %s\n' "$GB" "$R" "$SKILL_NAME" "$REF" >&2
    exit 1
  fi
  step "Validating package"
fi

while IFS= read -r dest; do install_to "$source_dir" "$dest"; done < <(resolve_targets)
step "Setting permissions"

printf '\n%sSYSTEM READY%s\n' "$GB" "$R"
printf '%sAction :%s %s\n' "$GD" "$R" "$ACTION"
printf '%sRef    :%s %s\n' "$GD" "$R" "$REF"
printf '%sTarget :%s %s\n' "$GD" "$R" "$TARGET"
printf '\nRestart your AI agent/session and activate with:\n\n  %sUse the mql5-engineering skill.%s\n\n' "$GB" "$R"
