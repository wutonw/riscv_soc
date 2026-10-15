"""Build a single instruction-ROM image, including runtime RAM initialization."""
from __future__ import annotations

import argparse
import json
import random
import shutil
import subprocess
from pathlib import Path

PORT = Path(__file__).resolve().parent
ROOT = PORT.parent.parent
OFFICIAL = ROOT / "benchmark/coremark/official"
MASK = 0xffffffff


def signed(value: int) -> int:
    return (value & MASK) - (0x100000000 if value & 0x80000000 else 0)


def oracle(op: str, a: int, b: int) -> int:
    sa, sb = signed(a), signed(b)
    if op == "add": return (a + b) & MASK
    if op == "sub": return (a - b) & MASK
    if op == "xor": return a ^ b
    if op == "or": return a | b
    if op == "and": return a & b
    if op == "sll": return (a << (b & 31)) & MASK
    if op == "srl": return a >> (b & 31)
    if op == "sra": return (sa >> (b & 31)) & MASK
    if op == "slt": return int(sa < sb)
    if op == "sltu": return int(a < b)
    if op == "mul": return (a * b) & MASK
    if op == "mulh": return ((sa * sb) >> 32) & MASK
    if op == "mulhsu": return ((sa * b) >> 32) & MASK
    if op == "mulhu": return ((a * b) >> 32) & MASK
    if op in ("div", "rem"):
        q = -1 if not b else (abs(sa) // abs(sb)) * (-1 if (sa < 0) != (sb < 0) else 1)
        return (q if op == "div" else (sa if not b else sa - q * sb)) & MASK
    if op == "divu": return (a // b if b else MASK)
    if op == "remu": return (a % b if b else a)
    raise ValueError(op)


def make_selftest(path: Path) -> int:
    rng = random.Random(7020)
    pairs = [(0, 0), (1, 0), (MASK, 1), (0x80000000, MASK),
             (0x80000000, 2), (MASK, 0x80000000), (0x12345678, 31)]
    pairs += [(rng.getrandbits(32), rng.getrandbits(32)) for _ in range(3)]
    lines = [".option norvc", ".option norelax", ".section .text",
             ".globl board_alu_selftest", "board_alu_selftest:"]
    count = 0

    def check(instructions: list[str], expected: int) -> None:
        nonlocal count
        count += 1
        lines.extend([f"li a0, {count}", *instructions,
                      f"li t3, 0x{expected & MASK:08x}", "bne t2, t3, alu_bad"])

    for op in ("add", "sub", "xor", "or", "and", "sll", "srl", "sra", "slt", "sltu",
               "mul", "mulh", "mulhsu", "mulhu", "div", "divu", "rem", "remu"):
        for a, b in pairs:
            check([f"li t0, 0x{a:08x}", f"li t1, 0x{b:08x}", f"{op} t2, t0, t1"], oracle(op, a, b))
    for op, base in (("addi", "add"), ("xori", "xor"), ("ori", "or"), ("andi", "and"),
                     ("slti", "slt"), ("sltiu", "sltu")):
        for imm in (-2048, -1, 0, 2047):
            a = rng.getrandbits(32)
            check([f"li t0, 0x{a:08x}", f"{op} t2, t0, {imm}"], oracle(base, a, imm & MASK))
    for op, base in (("slli", "sll"), ("srli", "srl"), ("srai", "sra")):
        for shift in (0, 1, 16, 31):
            check(["li t0, 0x87654321", f"{op} t2, t0, {shift}"], oracle(base, 0x87654321, shift))
    check(["lui t2, 0xabcde"], 0xabcde000)
    lines.extend(["auipc t0, 0", "auipc t2, 0", "sub t2, t2, t0"])
    check([], 4)
    # RAW chains: don't insert golden comparisons between dependent operations.
    check(["li t0, 7", "li t1, 9", "add t2, t0, t1", "add t2, t2, t0",
           "mul t2, t2, t1", "div t2, t2, t0", "rem t2, t2, t1", "addi t2, t2, 11"], 13)
    check(["li t0, 5", "li t1, 6", "mul t2, t0, t1", "mul t2, t2, t0",
           "mul t2, t2, t1", "add t2, t2, t0"], 905)
    lines += ["li a0, 0", "alu_bad:", "ret"]
    path.write_text("\n".join(lines) + "\n", encoding="ascii")
    return count


def run(*args: str) -> str:
    result = subprocess.run(args, cwd=ROOT, capture_output=True, text=True)
    if result.stderr: print(result.stderr, end="")
    result.check_returncode()
    return result.stdout


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--smoke", action="store_true", help="One iteration, NOT a valid score")
    parser.add_argument("--validation", action="store_true", help="Official validation seeds")
    parser.add_argument("--clock-hz", type=int, default=100000000,
                        help="Actual CPU/cycle-counter clock (default: 100000000)")
    parser.add_argument("--uart-baud", type=int, default=115200,
                        help="UART baud; nonstandard values are allowed only with --smoke")
    args = parser.parse_args()
    if not 0 < args.clock_hz <= 200000000:
        parser.error("--clock-hz must be between 1 and 200000000")
    if not 0 < args.uart_baud <= args.clock_hz // 10:
        parser.error("--uart-baud must be positive and at most one tenth of the CPU clock")
    if args.uart_baud != 115200 and not args.smoke:
        parser.error("Nonstandard UART baud is only for --smoke simulation")
    mode = "smoke" if args.smoke else "validation" if args.validation else "performance"
    build = PORT / "build" / mode
    build.mkdir(parents=True, exist_ok=True)
    for tool in ("gcc", "objcopy", "objdump", "nm", "size"):
        if not shutil.which("riscv-none-elf-" + tool):
            raise RuntimeError(f"Missing riscv-none-elf-{tool} in PATH")
    tests = make_selftest(build / "alu_selftest.S")
    init = build / "init_data.S"
    init.write_text(".section .board_init,\"ax\"\n.globl board_init_data\nboard_init_data:\nret\n", encoding="ascii")
    sources = [PORT / "start.S", PORT / "selftest.S", build / "alu_selftest.S",
               PORT / "board_io.c", PORT / "core_portme.c"]
    sources += [OFFICIAL / (name + ".c") for name in
                ("core_main", "core_list_join", "core_matrix", "core_state", "core_util")]
    sources.append(init)
    flags = ["-march=rv32im_zicsr", "-mabi=ilp32", "-O2", "-mstrict-align", "-msmall-data-limit=0",
             "-ffreestanding", "-fno-builtin", "-fno-tree-loop-distribute-patterns",
             # Instruction and data memories have separate, overlapping VMAs.
             # link.ld asserts each bank's limits; their LMAs remain separate.
             "-nostdlib", "-nostartfiles", "-Wl,--no-check-sections", f"-DBOARD_CLOCK_HZ={args.clock_hz}u",
             f"-DBOARD_UART_BAUD={args.uart_baud}u",
             f"-DBOARD_SMOKE={int(args.smoke)}", f"-DBOARD_VALIDATION={int(args.validation)}",
             f"-DITERATIONS={1 if args.smoke else 0}", "-DTOTAL_DATA_SIZE=2000",
             "-I", str(PORT), "-I", str(OFFICIAL), "-T", str(PORT / "link.ld")]

    def link(name: str) -> Path:
        elf = build / (name + ".elf")
        run("riscv-none-elf-gcc", *flags, *(str(p) for p in sources), "-lgcc",
            "-Wl,-Map=" + str(build / (name + ".map")), "-o", str(elf))
        return elf

    def data_image(elf: Path, name: str) -> bytes:
        path = build / name
        run("riscv-none-elf-objcopy", "-O", "binary", "--only-section=.rodata",
            "--only-section=.data", str(elf), str(path))
        return path.read_bytes()

    probe = link("probe")
    data = data_image(probe, "probe_data.bin")
    # Harvard core cannot read constants from instruction ROM. Generate literal
    # immediate stores, instead of requiring a separately preinitialized data RAM.
    padded = data + bytes((-len(data)) % 4)
    lines = [".option norvc", ".option norelax", '.section .board_init,"ax"',
             ".globl board_init_data", "board_init_data:", "li t0, 0x5000"]
    for i in range(0, len(padded), 4):
        word = int.from_bytes(padded[i:i + 4], "little")
        if i and i % 1024 == 0:
            lines.append("addi t0, t0, 1024")
        lines += [f"li t1, 0x{word:08x}", f"sw t1, {i % 1024}(t0)"]
    lines += ["ret"]
    init.write_text("\n".join(lines) + "\n", encoding="ascii")
    elf = link("board_coremark")
    if data_image(elf, "ram_data.bin") != data:
        raise RuntimeError("RAM initialization changed after final link")
    binary = build / "board_coremark.bin"
    run("riscv-none-elf-objcopy", "-O", "binary", "--only-section=.text", str(elf), str(binary))
    text = binary.read_bytes()
    if len(text) > 32768: raise RuntimeError("Instruction ROM exceeds 32KiB")
    padded = text + bytes(32768 - len(text))
    hexfile = build / "board_coremark.hex"
    hexfile.write_text("".join(f"{int.from_bytes(padded[i:i+4], 'little'):08x}\n"
                               for i in range(0, len(padded), 4)), encoding="ascii")
    (build / "board_coremark.asm").write_text(run("riscv-none-elf-objdump", "-d", str(elf)), encoding="utf-8")
    symbol_text = run("riscv-none-elf-nm", "-n", str(elf))
    (build / "symbols.txt").write_text(symbol_text, encoding="utf-8")
    symbols = {parts[2]: int(parts[0], 16) for line in symbol_text.splitlines()
               if len(parts := line.split()) == 3}
    (build / "manifest.json").write_text(json.dumps({"mode": mode, "clock_hz": args.clock_hz,
        "uart_baud": args.uart_baud,
        "iterations": 1 if args.smoke else 0, "golden_tests": tests, "rom_bytes": len(text),
        "ram_init_bytes": len(data), "symbols": symbols}, indent=2), encoding="ascii")
    print(run("riscv-none-elf-size", "-A", str(elf)))
    # A simulation smoke build must never replace the image used for synthesis.
    if not args.smoke and not args.validation:
        shutil.copyfile(hexfile, PORT / "board_coremark.hex")
        (PORT / "board_coremark_config.vh").write_text(
            "// Generated by firmware/board_coremark/build.py; matches board_coremark.hex.\n"
            f"`define BOARD_COREMARK_FAIL_PC 32'h{symbols['board_fail_park']:08x}\n"
            f"`define BOARD_COREMARK_TRAP_PC 32'h{symbols['board_trap_park']:08x}\n", encoding="ascii")
    print(f"Mode={mode}; clock={args.clock_hz / 1000000:g}MHz; ALU/M golden tests={tests}; ROM bytes={len(text)}; initialized RAM bytes={len(data)}")
    print(f"HEX: {hexfile}")


if __name__ == "__main__":
    main()
