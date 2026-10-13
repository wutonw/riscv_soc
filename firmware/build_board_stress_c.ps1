$ErrorActionPreference = "Stop"
$ROOT = $PSScriptRoot
$BUILD = Join-Path $ROOT "build"
New-Item -ItemType Directory -Force -Path $BUILD | Out-Null

$elf = Join-Path $BUILD "board_stress_c.elf"
$bin = Join-Path $BUILD "board_stress_c.bin"
$asm = Join-Path $BUILD "board_stress_c.asm"

riscv-none-elf-gcc `
  -march=rv32im_zicsr `
  -mabi=ilp32 `
  -O2 `
  -msmall-data-limit=0 `
  -ffreestanding `
  -fno-builtin `
  -nostdlib `
  -nostartfiles `
  "-Wl,--no-relax" `
  "-Wl,-T$ROOT\link.ld" `
  "-Wl,-Map=$BUILD\board_stress_c.map" `
  "$ROOT\start.S" "$ROOT\trap_entry.S" "$ROOT\board_stress.c" `
  -o $elf
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objcopy -O binary --only-section=.text --only-section=.rodata $elf $bin
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
riscv-none-elf-objdump -d $elf > $asm
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

python -c "import sys; from pathlib import Path; sys.path.insert(0, sys.argv[1]); from bin2hex import bin_to_hex; bin_to_hex(Path(sys.argv[2]), Path(sys.argv[3]))" `
  $ROOT `
  $bin `
  (Join-Path $BUILD "firmware.hex")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
Copy-Item (Join-Path $BUILD "firmware.hex") (Join-Path $ROOT "board_stress.hex") -Force
Copy-Item (Join-Path $BUILD "firmware.hex") (Join-Path $ROOT "board_stress.mi") -Force

Write-Host "Board stress image generated: $ROOT\board_stress.hex"
riscv-none-elf-nm -n $elf | Select-String ' (board_pass|board_fail)$'
