/*
 *  Supervide!
 *
 *  Power board driver (header)
*/

#ifndef _POWER_BOARD_H
#define _POWER_BOARD_H

// Enable or disable master relay
void power_master_enable(void);
void power_master_disable(void);

// Enable or disable preheat relay
void power_preheat_enable(void);
void power_preheat_disable(void);

// Set TRIAC activation level from 0 (fully off) to 255 (fully on)
// Controls the number of mains cycles over a 5.1s period.
void power_set_triac(uint8_t level);

#endif
