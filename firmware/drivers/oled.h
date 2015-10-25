/*
 * oled.h
 * OLED Driver
 * Supervide
 */

#ifndef OLED_H
#define OLED_H

#include <stdint.h>

extern uint8_t oled_buffer[4][128];
extern const uint8_t oled_icon_cow[4][40];
extern const uint8_t oled_icon_pig[4][40];
extern const uint8_t oled_icon_sheep[4][40];
extern const uint8_t oled_icon_duck[4][40];
extern const uint8_t oled_icon_fish[4][40];
extern const uint8_t oled_icon_egg[4][40];
extern const uint8_t oled_icon_eggs[4][40];
extern const uint8_t oled_icon_thermo[4][40];

void oled_init(void);
void oled_draw(void);
void oled_logo(void);
void oled_icon(const uint8_t* icon);
void oled_erase(void);

void oled_text_small(uint8_t line, uint8_t x, const char* str);
void oled_text_big(uint8_t line, uint8_t x, const char* str);

#endif /* OLED_H */
