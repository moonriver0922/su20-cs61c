#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg) {
    /* YOUR CODE HERE */
    unsigned number = *reg;
    unsigned MSB = get_bit(number, 0) ^ get_bit(number, 2) ^ get_bit(number, 3) ^ get_bit(number, 5);
    number = (number >> 1) ^ (MSB << 15);
    *reg = number;
}

unsigned get_bit(unsigned x,
                 unsigned n) {
    // YOUR CODE HERE
    // Returning -1 is a placeholder (it makes
    // no sense, because get_bit only returns
    // 0 or 1)
    x = 0x0001 & (x >> n);
    return x;
}

