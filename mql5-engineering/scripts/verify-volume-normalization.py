#!/usr/bin/env python3
"""Inspect broker-volume normalization policies. TRIAGE ONLY."""
import argparse
import math


def normalize(value, step, policy):
    q = value / step
    if policy == "floor":
        q = math.floor(q + 1e-12)
    elif policy == "ceil":
        q = math.ceil(q - 1e-12)
    else:
        q = round(q)
    return q * step


def main():
    p = argparse.ArgumentParser()
    p.add_argument("value", type=float)
    p.add_argument("--min", dest="vmin", type=float, required=True)
    p.add_argument("--max", dest="vmax", type=float, required=True)
    p.add_argument("--step", type=float, required=True)
    p.add_argument("--policy", choices=("floor", "round", "ceil"), default="floor")
    a = p.parse_args()
    if not all(math.isfinite(x) for x in (a.value, a.vmin, a.vmax, a.step)):
        raise ValueError("all values must be finite")
    if a.step <= 0 or a.vmin <= 0 or a.vmax < a.vmin:
        raise ValueError("invalid min/max/step")
    n = normalize(a.value, a.step, a.policy)
    n = min(max(n, a.vmin), a.vmax)
    print("TRIAGE ONLY — normalization policy must match the product risk policy")
    print(f"policy={a.policy}")
    print(f"input={a.value:.12g}")
    print(f"normalized={n:.12g}")
    print(f"delta={n-a.value:.12g}")


if __name__ == "__main__":
    main()
