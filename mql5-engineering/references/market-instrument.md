# Market and instrument portability

This skill is market-agnostic. Do not assume a B3 future, Forex pair, XAUUSD, CFD, index, or crypto-like broker symbol shares another instrument's economics.

## Query instrument properties

Review relevant dynamic properties, including as applicable:

- `SYMBOL_DIGITS`
- `SYMBOL_POINT`
- `SYMBOL_TRADE_TICK_SIZE`
- `SYMBOL_TRADE_TICK_VALUE`
- `SYMBOL_TRADE_TICK_VALUE_PROFIT`
- `SYMBOL_TRADE_TICK_VALUE_LOSS`
- `SYMBOL_TRADE_CONTRACT_SIZE`
- volume limits/step;
- trade mode;
- order mode;
- filling mode;
- execution mode;
- stops level;
- freeze level;
- sessions.

## Hardcoded assumptions

Flag assumptions such as:

- one point always equals a fixed currency amount;
- one lot always represents the same contract notion;
- all brokers use identical symbol names;
- all symbols accept the same filling type;
- all sessions follow local machine time;
- spread/tick behavior is identical across markets.

## Exchange versus OTC

Treat account and symbol modes as runtime facts. B3/exchange products and OTC/Forex/metal products may differ in execution, margin, sessions, and order permissions.
