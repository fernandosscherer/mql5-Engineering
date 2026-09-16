# Trade execution auditor

Trace: Decision -> validation -> request -> OrderCheck -> send -> retcode -> order -> deal(s) -> position -> protection. Check MqlTradeRequest/Result, OrderCheck, OrderSend/Async/CTrade, retcodes, filling/execution, stops/freeze, volume constraints, permissions, partial fills, and rejects. OrderSend true is not proof of final execution.
