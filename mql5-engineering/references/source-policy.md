# Source policy

## Authority order

For technical claims, use this hierarchy:

1. **Current MQL5 Reference** — https://www.mql5.com/en/docs
2. **Current MetaTrader 5 / Strategy Tester documentation** from MetaQuotes.
3. **MQL5 Programming for Traders** from MetaQuotes as an official explanatory companion when available.
4. **Project documentation** for intended product behavior: `docs/master.md`, `docs/spec*.md`, architecture and design docs.
5. **Broker / exchange / instrument specification** for broker-specific and instrument-specific facts.
6. **Official regulator sources** for compliance questions.
7. Other ebooks, articles, forum posts, CodeBase examples, and community material only as secondary context.

If sources conflict on MQL5 semantics, current official documentation wins.

## Useful official MQL5 sections

Base reference:

- https://www.mql5.com/en/docs

High-impact review topics include:

- `OrderSend` — `/trading/ordersend`
- `OrderCheck` — `/trading/ordercheck`
- `OnTradeTransaction` — `/event_handlers/ontradetransaction`
- `OnTick` — `/event_handlers/ontick`
- `OnCalculate` — `/event_handlers/oncalculate`
- `WebRequest` — `/network/webrequest`
- account/symbol properties — `/account` and `/marketinformation`
- Strategy Tester/runtime testing — `/runtime/testing`

## Rules for external material

Secondary books and examples can suggest checks, but do not copy an implementation simply because it appears in an ebook.

Examples of points that require verification against current docs:

- filling policy;
- trade request result semantics;
- Strategy Tester tick modes;
- event ordering;
- indicator/tester limitations;
- broker execution assumptions.

## Evidence labels

Use:

- `CONFIRMED BY CODE`
- `CONFIRMED BY OFFICIAL DOCUMENTATION`
- `PROBABLE RISK`
- `HYPOTHESIS — TEST REQUIRED`
- `BROKER / ENVIRONMENT DEPENDENT`
