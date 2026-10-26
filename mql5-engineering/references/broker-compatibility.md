# Broker Compatibility Matrix

Do not assume that a symbol name implies identical trading conditions across brokers.

Inspect, when material:
- trade/execution mode;
- allowed filling modes;
- netting versus hedging account model;
- stops level and freeze level;
- volume min/max/step;
- tick size and tick value;
- contract size;
- point/digits;
- profit, margin and account currencies;
- margin model/leverage effects;
- trading sessions/market status;
- symbol suffix/prefix and availability.

Classify conclusions as:
- CODE DEFECT: implementation contradicts known requirements/semantics independent of broker variation.
- BROKER DEPENDENT: result changes with broker configuration.
- SYMBOL DEPENDENT: result depends on actual symbol properties.
- ACCOUNT MODEL DEPENDENT: netting/hedging or account properties materially change behavior.
- TEST REQUIRED: code review cannot establish the runtime outcome reliably.

Prefer runtime symbol/account properties and official MQL5 semantics over hard-coded broker assumptions.
