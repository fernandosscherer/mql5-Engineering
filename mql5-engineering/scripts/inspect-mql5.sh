#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"

if [[ ! -d "$ROOT" ]]; then
  echo "Directory not found: $ROOT" >&2
  exit 2
fi

printf 'MQL5 Engineering — read-only project inspection\n'
printf 'Root: %s\n\n' "$ROOT"

printf '== MQL5 source files ==\n'
find "$ROOT" -type f \( -name '*.mq5' -o -name '*.mqh' -o -name '*.set' \) -print 2>/dev/null | sort || true

printf '\n== Documentation / project metadata ==\n'
find "$ROOT" -type f \( \
  -iname 'README*' -o \
  -iname 'CHANGELOG*' -o \
  -path '*/docs/*.md' -o \
  -iname 'master.md' -o \
  -iname '*spec*.md' -o \
  -iname '*design*.md' -o \
  -iname '*architecture*.md' -o \
  -iname '*licens*.md' \
\) -print 2>/dev/null | sort || true

printf '\n== Event handlers ==\n'
grep -RInE --include='*.mq5' --include='*.mqh' \
  '\b(OnInit|OnDeinit|OnTick|OnTimer|OnTrade|OnTradeTransaction|OnChartEvent|OnCalculate|OnBookEvent)\b' \
  "$ROOT" 2>/dev/null || true

printf '\n== Trading / execution hotspots ==\n'
grep -RInE --include='*.mq5' --include='*.mqh' \
  '\b(OrderCheck|OrderSendAsync|OrderSend|CTrade|CPositionInfo|ResultRetcode|PositionSelect|PositionSelectByTicket|PositionGet|OrderGet|HistorySelect|HistoryDealGet|HistoryOrderGet|OrderCalcProfit|OrderCalcMargin|MqlTradeRequest|MqlTradeResult)\b' \
  "$ROOT" 2>/dev/null || true

printf '\n== Indicator / timeseries hotspots ==\n'
grep -RInE --include='*.mq5' --include='*.mqh' \
  '\b(CopyBuffer|CopyRates|CopyTicks|CopyTime|BarsCalculated|SetIndexBuffer|ArraySetAsSeries|IndicatorRelease|INVALID_HANDLE|prev_calculated|rates_total)\b' \
  "$ROOT" 2>/dev/null || true

printf '\n== Symbol / risk hotspots ==\n'
grep -RInE --include='*.mq5' --include='*.mqh' \
  '\b(SYMBOL_(VOLUME|TRADE|ORDER|FILLING|POINT|DIGITS)|ACCOUNT_MARGIN|ACCOUNT_EQUITY|ACCOUNT_BALANCE|risk|Risk|lot|Lot|volume|Volume|stop|Stop|spread|Spread|magic|Magic)\b' \
  "$ROOT" 2>/dev/null || true

printf '\n== Licensing / network hotspots ==\n'
grep -RInoE --include='*.mq5' --include='*.mqh' \
  '\b(WebRequest|Socket|ACCOUNT_LOGIN|license|License|licence|Licence|activation|Activation|token|Token|api|API)\b' \
  "$ROOT" 2>/dev/null || true

printf '\nInspection complete. No files were modified.\n'
