#!/usr/bin/env python3
"""Deterministic helper for inspecting a simple stop-based risk sizing formula.
TRIAGE ONLY — manual engineering review required.
"""
import argparse
import math


def positive(name, value):
    if not math.isfinite(value) or value <= 0:
        raise ValueError(f"{name} must be finite and > 0")
    return value


def floor_to_step(value, step):
    return math.floor((value + 1e-12) / step) * step


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--equity", type=float, required=True)
    p.add_argument("--risk-percent", type=float, required=True)
    p.add_argument("--entry", type=float, required=True)
    p.add_argument("--stop", type=float, required=True)
    p.add_argument("--tick-size", type=float, required=True)
    p.add_argument("--tick-value", type=float, required=True)
    p.add_argument("--volume-min", type=float, required=True)
    p.add_argument("--volume-max", type=float, required=True)
    p.add_argument("--volume-step", type=float, required=True)
    a = p.parse_args()

    for name in ("equity", "tick_size", "tick_value", "volume_min", "volume_max", "volume_step"):
        positive(name, getattr(a, name))
    if not (0 < a.risk_percent <= 100):
        raise ValueError("risk_percent must be > 0 and <= 100")
    if a.volume_min > a.volume_max:
        raise ValueError("volume_min cannot exceed volume_max")

    distance = abs(a.entry - a.stop)
    positive("stop_distance", distance)
    target = a.equity * a.risk_percent / 100.0
    loss_per_lot = (distance / a.tick_size) * a.tick_value
    positive("loss_per_lot", loss_per_lot)
    raw = target / loss_per_lot
    normalized = floor_to_step(raw, a.volume_step)

    if normalized < a.volume_min:
        normalized = 0.0
    normalized = min(normalized, a.volume_max)
    actual = normalized * loss_per_lot
    deviation = actual - target

    print("TRIAGE ONLY — verify symbol economics and production sizing path manually")
    print(f"target_risk={target:.8f}")
    print(f"loss_per_lot={loss_per_lot:.8f}")
    print(f"raw_volume={raw:.8f}")
    print(f"normalized_volume={normalized:.8f}")
    print(f"resulting_risk={actual:.8f}")
    print(f"risk_deviation={deviation:.8f}")
    if normalized == 0.0:
        print("decision=NO_VALID_VOLUME_AT_OR_BELOW_TARGET_RISK")


if __name__ == "__main__":
    main()
