#include "core_portme.h"
#include "board_io.h"

static uint32_t last_tx_cycle;
static uint32_t tx_started;

uint32_t board_cycles(void)
{
    return *(volatile uint32_t *)0x10004u;
}

void board_putc(char c)
{
    /* 11 bit-times between stores: no FIFO-full register or CPU stall needed.
       Output is entirely outside the measured CoreMark iterate() interval. */
    const uint32_t spacing = (BOARD_CLOCK_HZ * 11u + BOARD_UART_BAUD - 1u) / BOARD_UART_BAUD;
    if (tx_started) {
        while ((uint32_t)(board_cycles() - last_tx_cycle) < spacing) {}
    }
    *(volatile uint8_t *)0x10000u = (uint8_t)c;
    last_tx_cycle = board_cycles();
    tx_started = 1;
}

void board_puts(const char *s)
{
    while (*s) {
        if (*s == '\n') board_putc('\r');
        board_putc(*s++);
    }
}

void board_u32(uint32_t n)
{
    char digits[10];
    unsigned used = 0;
    do { digits[used++] = '0' + n % 10u; n /= 10u; } while (n);
    while (used) board_putc(digits[--used]);
}

void board_fixed(uint64_t scaled)
{
    board_u32((uint32_t)(scaled / 1000000u));
    board_putc('.');
    uint32_t fraction = (uint32_t)(scaled % 1000000u);
    for (uint32_t divisor = 100000u; divisor; divisor /= 10u)
        board_putc('0' + (fraction / divisor) % 10u);
}

void board_fail(uint32_t code)
{
    BOARD_SIGNATURE[1] = code;
    BOARD_SIGNATURE[0] = BOARD_FAIL;
    board_puts("FAIL code="); board_u32(code); board_puts("\n");
    __asm__ volatile(".globl board_fail_park\nboard_fail_park: j board_fail_park");
    __builtin_unreachable();
}

void board_trap_fail(uint32_t cause, uint32_t epc)
{
    BOARD_SIGNATURE[1] = cause;
    BOARD_SIGNATURE[0] = BOARD_FAIL;
    board_puts("TRAP cause="); board_u32(cause);
    board_puts(" mepc="); board_u32(epc); board_puts("\n");
    __asm__ volatile(".globl board_trap_park\nboard_trap_park: j board_trap_park");
    __builtin_unreachable();
}
