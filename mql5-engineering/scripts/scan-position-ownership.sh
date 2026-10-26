#!/usr/bin/env bash
set -euo pipefail
root="${1:-.}"
printf '%s\n' 'TRIAGE ONLY — inspect ownership semantics manually; matches are not defects.'
grep -RInE --include='*.mq5' --include='*.mqh' 'PositionSelect\(|PositionSelectByTicket|POSITION_MAGIC|ORDER_MAGIC|DEAL_MAGIC|SetExpertMagicNumber|PositionsTotal|OrdersTotal' "$root" || true
