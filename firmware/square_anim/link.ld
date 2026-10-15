OUTPUT_ARCH(riscv)
ENTRY(_start)
MEMORY {
    ROM (rx) : ORIGIN = 0, LENGTH = 32K
    DATA (rw) : ORIGIN = 0x5000, LENGTH = 0x2000
}
SECTIONS {
    .text 0 : ALIGN(4) {
        KEEP(*(.text.start))
        *(.text .text.*)
        *(.board_init)
    } > ROM
    .rodata 0x5000 : AT(0x10000) {
        *(.rodata .rodata.*)
    } > DATA
    .data : AT(LOADADDR(.rodata) + SIZEOF(.rodata)) {
        *(.data .data.* .sdata .sdata.*)
        . = ALIGN(4);
    } > DATA
    .bss (NOLOAD) : ALIGN(4) {
        __bss_start = .;
        *(.bss .bss.* .sbss .sbss.* COMMON)
        . = ALIGN(4);
        __bss_end = .;
    } > DATA
    __stack_top = 0x7f00;
    ASSERT(SIZEOF(.text) <= 0x8000, "Square image exceeds 32KiB instruction ROM")
    ASSERT(__bss_end <= 0x7000, "Square data overlaps stack")
}

