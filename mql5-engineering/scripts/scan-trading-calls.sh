#!/usr/bin/env bash
set -euo pipefail
root="${1:-.}"
printf '%s\n' 'TRIAGE ONLY — manual engineering review required.'
grep -RInE --include='*.mq5' --include='*.mqh' 'OrderSendAsync|OrderSend|OrderCheck|OnTradeTransaction|CTrade|PositionClose|PositionModify|OrderDelete|Buy\(|Sell\(' "$root" || true
