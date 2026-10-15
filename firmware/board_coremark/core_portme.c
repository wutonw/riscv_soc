#include "coremark.h"
#include "board_io.h"
#include <stdarg.h>

#ifndef ITERATIONS
#define ITERATIONS 0
#endif
#ifndef BOARD_SMOKE
#define BOARD_SMOKE 0
#endif
#ifndef BOARD_VALIDATION
#define BOARD_VALIDATION 0
#endif

volatile ee_s32 seed1_volatile = BOARD_VALIDATION ? 0x3415 : 0;
volatile ee_s32 seed2_volatile = BOARD_VALIDATION ? 0x3415 : 0;
volatile ee_s32 seed3_volatile = 0x66;
volatile ee_s32 seed4_volatile = ITERATIONS;
volatile ee_s32 seed5_volatile = 0;
ee_u32 default_num_contexts = 1;

static uint32_t begin_cycles, elapsed_cycles, iterations;
static unsigned validated, crc_errors, short_run, unknown_seeds;

static int prefix(const char *s, const char *p)
{
    while (*p) if (*s++ != *p++) return 0;
    return 1;
}

void start_time(void) { begin_cycles = board_cycles(); }
void stop_time(void) { elapsed_cycles = board_cycles() - begin_cycles; }
CORE_TICKS get_time(void) { return elapsed_cycles; }
secs_ret time_in_secs(CORE_TICKS ticks) { return ticks / BOARD_CLOCK_HZ; }

void portable_init(core_portable *p, int *argc, char *argv[])
{
    (void)argc; (void)argv;
    BOARD_SIGNATURE[0] = 0;
    BOARD_SIGNATURE[1] = 0;
    board_puts("RV32IM board self-test + CoreMark\nClock Hz: ");
    board_u32(BOARD_CLOCK_HZ); board_puts("\n");
    uint32_t first = board_cycles();
    for (volatile unsigned i = 0; i < 32; ++i) {}
    uint32_t delta = board_cycles() - first;
    if (!delta || delta > 100000) board_fail(1);
    uint32_t error = board_selftest();
    if (error) board_fail(error);
    board_puts("SELFTEST PASS (RV32I/M, forwarding, RAM, CSR, redirects)\n");
#if BOARD_SMOKE
    board_puts("SMOKE ONLY: short run, not a valid 10-second score\n");
#else
    board_puts("CoreMark calibrating; final timed run >=10 seconds...\n");
#endif
    p->portable_id = 1;
}

static void number(uint32_t n, unsigned base, unsigned width, char pad)
{
    char digits[32];
    unsigned used = 0;
    do {
        unsigned d = n % base;
        digits[used++] = d < 10 ? '0' + d : 'a' + d - 10;
        n /= base;
    } while (n);
    while (width > used) { board_putc(pad); --width; }
    while (used) board_putc(digits[--used]);
}

/* Small integer-only console port. Official benchmark sources are unchanged. */
int ee_printf(const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    if (prefix(fmt, "Correct operation validated")) validated = 1;
    if (prefix(fmt, "[%u]ERROR!") || prefix(fmt, "ERROR! Please") || prefix(fmt, "ERROR:") ||
        (prefix(fmt, "Errors detected") && !(BOARD_SMOKE && short_run))) ++crc_errors;
    if (prefix(fmt, "ERROR! Must execute")) short_run = 1;
    if (prefix(fmt, "Cannot validate")) unknown_seeds = 1;
    if (prefix(fmt, "Iterations       :")) {
        va_list copy;
        va_copy(copy, args);
        iterations = (uint32_t)va_arg(copy, unsigned long);
        va_end(copy);
    }
    for (const char *s = fmt; *s; ++s) {
        if (*s != '%') {
            if (*s == '\n') board_putc('\r');
            board_putc(*s);
            continue;
        }
        ++s;
        char pad = ' ';
        unsigned width = 0, is_long = 0;
        if (*s == '0') { pad = '0'; ++s; }
        while (*s >= '0' && *s <= '9') { width = width * 10 + *s - '0'; ++s; }
        if (*s == 'l') { is_long = 1; ++s; }
        if (*s == 's') board_puts(va_arg(args, const char *));
        else if (*s == '%') board_putc('%');
        else if (*s == 'd') {
            int32_t value = is_long ? va_arg(args, long) : va_arg(args, int);
            if (value < 0) board_putc('-');
            number(value < 0 ? 0u - (uint32_t)value : (uint32_t)value, 10, width, pad);
        } else if (*s == 'u' || *s == 'x') {
            uint32_t value = is_long ? va_arg(args, unsigned long) : va_arg(args, unsigned int);
            number(value, *s == 'x' ? 16 : 10, width, pad);
        }
    }
    va_end(args);
    return 0;
}

void portable_fini(core_portable *p)
{
    p->portable_id = 0;
    if (crc_errors || unknown_seeds || !iterations || !elapsed_cycles)
        board_fail(0x100);
    if (!BOARD_SMOKE && (!validated || short_run || time_in_secs(elapsed_cycles) < 10))
        board_fail(0x101);
    if (BOARD_SMOKE && !validated && !short_run) board_fail(0x102);

    board_puts("Measured cycles  : "); board_u32(elapsed_cycles); board_puts("\n");
    board_puts("Measured seconds : ");
    board_fixed((uint64_t)elapsed_cycles * 1000000u / BOARD_CLOCK_HZ);
    board_puts("\n");
    board_puts(BOARD_SMOKE ? "Estimated CoreMark: " : "CoreMark         : ");
    board_fixed((uint64_t)iterations * BOARD_CLOCK_HZ * 1000000u / elapsed_cycles);
    board_puts("\nCoreMark/MHz     : ");
    board_fixed((uint64_t)iterations * 1000000000000ull / elapsed_cycles);
    board_puts(BOARD_SMOKE ? "\nSMOKE CRC PASS (duration rule not met)\n" : "\nBOARD COREMARK PASS (CRC OK, >=10 seconds)\n");
    BOARD_SIGNATURE[1] = elapsed_cycles;
    BOARD_SIGNATURE[0] = BOARD_SMOKE ? BOARD_SMOKE_PASS : BOARD_PASS;
}

void *portable_malloc(ee_size_t size) { (void)size; return NULL; }
void portable_free(void *p) { (void)p; }
