/*
 * oled.h
 * OLED Driver
 * Supervide
 */

#ifndef OLED_H
#define OLED_H

#include <stdint.h>

extern uint8_t oled_buffer[4][128];

void oled_init(void);
void oled_draw(void);
void oled_draw_logo(void);

#endif /* OLED_H */
