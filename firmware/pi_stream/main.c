#include <stdint.h>

#ifndef CPU_HZ
#define CPU_HZ 100000000u
#endif
#ifndef UART_BAUD
#define UART_BAUD 115200u
#endif
#ifndef REPORT_CYCLES
#define REPORT_CYCLES (3u * CPU_HZ)
#endif
#ifndef BATCH_SAMPLES
#define BATCH_SAMPLES 256u
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
        if (*s == '\n') putc('\r');
        putc(*s++);
    }
}

static void print_u32(uint32_t n)
{
    char digits[10];
    unsigned used = 0;
    do {
        digits[used++] = (char)('0' + n % 10u);
        n /= 10u;
    } while (n);
    while (used) putc(digits[--used]);
}

static void estimate_pi(uint32_t hits, uint32_t total,
                        uint32_t *whole, uint32_t *fraction)
{
    uint32_t rem = 0;
    uint32_t decimal = 0;
    *whole = 0;
    for (unsigned i = 0; i < 4; ++i) {
        if (rem >= total - hits) {
            rem -= total - hits;
            ++*whole;
        } else {
            rem += hits;
        }
    }
    for (unsigned place = 0; place < 6; ++place) {
        uint32_t digit_rem = 0;
        uint32_t digit = 0;
        for (unsigned i = 0; i < 10; ++i) {
            if (digit_rem >= total - rem) {
                digit_rem -= total - rem;
                ++digit;
            } else {
                digit_rem += rem;
            }
        }
        decimal = decimal * 10u + digit;
        rem = digit_rem;
    }
    *fraction = decimal;
}

static uint32_t random_state = 0x9e3779b9u;

static uint32_t random_word(void)
{
    uint32_t x = random_state;
    x ^= x << 13;
    x ^= x >> 17;
    x ^= x << 5;
    random_state = x;
    return x;
}

__attribute__((noinline, noreturn))
void pi_trap_fail(uint32_t cause, uint32_t epc)
{
    SIGNATURE = 0xdead0001u;
    puts("TRAP cause="); print_u32(cause);
    puts(" mepc="); print_u32(epc);
    puts("\n");
    __asm__ volatile (".globl pi_fail_park\npi_fail_park: j pi_fail_park");
    __builtin_unreachable();
}

int main(void)
{
    uint32_t samples = 0, inside = 0;
    uint32_t report_at = CYCLE_COUNT;
    SIGNATURE = 0;
    puts("PI STREAM: RV32IM integer Monte Carlo, 100 MHz\n");
    puts("Expected pi ~= 3.141593; statistical estimate varies.\n");

    for (;;) {
        for (unsigned i = 0; i < BATCH_SAMPLES; ++i) {
            /* x,y in [0,32767]; squares and sum fit uint32_t. */
            uint32_t x = random_word() & 32767u;
            uint32_t y = random_word() & 32767u;
            inside += (uint32_t)(x * x + y * y <= 32767u * 32767u);
            ++samples;
        }
        if ((uint32_t)(CYCLE_COUNT - report_at) >= REPORT_CYCLES) {
            /* Keep the scaled product in 64 bits so 32-bit compilers do not
               truncate before the division. */
            uint32_t whole, fraction;
            estimate_pi(inside, samples, &whole, &fraction);
            puts("window_samples="); print_u32(samples);
            puts(" inside="); print_u32(inside);
            puts(" pi="); print_u32(whole);
            putc('.');
            for (uint32_t place = 100000u; place; place /= 10u) {
                putc((char)('0' + fraction / place));
                fraction %= place;
            }
            puts("\n");
            report_at = CYCLE_COUNT;
            samples = 0;
            inside = 0;
        }
    }
}
