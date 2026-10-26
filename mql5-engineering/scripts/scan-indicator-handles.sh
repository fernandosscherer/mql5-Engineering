#!/usr/bin/env bash
set -euo pipefail
root="${1:-.}"
printf '%s\n' 'TRIAGE ONLY — manual handle lifecycle/data validation review required.'
grep -RInE --include='*.mq5' --include='*.mqh' 'iMA\(|iATR\(|iRSI\(|iMACD\(|iCustom\(|CopyBuffer\(|IndicatorRelease\(' "$root" || true
