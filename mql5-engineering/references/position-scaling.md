# Position scaling / grid / averaging review

Use for grids, averaging, pyramiding, partial additions, recovery structures, or any strategy that changes exposure after the first entry.

Reconstruct:

```text
initial volume
+ level 1
+ level 2
+ ...
= maximum cumulative exposure
```

Document:

- level trigger;
- distance calculation;
- volume progression;
- maximum levels;
- average-price calculation;
- shared or per-level stop;
- full-structure worst-case loss;
- margin use;
- reset/restart reconstruction.

## Gap and same-tick scenarios

Test logically whether a single market update can cross multiple levels and unintentionally trigger several additions.

Check simultaneous truths such as:

- stop condition and next-level condition;
- multiple grid levels crossed in a gap;
- retry plus new-level trigger;
- reconnect reconstructing a level incorrectly.

## Risk consistency

Compare advertised/configured maximum risk with the full structure, not only the initial order.
