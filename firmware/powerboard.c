/*
 *  Supervide!
 *
 *  Power board driver
*/

#include "hal.h"

// Enable or disable master relay
void power_master_enable(void) {
    palSetPad(GPIOB, GPIOB_RELAY_M);
}
void power_master_disable(void) {
    palClearPad(GPIOB, GPIOB_RELAY_M);
}

// Enable or disable preheat relay
void power_preheat_enable(void) {
    palSetPad(GPIOB, GPIOB_RELAY_PH);
}
void power_preheat_disable(void) {
    palClearPad(GPIOB, GPIOB_RELAY_PH);
}

// Set TRIAC activation level from 0 (fully off) to 255 (fully on)
// Controls the number of mains cycles over a 5.1s period.
void power_set_triac(uint8_t level) {
    if(level == 255)
        palSetPad(GPIOB, GPIOB_TRIAC);
    else if(level == 0)
        palClearPad(GPIOB, GPIOB_TRIAC);
    // FIXME: other values UNIMPLEMENTED.
}

