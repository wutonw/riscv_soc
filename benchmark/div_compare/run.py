"""Compare LOD vs fixed-32 division on the full CPU without editing src/."""
from __future__ import annotations

import argparse
import csv
import hashlib
import importlib.util
import json
from pathlib import Path
import random
import re
import sys

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "tb"))
from xsim_runner import XSimProject

spec = importlib.util.spec_from_file_location("m_stress_reference", ROOT / "tb/mul_dsp_stress/run.py")
ref = importlib.util.module_from_spec(spec)
spec.loader.exec_module(ref)
Program, write_hex = ref.Program, ref.write_hex

LOD = """    always_comb begin
        found = 1'b0;
        leading_one_pos = 6'd0;
        for (int i = 31; i >= 0; i--) begin
            if (!found && dividend_reg[i]) begin
                leading_one_pos = i[5:0] + 6'd1;
                break;
            end
        end
    end
"""


def make_program(pairs, signed=False, dependent=False):
    p = Program()
    ops = ("div", "rem") if signed else ("divu", "remu")
    for index, (a, b) in enumerate(pairs):
        p.context = f"random division pair {index}: {a:#010x}, {b:#010x}"
        p.li(1, a)
        p.li(2, b)
        p.emit(ops[0], 3, 1, 2)
        # Adjacent operations; dependency mode uses the previous quotient.
        p.emit(ops[1], 4, 3 if dependent else 1, 2)
        if dependent:
            p.emit("sw", 4, 26, 0)
            p.emit("lw", 5, 26, 0)
            p.emit(ops[0], 6, 5, 2)
            p.emit("add", 7, 6, 3)
            p.emit("csrrw", 0, 7, 0x304)
            p.emit("csrrs", 8, 0, 0x304)
            p.save(8)
        p.save(3)
        p.save(4)
    p.finish()
    return p


def euclid(pairs):
    p = Program()
    for index, (a, b) in enumerate(pairs):
        p.context = f"Euclidean GCD {index}: {a}, {b}"
        p.li(1, a)
        p.li(2, b)
        p.label(f"gcd_{index}")
        p.emit("remu", 3, 1, 2)
        p.emit("addi", 1, 2, 0)
        p.emit("addi", 2, 3, 0)
        p.emit("bne", 2, 0, f"gcd_{index}")
        p.save(1)
    p.finish()
    return p


def profiles(seed, count):
    rng = random.Random(seed)
    groups = []
    for bits in (8, 16, 32):
        pairs = [(rng.getrandbits(bits), rng.randrange(1, 1 << bits)) for _ in range(count)]
        groups.append((f"unsigned_{bits}", make_program(pairs)))
        pairs = [(rng.randrange(-(1 << (bits-1)), 1 << (bits-1)) & ref.MASK,
                  (rng.choice((-1, 1)) * rng.randrange(1, 1 << (bits-1))) & ref.MASK)
                 for _ in range(count)]
        groups.append((f"signed_{bits}", make_program(pairs, signed=True)))
    pairs = [(rng.getrandbits(31) | 0x80000000, rng.randrange(1, 1 << 32)) for _ in range(count)]
    groups.append(("unsigned_top_bit", make_program(pairs)))
    edges = (0, 1, 2, 3, 7, 0x7f, 0x80, 0xff, 0xffff, 0x10000,
             0x7fffffff, 0x80000000, 0x80000001, 0xfffffffe, 0xffffffff)
    pairs = [(a, b) for a in edges for b in edges]
    groups.extend((("edges_unsigned", make_program(pairs)),
                   ("edges_signed", make_program(pairs, signed=True))))
    pairs = [(rng.getrandbits(16), rng.randrange(1, 1 << 8)) for _ in range(min(count, 256))]
    groups.append(("forward_load_store_csr", make_program(pairs, dependent=True)))
    pairs = [(rng.randrange(1, 1 << 16), rng.randrange(1, 1 << 16)) for _ in range(min(count, 256))]
    groups.append(("euclid_gcd_16", euclid(pairs)))
    return groups


def prepare(build, groups, seed):
    rng = random.Random(seed ^ 0xCAFE)
    images = []
    for name, program in groups:
        if len(program.code) > 8192:
            raise ValueError(f"{name}: instruction ROM overflow; reduce --pairs")
        initial = [rng.getrandbits(32) for _ in range(8192)]
        initial[ref.DONE >> 2] = 0
        memory, regs, stores, coverage = program.reference(initial)
        executed = sum(coverage[op] for op in set(op for op, _, _ in program.code))
        divisions = sum(coverage[op] for op in ref.DIV_OPS)
        files = {key: build / f"{name}_{key}.hex" for key in ("rom", "init", "ram", "regs", "stores")}
        write_hex(files["rom"], [program.encode(i) for i in range(len(program.code))]
                  + [0x13] * (8192 - len(program.code)))
        for key, values, digits in (("init", initial, 8), ("ram", memory, 8),
                                     ("regs", regs, 18), ("stores", stores, 25)):
            write_hex(files[key], values, digits)
        listing = "\n".join(f"{i*4:08x} {program.encode(i):08x} {op} {a} # {context}"
                            for i, (op, a, context) in enumerate(program.code))
        (build / f"{name}.asm").write_text(listing + "\n", encoding="utf-8")
        args = [f"{key.upper()}={path.as_posix()}" for key, path in files.items()]
        args += [f"REG_COUNT={len(regs)}", f"STORE_COUNT={len(stores)}",
                 f"RETIRED={executed}", f"DONE_PC={program.labels['done']-4}"]
        images.append((name, divisions, args))
    return images


