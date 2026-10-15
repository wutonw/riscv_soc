#include <stdint.h>

#ifndef CPU_HZ
#define CPU_HZ 100000000u
#endif
#ifndef UART_BAUD
#define UART_BAUD 115200u
#endif
#ifndef FRAME_CYCLES
#define FRAME_CYCLES 20000000u
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

static uint32_t last_tx_cycle, tx_started;

static void putc(char ch)
{
    const uint32_t spacing = (CPU_HZ * 11u + UART_BAUD - 1u) / UART_BAUD;
    if (tx_started)
        while ((uint32_t)(CYCLE_COUNT - last_tx_cycle) < spacing) {}
    UART_DATA = (uint8_t)ch;
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
void square_trap_fail(uint32_t cause, uint32_t epc)
{
    SIGNATURE = 0xdead0001u;
    puts("TRAP cause="); print_u32(cause);
    puts(" mepc="); print_u32(epc); putc(10);
    __asm__ volatile (".globl square_fail_park\nsquare_fail_park: j square_fail_park");
    __builtin_unreachable();
}

/* Quarter-wave sine lookup in Q12; 64 angular steps per full turn. */
static const int16_t sine_quarter[17] = {
    0, 402, 799, 1189, 1567, 1931, 2276, 2598, 2896,
    3166, 3406, 3612, 3784, 3920, 4017, 4076, 4096
};

static int32_t sine64(unsigned phase)
{
    unsigned p = phase & 63u;
    unsigned q = p >> 4;
    unsigned i = p & 15u;
    int32_t value = sine_quarter[(q & 1u) ? 16u - i : i];
    return q >= 2u ? -value : value;
}

static int32_t abs32(int32_t value)
{
    return value < 0 ? -value : value;
}

int main(void)
{
    uint32_t frame = 0;
    const int32_t half_side = 2458;  /* 0.6 in Q12 coordinates. */
    const int32_t thickness = 8192 / FRAME_HEIGHT + 64;
    SIGNATURE = 0;
    puts("SQUARE START "); print_u32(FRAME_WIDTH); putc('x');
    print_u32(FRAME_HEIGHT); puts(" RV32IM 100MHz\n");
    for (;;) {
        uint32_t started = CYCLE_COUNT;
        int32_t sn = sine64(frame);
        int32_t cs = sine64(frame + 16u);
        puts("SQUARE FRAME "); print_u32(frame); putc(10);
        for (int row = 0; row < FRAME_HEIGHT; ++row) {
            int32_t y = ((2 * row + 1 - FRAME_HEIGHT) * 4096) / FRAME_HEIGHT;
            for (int col = 0; col < FRAME_WIDTH; ++col) {
                /* Character cells are roughly twice as tall as wide. */
                int32_t x = ((2 * col + 1 - FRAME_WIDTH) * 4096) / (FRAME_HEIGHT * 2);
                int32_t rx = (x * cs + y * sn) >> 12;
                int32_t ry = (y * cs - x * sn) >> 12;
                int32_t edge = abs32(rx);
                if (abs32(ry) > edge) edge = abs32(ry);
                putc(edge >= half_side - thickness / 2 &&
                     edge <= half_side + thickness / 2 ? '#' : ' ');
            }
            putc(10);
        }
        puts("SQUARE END "); print_u32(frame); putc(10);
        ++frame;
        while ((uint32_t)(CYCLE_COUNT - started) < FRAME_CYCLES) {}
    }
}
