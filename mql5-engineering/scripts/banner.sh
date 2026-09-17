#!/usr/bin/env bash
set -u

VERSION="3.0"
CREATED_BY="FERNANDO SCHERER"
REPOSITORY="https://github.com/fernandosscherer/mql5-Engineering.git"

STATIC=0
if [[ "${1:-}" == "--static" ]] || [[ "${MQL5_ENGINEERING_NO_ANIMATION:-0}" == "1" ]]; then
  STATIC=1
fi

supports_ansi=0
if [[ -t 1 ]] && [[ "${TERM:-dumb}" != "dumb" ]]; then
  supports_ansi=1
fi

if [[ "$supports_ansi" -eq 1 ]] && [[ -z "${NO_COLOR:-}" ]]; then
  GREEN_BRIGHT=$'\033[1;32m'
  GREEN=$'\033[0;32m'
  GREEN_DIM=$'\033[2;32m'
  WHITE=$'\033[0;37m'
  WHITE_BRIGHT=$'\033[1;37m'
  RESET=$'\033[0m'
else
  GREEN_BRIGHT=""
  GREEN=""
  GREEN_DIM=""
  WHITE=""
  WHITE_BRIGHT=""
  RESET=""
fi

cleanup() {
  if [[ "$supports_ansi" -eq 1 ]]; then
    printf '\033[?25h'
  fi
}
trap cleanup EXIT INT TERM

hero_lines=(
'╔══════════════════════════════════════════════════════════════════════════╗'
'║                                                                          ║'
'║   ███╗   ███╗ ██████╗ ██╗     ███████╗                                 ║'
'║   ████╗ ████║██╔═══██╗██║     ██╔════╝                                 ║'
'║   ██╔████╔██║██║   ██║██║     ███████╗                                 ║'
'║   ██║╚██╔╝██║██║▄▄ ██║██║     ╚════██║                                 ║'
'║   ██║ ╚═╝ ██║╚██████╔╝███████╗███████║                                 ║'
'║   ╚═╝     ╚═╝ ╚══▀▀═╝ ╚══════╝╚══════╝                                 ║'
'║                                                                          ║'
'║                 E N G I N E E R I N G                                   ║'
'║                                                                          ║'
'║      [ BUILD ] [ IMPROVE ] [ DEBUG ] [ REVIEW ] [ AUDIT ]               ║'
'║                                                                          ║'
'╚══════════════════════════════════════════════════════════════════════════╝'
)

print_banner() {
  local line
  printf '\n'

  for line in "${hero_lines[@]}"; do
    printf '%s%s%s\n' "$GREEN_BRIGHT" "$line" "$RESET"
    if [[ "$STATIC" -ne 1 ]] && [[ "$supports_ansi" -eq 1 ]]; then
      sleep 0.012
    fi
  done

  printf '\n%s                     MQL5 Engineering v%s%s\n' "$WHITE_BRIGHT" "$VERSION" "$RESET"
  printf '%s             Discover → Route → Engineer → Validate → Audit%s\n' "$GREEN" "$RESET"
  printf '%s                  Facts → Agent | Decisions → User%s\n' "$GREEN_DIM" "$RESET"
  printf '\n%sCREATED BY :%s %s%s%s\n' "$GREEN_BRIGHT" "$RESET" "$WHITE_BRIGHT" "$CREATED_BY" "$RESET"
  printf '%sGITHUB     :%s %s%s%s\n\n' "$GREEN_BRIGHT" "$RESET" "$WHITE" "$REPOSITORY" "$RESET"
}

loading_animation() {
  if [[ "$STATIC" -eq 1 ]] || [[ "$supports_ansi" -ne 1 ]]; then
    printf '%sCarregando...%s\n' "$GREEN" "$RESET"
    printf '%sPronto para uso!%s\n\n' "$WHITE_BRIGHT" "$RESET"
    return
  fi

  local frames=('Carregando   ' 'Carregando.  ' 'Carregando.. ' 'Carregando...')
  local i

  for i in 0 1 2 3 0 1 2 3; do
    printf '\r\033[2K%s%s%s' "$GREEN" "${frames[$i]}" "$RESET"
    sleep 0.15
  done

  printf '\r\033[2K%sPronto para uso!%s\n\n' "$WHITE_BRIGHT" "$RESET"
}

if [[ "$supports_ansi" -eq 1 ]] && [[ "$STATIC" -ne 1 ]]; then
  printf '\033[?25l'
fi

print_banner
loading_animation