def simulation_variant(source, mode):
    # Copy only the original LOD/fixed selector region. All other RTL is identical.
    pattern = r"(?<=    logic        sub_valid;\n).*?(?=    // Stall on the request cycle)"
    match = re.search(pattern, source, flags=re.DOTALL)
    if not match or "leading_one_pos" not in match[0]:
        raise ValueError("Cannot locate LOD selector safely; source format changed")
    if mode == "current":
        return source
    selector = LOD if mode == "lod" else "    assign leading_one_pos = 6'd32;\n"
    return source[:match.start()] + "\n" + selector + "\n" + source[match.end():]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--pairs", type=int, default=256)
    parser.add_argument("--seed", type=lambda s: int(s, 0), default=0xD1A2026)
    parser.add_argument("--mode", choices=("both", "current", "lod", "fixed32"), default="both")
    parser.add_argument("--lod-mhz", type=float)
    parser.add_argument("--fixed-mhz", type=float)
    parser.add_argument("--vivado-bin")
    args = parser.parse_args()
    if not 1 <= args.pairs <= 512:
        parser.error("--pairs must be 1..512")
    if any(x is not None and x <= 0 for x in (args.lod_mhz, args.fixed_mhz)):
        parser.error("frequencies must be positive")
    source_path = ROOT / "src/core/m_ext.sv"
    source = source_path.read_text(encoding="utf-8")
    digest = hashlib.sha256(source_path.read_bytes()).hexdigest()
    build = HERE / "build" / args.mode
    build.mkdir(parents=True, exist_ok=True)
    images = prepare(build, profiles(args.seed, args.pairs), args.seed)
    modes = ("fixed32", "lod") if args.mode == "both" else (args.mode,)
    rows = []
    print(f"Division comparison: seed={args.seed:#x}, pairs/profile={args.pairs}", flush=True)
    try:
        for mode in modes:
            sim = XSimProject(build / mode, args.vivado_bin)
            sim.compile([HERE / "div_compare_tb.sv"])
            if mode != "current":
                variant = sim.build / "m_ext_simulation_only.sv"
                variant.write_text(simulation_variant(source, mode), encoding="utf-8")
                sim.command("xvlog", ["--sv", "--work", "work", variant.as_posix()], "div_variant_compile.log")
            for name, expected_divs, plusargs in images:
                print(f"[{mode}] {name} ...", flush=True)
                output = sim.simulate("div_compare_tb", plusargs, "PASS: division comparison")
                (sim.build / f"{name}.log").write_text(output, encoding="utf-8")
                line = next((line for line in output.splitlines() if line.startswith("METRICS ")), None)
                if not line:
                    raise RuntimeError("Missing metrics")
                metrics = {k: int(v) for k, v in re.findall(r"(\w+)=(\d+)", line)}
                if metrics["divisions"] != expected_divs:
                    raise RuntimeError(f"Division count mismatch: {metrics['divisions']} vs {expected_divs}")
                row = {"mode": mode, "profile": name, **metrics,
                       "cpi": metrics["cycles"] / metrics["retired"],
                       "cycles_per_div": metrics["cycles"] / expected_divs,
                       "ex_latency_avg": metrics["latency_sum"] / expected_divs}
                rows.append(row)
                print(f"  PASS cycles={row['cycles']:,} CPI={row['cpi']:.4f} "
                      f"EX latency={row['ex_latency_avg']:.3f} stalls={row['stalls']:,}", flush=True)
    finally:
        if hashlib.sha256(source_path.read_bytes()).hexdigest() != digest:
            raise RuntimeError("src/core/m_ext.sv changed during the run; results may mix versions")
    with (build / "results.csv").open("w", encoding="utf-8", newline="") as f:
        writer = csv.DictWriter(f, fieldnames=list(rows[0]))
        writer.writeheader()
        writer.writerows(rows)
    summary = []
    if args.mode == "both":
        print("\nProfile                    Fixed cycles  LOD cycles  Cycle speedup  Break-even LOD MHz", flush=True)
        for name, _, _ in images:
            fixed, lod = (next(r for r in rows if r["profile"] == name and r["mode"] == mode)
                          for mode in ("fixed32", "lod"))
            speedup = fixed["cycles"] / lod["cycles"]
            threshold = args.fixed_mhz / speedup if args.fixed_mhz else None
            real_speedup = speedup * args.lod_mhz / args.fixed_mhz if args.lod_mhz and args.fixed_mhz else None
            summary.append({"profile": name, "cycle_speedup": speedup,
                            "break_even_lod_mhz": threshold, "fmax_adjusted_speedup": real_speedup})
            print(f"{name:26} {fixed['cycles']:12,d} {lod['cycles']:10,d} {speedup:13.4f}x "
                  + (f"{threshold:18.3f}" if threshold else "                 --"), flush=True)
            if real_speedup is not None:
                print(f"  With supplied Fmax: LOD throughput / fixed32 = {real_speedup:.4f}x", flush=True)
    (build / "summary.json").write_text(json.dumps({"seed": args.seed, "pairs": args.pairs,
        "source_sha256": digest, "lod_mhz": args.lod_mhz, "fixed_mhz": args.fixed_mhz,
        "results": rows, "comparisons": summary}, indent=2) + "\n", encoding="utf-8")
    print(f"\nPASS: all {len(rows)} full-CPU runs; results: {build / 'results.csv'}", flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, ValueError) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(1)
