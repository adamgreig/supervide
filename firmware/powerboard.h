#ifndef POWERBOARD_H
#define POWERBOARD_H

#include <stdint.h>

/* Setup PWM, IO, ADCs */
void power_init(void);

/* Set master relay on or off */
void power_set_master(bool state);

/* Set preheat relay on or off */
void power_set_preheat(bool state);

/* Set TRIAC level from 0 (fully off) to 255 (fully on)
 * This controls the number of live half cycles over a 2.55s period */
void power_set_triac(uint8_t level);

/* Return measured current in mA */
uint16_t power_get_current(void);

#endif

