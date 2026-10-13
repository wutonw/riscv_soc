#include <stdint.h>

#define UART_TX_ADDR 0x00010000u
#define SIGNATURE_ADDR 0x00007ff8u
#define PASS_SIGNATURE 0x600dcafeu
#define FAIL_SIGNATURE 0xdead0001u

static volatile uint8_t *const uart_tx = (volatile uint8_t *)UART_TX_ADDR;
static volatile uint32_t *const signature = (volatile uint32_t *)SIGNATURE_ADDR;

static __attribute__((noinline)) void uart_putc(uint8_t c)
{
    *uart_tx = c;
}

static __attribute__((noinline)) void uart_hex(uint32_t value)
{
    static const char digits[] = "0123456789abcdef";
    int shift;

    for (shift = 28; shift >= 0; shift -= 4)
        uart_putc((uint8_t)digits[(value >> shift) & 0xfu]);
}

static __attribute__((noinline, noreturn)) void board_fail(uint32_t code)
{
    *signature = code;
    uart_putc('F'); uart_putc('A'); uart_putc('I'); uart_putc('L'); uart_putc(' ');
    uart_hex(code);
    uart_putc('\r'); uart_putc('\n');
    for (;;)
        __asm__ volatile ("nop");
}

uint32_t trap_handler(uint32_t cause, uint32_t epc)
{
    (void)epc;
    board_fail(0x800u | cause);
    return epc + 4u;
}

/* Keep this label as the board's successful terminal state. */
static __attribute__((noinline, noreturn, section(".text.board_pass")))
void board_pass(void)
{
    *signature = PASS_SIGNATURE;
    uart_putc('P'); uart_putc('A'); uart_putc('S'); uart_putc('S');
    uart_putc('\r'); uart_putc('\n');
    for (;;)
        __asm__ volatile ("nop");
}

static __attribute__((noinline)) uint32_t branch_and_jump_test(uint32_t seed)
{
    uint32_t value = seed;

    if (value != 0x13579bdfu) return 1u;
    if (value == 0u) return 2u;
    if (value < 0x13579be0u) value += 3u;
    if (value >= 0x13579be2u) value -= 1u;
    if ((int32_t)value <= 0) return 3u;
    if ((int32_t)value > 0x7fffffff) return 4u;

    /* A call/return exercises JAL/JALR in addition to the branches above. */
    return value ^ 2u;
}

static __attribute__((noinline)) uint32_t memory_test(void)
{
    volatile uint32_t *const p = (volatile uint32_t *)0x00000100u;
    uint32_t i;
    uint32_t checksum = 0u;

    for (i = 0u; i < 32u; ++i) {
        p[i] = (i * 0x1021u) ^ (0xa5a50000u + i);
        checksum ^= p[i];
    }
    for (i = 0u; i < 32u; ++i)
        checksum += p[i] ^ (i << 5);

    return checksum;
}

static __attribute__((noinline)) uint32_t integer_m_test(void)
{
    int32_t sa = -100;
    int32_t sb = 7;
    uint32_t ua = 0xfedcba98u;
    uint32_t ub = 37u;
    uint32_t value = 0u;

    value ^= (uint32_t)(sa * sb);
    value ^= (uint32_t)(sa / sb);
    value ^= (uint32_t)(sa % sb);
    value ^= ua * ub;
    value ^= ua / ub;
    value ^= ua % ub;
    value ^= (uint32_t)(sa < sb);
    value ^= ua > ub ? 0x55aa55aau : 0u;
    return value;
}

static __attribute__((noinline)) uint32_t rtype_pressure(void)
{
    uint32_t a = 0x12345678u;
    uint32_t b = 0x9abcdef0u;
    uint32_t c = 0u;
    uint32_t i;

    for (i = 0u; i < 4096u; ++i) {
        c = (a + b) ^ (a - b);
        c = (c << 3) | (c >> 29);
        c ^= (a & b) | (a ^ b);
        a = b ^ c;
        b = c + (i | 1u);
    }
    return a ^ b ^ c;
}

int main(void)
{
    uint32_t expected_branch = 0x13579be3u;
    uint32_t branch_result;
    uint32_t memory_result;
    uint32_t m_result;
    uint32_t r_result;

    *signature = 0x454d0000u;
    branch_result = branch_and_jump_test(0x13579bdfu);
    if (branch_result != expected_branch)
        board_fail(0x100u | branch_result);

    memory_result = memory_test();
    if (memory_result == 0u)
        board_fail(0x200u);

    m_result = integer_m_test();
    if (m_result == 0u)
        board_fail(0x300u);

    r_result = rtype_pressure();
    if ((r_result ^ rtype_pressure()) != 0u)
        board_fail(0x400u);

    board_pass();
}
