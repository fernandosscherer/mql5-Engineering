# Indicator engineering review

## Core lifecycle

Review:

- `OnInit`
- `OnCalculate`
- `OnDeinit`
- buffer registration;
- plot registration;
- external indicator handles.

## Buffer contract

For indicators consumed by EAs, document a stable contract:

- buffer index;
- semantic meaning;
- valid/empty value behavior;
- whether value is final only after bar close;
- whether historical values can change;
- timeframe/symbol assumptions.

## `prev_calculated`

Verify first calculation, incremental update, and reset/recalculation paths. Do not assume `prev_calculated` is always nonzero after initial startup; history changes can require broader recalculation.

## Plot versus buffer mapping

Plot indexes and buffer indexes are not universally one-to-one. Drawing types can consume multiple buffers. Verify `SetIndexBuffer`, `indicator_buffers`, `indicator_plots`, and plot draw types consistently.

## Repainting / look-ahead

Distinguish:

- expected current-bar movement;
- legitimate historical recalculation due to new data;
- future-data leakage/look-ahead;
- unintended repainting that invalidates EA signals or backtests.

## External handles

Check `INVALID_HANDLE`, `BarsCalculated`, `CopyBuffer`, source timeframe/symbol synchronization, and cleanup.

## Performance

Use `prev_calculated` sensibly, avoid unnecessary full-history recomputation, and avoid expensive object/UI work on every calculation unless justified.
