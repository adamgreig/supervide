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
void oled_logo(void);
void oled_icon_cow(void);
void oled_icon_pig(void);
void oled_icon_sheep(void);
void oled_icon_duck(void);
void oled_icon_fish(void);
void oled_erase(void);

void oled_text_small(uint8_t line, uint8_t x, const char* str);
void oled_text_big(uint8_t line, uint8_t x, const char* str);

#endif /* OLED_H */
