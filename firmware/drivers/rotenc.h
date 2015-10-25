/*
 * Rotary Encoder Driver
 * Supervide
 */

#ifndef ROTENC_H
#define ROTENC_H

#include "ch.h"
#include "hal.h"

#define ROTENC_PRESS_FLAG  (1<<0)
#define ROTENC_LEFT_FLAG   (1<<1)
#define ROTENC_RIGHT_FLAG  (1<<2)
extern event_source_t rotenc_es;

/* Register with EXTI on the push button GPIO */
void rotenc_push_cb(EXTDriver *extp, expchannel_t channel);

void rotenc_init(void);

#define ROTENC_RED 0x04
#define ROTENC_GREEN 0x02
#define ROTENC_BLUE 0x01
#define ROTENC_YELLOW 0x06
#define ROTENC_CYAN 0x03
#define ROTENC_PURPLE 0x05
#define ROTENC_WHITE 0x07
#define ROTENC_BLANK 0x00
void rotenc_led(uint8_t colour);

#endif /* ROTENC_H */
