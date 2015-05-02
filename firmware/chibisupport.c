#include "hal.h"
#include "board.h"

/* These variables are DEFINED in board.h
 * but there's no easy way to get that data into Rust.
 * This way rust can just externally reference these
 * constants and the DEFINEs get filled in here.
 * Maybe they get optimized out, but probably not,
 * since it crosses an object file boundary.
 */
const uint32_t *ch_GPIOB = (uint32_t *)GPIOB;
const uint32_t ch_GPIOB_RELAY_M = GPIOB_RELAY_M;
const uint32_t ch_GPIOB_RELAY_PH = GPIOB_RELAY_PH;
const uint32_t ch_GPIOB_TRIAC = GPIOB_TRIAC;

/* Wrap these functions so that Rust code doesn't have to
 * worry about ChibiOS' macros -- GCC compiles this and
 * fills in the macros there, and Rust modules just link
 * against nice sensible functions.
 */
void ch_palSetPad(uint32_t *port, uint32_t pad) {
    palSetPad((stm32_gpio_t *)port, pad);
}

void ch_palClearPad(uint32_t *port, uint32_t pad) {
    palClearPad((stm32_gpio_t *)port, pad);
}


