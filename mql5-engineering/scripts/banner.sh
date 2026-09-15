#!/usr/bin/env bash
set -u

VERSION="2.5"
AUTHOR="Fernando Scherer"
GITHUB="https://github.com/fernandosscherer/mql5-Engineering.git"

# Animation can be disabled with --static or MQL5_ENGINEERING_NO_ANIMATION=1.
STATIC=0
if [[ "${1:-}" == "--static" ]] || [[ "${MQL5_ENGINEERING_NO_ANIMATION:-0}" == "1" ]]; then
  STATIC=1
fi

supports_ansi=0
if [[ -t 1 ]] && [[ "${TERM:-dumb}" != "dumb" ]]; then
  supports_ansi=1
fi

# Retro CRT palette: black terminal background + green-only foreground.
if [[ "$supports_ansi" -eq 1 ]] && [[ -z "${NO_COLOR:-}" ]]; then
  GREEN_BRIGHT=$'\033[1;32m'
  GREEN=$'\033[0;32m'
  GREEN_DIM=$'\033[2;32m'
  BOLD=$'\033[1m'
  RESET=$'\033[0m'
else
  GREEN_BRIGHT=""
  GREEN=""
  GREEN_DIM=""
  BOLD=""
  RESET=""
fi

cleanup() {
  if [[ "$supports_ansi" -eq 1 ]]; then
    printf '\033[?25h'
  fi
}
trap cleanup EXIT INT TERM

hero_lines=(
'╔══════════════════════════════════════════════════════════════════════╗'
'║                                                                      ║'
'║   ███╗   ███╗ ██████╗ ██╗     ███████╗                             ║'
'║   ████╗ ████║██╔═══██╗██║     ██╔════╝                             ║'
'║   ██╔████╔██║██║   ██║██║     ███████╗                             ║'
'║   ██║╚██╔╝██║██║▄▄ ██║██║     ╚════██║                             ║'
'║   ██║ ╚═╝ ██║╚██████╔╝███████╗███████║                             ║'
'║   ╚═╝     ╚═╝ ╚══▀▀═╝ ╚══════╝╚══════╝                             ║'
'║                                                                      ║'
'║                 E N G I N E E R I N G                               ║'
'║                                                                      ║'
'║          [ BUILD ] [ IMPROVE ] [ DEBUG ] [ AUDIT ]                  ║'
'║                                                                      ║'
'╚══════════════════════════════════════════════════════════════════════╝'
)

print_hero_banner() {
  local line
  printf '\n'
  for line in "${hero_lines[@]}"; do
    printf '%s%s%s\n' "$GREEN_BRIGHT" "$line" "$RESET"
    if [[ "$STATIC" -ne 1 ]] && [[ "$supports_ansi" -eq 1 ]]; then
      sleep 0.018
    fi
  done
  printf '\n%s                     MQL5 Engineering v%s%s\n' "$GREEN_BRIGHT" "$VERSION" "$RESET"
  printf '\n%s          Plan → Approve → Execute → Validate → Auditar%s\n\n' "$GREEN" "$RESET"
}

animate_progress() {
  local label="$1"
  local total=10
  local i filled empty bar

  if [[ "$STATIC" -eq 1 ]] || [[ "$supports_ansi" -ne 1 ]]; then
    printf '%s[▓▓▓▓▓▓▓▓▓▓] %-30s [OK]%s\n' "$GREEN" "$label" "$RESET"
    return
  fi

  for ((i=1; i<=total; i++)); do
    printf -v filled '%*s' "$i" ''
    filled=${filled// /▓}
    printf -v empty '%*s' "$((total-i))" ''
    empty=${empty// /░}
    bar="${filled}${empty}"
    printf '\r\033[2K%s[%s] %s%s' "$GREEN" "$bar" "$label" "$RESET"
    sleep 0.035
  done
  printf '\r\033[2K%s[▓▓▓▓▓▓▓▓▓▓] %-30s %s[OK]%s\n' "$GREEN" "$label" "$GREEN_BRIGHT" "$RESET"
}

status_line() {
  local label="$1"
  printf '%s> %-31s %s[OK]%s\n' "$GREEN_DIM" "$label" "$GREEN_BRIGHT" "$RESET"
}

if [[ "$supports_ansi" -eq 1 ]] && [[ "$STATIC" -ne 1 ]]; then
  printf '\033[?25l'
fi

print_hero_banner
printf '%s[MQL5] BOOTING ENGINEERING SYSTEM...%s\n\n' "$GREEN_BRIGHT" "$RESET"
animate_progress "PROJECT DISCOVERY"
animate_progress "MQL5 REFERENCE"
animate_progress "TRADING SAFEGUARDS"
animate_progress "DOCUMENTATION PROTOCOL"
animate_progress "QUALITY GATES"
printf '\n%sSYSTEM ONLINE%s\n\n' "$GREEN_BRIGHT" "$RESET"

status_line "Project Discovery"
status_line "MQL5 Engineering Rules"
status_line "Trading Safety"
status_line "Risk Management"
status_line "Licensing / Backend"
status_line "Documentation"
status_line "Quality Gates"
printf '\n'

printf '%s┌────────────────────────────────────────────────────────────────────┐%s\n' "$GREEN_DIM" "$RESET"
printf '%s│%s  %sMQL5 ENGINEERING SYSTEM v%-4s%s                                   %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_BRIGHT" "$VERSION" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s                                                                    %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s  [01] BUILD      Create Expert Advisors / Indicators               %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s  [02] IMPROVE    Improve existing projects                         %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s  [03] DEBUG      Diagnose and correct defects                      %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s  [04] AUDIT      Production and safety audit                       %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s                                                                    %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s  SYSTEM STATUS : %sREADY%s                                             %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_BRIGHT" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s  SAFETY MODE   : PLAN BEFORE EXECUTION                             %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s                                                                    %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s│%s  Plan → Approve → Execute → Validate → Auditar                     %s│%s\n' "$GREEN_DIM" "$RESET" "$GREEN_DIM" "$RESET"
printf '%s├────────────────────────────────────────────────────────────────────┤%s\n' "$GREEN_DIM" "$RESET"
printf '%s│%s  Author : %-57s%s│%s\n' "$GREEN_DIM" "$RESET" "$AUTHOR" "$GREEN_DIM" "$RESET"
printf '%s│%s  GitHub : %-57s%s│%s\n' "$GREEN_DIM" "$RESET" "$GITHUB" "$GREEN_DIM" "$RESET"
printf '%s└────────────────────────────────────────────────────────────────────┘%s\n' "$GREEN_DIM" "$RESET"
printf '\n%sREADY FOR ENGINEERING.%s\n' "$GREEN_BRIGHT" "$RESET"
printf '%sPlan → Approve → Execute → Validate → Auditar%s\n\n' "$GREEN" "$RESET"
