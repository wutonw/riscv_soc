#include <stdint.h>

#ifndef CPU_HZ
#define CPU_HZ 100000000u
#endif
#ifndef UART_BAUD
#define UART_BAUD 115200u
#endif
#ifndef FRAME_CYCLES
#define FRAME_CYCLES 100000000u
#endif
#ifndef FRAME_WIDTH
#define FRAME_WIDTH 64
#endif
#ifndef FRAME_HEIGHT
#define FRAME_HEIGHT 24
#endif

#define UART_DATA (*(volatile uint8_t *)0x10000u)
#define CYCLE_COUNT (*(volatile uint32_t *)0x10004u)
#define SIGNATURE (*(volatile uint32_t *)0x7ff8u)

static uint32_t last_tx_cycle;
static uint32_t tx_started;

static void putc(char c)
{
    const uint32_t spacing = (CPU_HZ * 11u + UART_BAUD - 1u) / UART_BAUD;
    if (tx_started)
        while ((uint32_t)(CYCLE_COUNT - last_tx_cycle) < spacing) {}
    UART_DATA = (uint8_t)c;
    last_tx_cycle = CYCLE_COUNT;
    tx_started = 1;
}

static void puts(const char *s)
{
    while (*s) {
        if (*s == 10) putc(13);
        putc(*s++);
    }
}

static void print_u32(uint32_t value)
{
    char digits[10];
    unsigned used = 0;
    do {
        digits[used++] = (char)(48u + value % 10u);
        value /= 10u;
    } while (value);
    while (used) putc(digits[--used]);
}

__attribute__((noinline, noreturn))
void julia_trap_fail(uint32_t cause, uint32_t epc)
{
    SIGNATURE = 0xdead0001u;
    puts("TRAP cause="); print_u32(cause);
    puts(" mepc="); print_u32(epc); putc(10);
    __asm__ volatile (".globl julia_fail_park\njulia_fail_park: j julia_fail_park");
    __builtin_unreachable();
}

/* Q12 signed fixed-point Julia iteration; stop before squaring values
   outside the safe signed 32-bit multiplication range. */
static unsigned escape_steps(int32_t zx, int32_t zy, int32_t cr, int32_t ci)
{
    unsigned n = 0;
    while (n < 32) {
        if (zx > 8192 || zx < -8192 || zy > 8192 || zy < -8192) break;
        int32_t x2 = (zx * zx) >> 12;
        int32_t y2 = (zy * zy) >> 12;
        int32_t xy = (zx * zy) >> 11;
        if (x2 + y2 > 4 * 4096) break;
        zy = xy + ci;
        zx = x2 - y2 + cr;
        ++n;
    }
    return n;
}

int main(void)
{
    static const char shades[] = " .:-=+*#%@";
    uint32_t frame = 0;
    SIGNATURE = 0;
    puts("JULIA START "); print_u32(FRAME_WIDTH); putc('x');
    print_u32(FRAME_HEIGHT); puts(" Q12 RV32IM 100MHz\n");
    for (;;) {
        uint32_t started = CYCLE_COUNT;
        uint32_t phase = frame & 63u;
        int32_t wave = (int32_t)(phase < 32u ? phase : 63u - phase) - 16;
        int32_t cr = -3052 + wave * 9;
        int32_t ci = 463 + wave * 4;
        puts("JULIA FRAME "); print_u32(frame); putc(10);
        for (int row = 0; row < FRAME_HEIGHT; ++row) {
            for (int col = 0; col < FRAME_WIDTH; ++col) {
                int32_t zx = ((int32_t)col * 14746 / FRAME_WIDTH) - 7373;
                int32_t zy = ((int32_t)row * 9830 / FRAME_HEIGHT) - 4915;
                unsigned n = escape_steps(zx, zy, cr, ci);
                putc(shades[n == 32 ? 9u : n < 2 ? 0u : (n * 8u / 32u) + 1u]);
            }
            putc(10);
        }
        puts("JULIA END "); print_u32(frame); putc(10);
        ++frame;
        while ((uint32_t)(CYCLE_COUNT - started) < FRAME_CYCLES) {}
    }
}
