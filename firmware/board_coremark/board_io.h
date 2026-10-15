#ifndef BOARD_IO_H
#define BOARD_IO_H
#include <stdint.h>
#define BOARD_SIGNATURE ((volatile uint32_t *)0x7ff8u)
#define BOARD_PASS 0x600dcafeu
#define BOARD_FAIL 0xdead0001u
#define BOARD_SMOKE_PASS 0x51c0cafeu
uint32_t board_cycles(void);
void board_putc(char c);
void board_puts(const char *s);
void board_u32(uint32_t n);
void board_fixed(uint64_t scaled);
void board_fail(uint32_t code) __attribute__((noreturn));
uint32_t board_selftest(void);
#endif
