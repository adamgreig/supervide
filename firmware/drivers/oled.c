#include "oled.h"
#include <ch.h>
#include <hal.h>
#include <string.h>

#define OLED_SPID     SPID1
#define OLED_RST_PORT GPIOB
#define OLED_RST_PIN  GPIOB_OLED_RST
#define OLED_DC_PORT  GPIOA
#define OLED_DC_PIN   GPIOA_OLED_DC
#define OLED_CS_PORT  GPIOB
#define OLED_CS_PIN   GPIOB_OLED_CS

uint8_t oled_buffer[4][128];

static uint8_t oled_init_cmds[] = {
    0xAE,       /* OLED panel off */
    0xD5, 0x70, /* Display clock divide: default freq, div by 1 */
    0xA8, 0x1F, /* MUX ratio: 32MUX (as 32 rows) */
    0xD3, 0x00, /* Display offset: not offset */
    0xD8, 0x05, /* Area Colour Mode: monochrome, low power mode */
    0xA1,       /* Segment remap: Remap columns, flipping left/right */
    0xC8,       /* COM scan direction: Flipped top/bottom */
    0xDA, 0x12, /* COM pins hardware config: L/R remap + alt config */
    0x91, 0x3F, 0x3F, 0x3F, 0x3F, /* Current drive pulse widths */
    0xD9, 0x22, /* Pre-charge period: default values (example is 0xD2) */
    0xDB, 0x34, /* VCOMH: 0.77 * VCC (default) */
    0xA6,       /* Normal (not inverse) display */
    0xA4,       /* Disable entire display ON */
    0x20, 0x00, /* Memory addressing mode: horizontal */
    0x21, 4, 131, /* Start at column 4, end at column 131 (NB 0xA1 remap) */
    0x22, 0x00, 0x03, /* Start page 0, end at page 3 (as 4 rows of 8 pix) */
    0x81, 0xFF, /* Contrast control: maximum contrast */
    0x82, 0xFF, /* Set maximum brightness for colour banks */
    0xAD, 0x8F, /* Master configuration: DC-DC enabled */
    0xAF,       /* OLED panel on, normal (not dim) mode */
};

static uint8_t oled_sv_logo[4][128] = {
    { 0xFF, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xFF     },
    { 0xFF, 0x00, 0x7C, 0xFE, 0xFE, 0xFF, 0xE7, 0xC3, 0xC3, 0xC3, 0xC3, 0x87,
0x8F, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00,
0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x03,
0x03, 0x03, 0x87, 0xFF, 0xFE, 0xFE, 0x78, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF,
0xFF, 0xC3, 0xC3, 0xC3, 0xC3, 0xC3, 0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF,
0xFF, 0xFF, 0x83, 0x83, 0x83, 0xFF, 0xFF, 0x7E, 0x3C, 0x00, 0x00, 0x01, 0x0F,
0x7F, 0xFF, 0xFE, 0xF0, 0x80, 0x00, 0x80, 0xF0, 0xFE, 0xFF, 0x7F, 0x0F, 0x01,
0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF,
0x03, 0x03, 0x03, 0x03, 0x07, 0x1E, 0xFE, 0xFC, 0xF8, 0xF0, 0x00, 0x00, 0x00,
0xFF, 0xFF, 0xFF, 0xFF, 0xC3, 0xC3, 0xC3, 0xC3, 0xC3, 0x03, 0x00, 0xFF     },
    { 0xFF, 0x00, 0x38, 0x70, 0x70, 0x61, 0x61, 0x61, 0x61, 0x73, 0x7F, 0x3F,
0x3F, 0x1F, 0x00, 0x00, 0x00, 0x0F, 0x3F, 0x3F, 0x7F, 0x70, 0x60, 0x60, 0x60,
0x70, 0x7F, 0x3F, 0x3F, 0x0F, 0x00, 0x00, 0x00, 0x7F, 0x7F, 0x7F, 0x7F, 0x03,
0x03, 0x03, 0x03, 0x03, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x7F, 0x7F, 0x7F,
0x7F, 0x60, 0x60, 0x60, 0x60, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00, 0x7F, 0x7F,
0x7F, 0x7F, 0x01, 0x01, 0x07, 0x1F, 0x7F, 0x7E, 0x7C, 0x70, 0x40, 0x00, 0x00,
0x00, 0x03, 0x1F, 0x7F, 0x7F, 0x7C, 0x7F, 0x7F, 0x1F, 0x03, 0x00, 0x00, 0x00,
0x00, 0x00, 0x7F, 0x7F, 0x7F, 0x7F, 0x00, 0x00, 0x00, 0x7F, 0x7F, 0x7F, 0x7F,
0x60, 0x60, 0x60, 0x60, 0x70, 0x3C, 0x3F, 0x1F, 0x0F, 0x07, 0x00, 0x00, 0x00,
0x7F, 0x7F, 0x7F, 0x7F, 0x60, 0x60, 0x60, 0x60, 0x60, 0x60, 0x00, 0xFF     },
    { 0xFF, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0xFF     },
};

const uint8_t oled_icon_cow[4][40] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x18, 0x30, 0x20, 0x30, 0x18, 0x1e, 0x33, 0x32, 0x3e, 0x02, 0x02, 0x06, 0x18, 0x20, 0x30, 0x3f, 0x32, 0x06, 0x18, 0x30, 0x3f, 0x31, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x03, 0x07, 0x07, 0x0f, 0x07, 0x03, 0x81, 0x03, 0x07, 0x0f, 0x0f, 0x07, 0x03, 0x00, 0x1f, 0x24, 0x52, 0x92, 0x82, 0x84, 0x04, 0x04, 0x48, 0x48, 0x93, 0x63, 0x30, 0x0e, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x02, 0x05, 0x78, 0x84, 0x83, 0xc0, 0xe0, 0xf0, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0xf8, 0x18, 0xc9, 0x36, 0x1e, 0x1f, 0xdf, 0xff, 0x1f, 0x0f, 0x07, 0x07, 0x01, 0x82, 0x02, 0x07, 0x84, 0x6f, 0x68, 0x88, 0x48, 0x30},
    {0x00, 0x00, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0xa0, 0x20, 0x40, 0x80, 0x00, 0xc0, 0x20, 0x10, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0x80, 0x00, 0x00, 0x00, 0x00},
};

const uint8_t oled_icon_pig[4][40] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x0a, 0x0a, 0x0a, 0x07, 0x00, 0x03, 0x0d, 0x09, 0x07, 0x01, 0x1f, 0x28, 0x28, 0x38, 0x0f, 0x03, 0x1c, 0x18, 0x10, 0x0c, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7f, 0x80, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x03, 0x0c, 0x18, 0xd0, 0xa0, 0x20, 0x40, 0x40, 0x40, 0xc3, 0x44, 0x48, 0x28, 0x29, 0x19, 0x18, 0x08, 0x04, 0x03, 0x00},
    {0x00, 0x00, 0x30, 0x08, 0x1c, 0x14, 0x04, 0xf8, 0x18, 0x06, 0x03, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0xfc, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0xe6, 0x10, 0x18, 0x08, 0x88, 0x88, 0x0b, 0x0f, 0xcb, 0xfc, 0xc0},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0x40, 0x40, 0x20, 0x20, 0x20, 0xf8, 0x08, 0x08, 0x88, 0x48, 0x28, 0x18, 0x10, 0x08, 0x08, 0x08, 0x08, 0x08, 0x10, 0x1c, 0x24, 0x48, 0xf0, 0x00, 0x00, 0x00},
};

const uint8_t oled_icon_sheep[4][40] = {
    {0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x3e, 0x30, 0x38, 0x1c, 0x1c, 0x02, 0x02, 0x02, 0x02, 0x01, 0x01, 0x01, 0x02, 0x02, 0x02, 0x02, 0x1e, 0x3f, 0x30, 0x3c, 0x02, 0x02, 0x02, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x1f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0xc4, 0x3c, 0x04, 0x04, 0x05, 0x06, 0x03, 0x01, 0x00},
    {0x1c, 0x22, 0xf2, 0x42, 0x02, 0x01, 0x03, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x07, 0x06, 0x06, 0x06, 0x02, 0x00, 0x00, 0x00, 0xf0, 0x08, 0x04, 0x04, 0x65, 0x06, 0x08, 0x10, 0x20, 0xc0, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x00, 0x80, 0x80, 0x80, 0x80, 0x40, 0x40, 0x40, 0x80, 0x40, 0x40, 0x80, 0x00, 0x80, 0x80, 0xb0, 0xc8, 0x68, 0x08, 0xf0, 0x68, 0x48, 0x70, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

const uint8_t oled_icon_duck[4][40] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x04, 0x04, 0x08, 0x08, 0x13, 0x14, 0x1b, 0x14, 0x18, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x10, 0x08, 0x08, 0x04, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x01, 0x02, 0x04, 0x09, 0x11, 0x61, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x06, 0xf9, 0x06, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x05, 0x18, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00, 0x80, 0x40, 0x20, 0x20, 0x10, 0x10, 0x10, 0x28, 0x28, 0x48, 0x88, 0x49, 0x4e, 0xf0, 0x00, 0x00, 0x00, 0x0c, 0x1e, 0x31, 0x61, 0xc1, 0xc1, 0x86, 0x88, 0x90, 0xa0, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe0, 0x18, 0x04, 0x06, 0x06, 0xc6, 0xc6, 0x06, 0x0e, 0x1c, 0x18, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

const uint8_t oled_icon_fish[4][40] = {
    {0x00, 0x00, 0x00, 0x08, 0x17, 0x24, 0x18, 0x09, 0x13, 0x15, 0x15, 0x13, 0x11, 0x0a, 0x08, 0x04, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x01, 0x23, 0x5c, 0x90, 0x60, 0x24, 0x4c, 0x54, 0x54, 0x4c, 0x47, 0x28, 0x21, 0x11, 0x08, 0x07},
    {0x00, 0xf8, 0x50, 0xd0, 0x08, 0x07, 0x02, 0x02, 0x01, 0x01, 0x01, 0x01, 0xe1, 0x02, 0x62, 0x64, 0x18, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe0, 0x40, 0x40, 0x20, 0x1c, 0x0a, 0x0a, 0x05, 0x05, 0x05, 0x05, 0x86, 0x08, 0x88, 0x90, 0x60, 0x80},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x80, 0x40, 0x40, 0x40, 0x40, 0x03, 0x01, 0x23, 0x5c, 0x90, 0x60, 0x24, 0x4c, 0x54, 0x54, 0x4c, 0x47, 0x28, 0x21, 0x11, 0x08, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe0, 0x40, 0x40, 0x20, 0x1c, 0x0a, 0x0a, 0x05, 0x05, 0x05, 0x05, 0x86, 0x08, 0x88, 0x90, 0x60, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

const uint8_t oled_icon_egg[4][40] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0e, 0x18, 0x10, 0x20, 0x60, 0x40, 0x40, 0x40, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x40, 0x40, 0x40, 0x60, 0x20, 0x30, 0x18, 0x0e, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf3, 0x12, 0x36, 0x38, 0x40, 0x20, 0x30, 0x10, 0x10, 0x30, 0x20, 0x40, 0x40, 0x20, 0x30, 0x10, 0x10, 0x30, 0x20, 0x40, 0x5c, 0x24, 0x12, 0xf3, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7c, 0x84, 0x08, 0x10, 0x10, 0x10, 0x08, 0x06, 0x11, 0x38, 0x10, 0x00, 0x60, 0x90, 0x90, 0x60, 0x00, 0x10, 0x38, 0x11, 0x0e, 0x18, 0x10, 0x10, 0x10, 0x08, 0x84, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe0, 0x90, 0x98, 0x98, 0x60, 0x00, 0x00, 0x80, 0x40, 0x40, 0x40, 0x20, 0x20, 0x60, 0x40, 0x47, 0x9d, 0x19, 0x09, 0x0e, 0x00, 0x60, 0x90, 0xb0, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

const uint8_t oled_icon_eggs[4][40] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x02, 0x03, 0x04, 0x18, 0x10, 0x30, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x20, 0x10, 0x10, 0x08, 0x06, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0x30, 0x40, 0x80, 0x00, 0x00, 0xf0, 0x0e, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x3c, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x40, 0x30, 0x08, 0x04, 0x04, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x0c, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0x30, 0x08, 0x04, 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x04, 0x04, 0x08, 0x10, 0x60, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

const uint8_t oled_icon_thermo[4][40] = {
    {0x00, 0x07, 0x1f, 0x3f, 0x7f, 0xff, 0xff, 0xff, 0xff, 0xff, 0x7f, 0x3f, 0x1f, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0xc0, 0xe0, 0xf0, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf0, 0xe0, 0xc0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f, 0x18, 0x30, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xfc, 0xfc, 0xfe, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0xfe, 0x06, 0x02, 0x02, 0xfe, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3c, 0x24, 0x24, 0x3c, 0x00, 0x00, 0x00, 0x80, 0xc0, 0x40, 0x40, 0x40, 0x40, 0x40, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
};

static const uint8_t oled_font[96][6] = {
	{0x00,0x00,0x00,0x00,0x00,0x00}, //  
	{0x2e,0x00,0x00,0x00,0x00,0x00}, // !
	{0x06,0x00,0x06,0x00,0x00,0x00}, // "
	{0x14,0x3e,0x14,0x3e,0x14,0x00}, // #
	{0x28,0x2c,0x76,0x14,0x00,0x00}, // $
	{0x02,0x30,0x08,0x06,0x20,0x00}, // %
	{0x14,0x2a,0x2a,0x10,0x28,0x00}, // &
	{0x06,0x00,0x00,0x00,0x00,0x00}, // '
	{0x1c,0x22,0x00,0x00,0x00,0x00}, // (
	{0x22,0x1c,0x00,0x00,0x00,0x00}, // )
	{0x0a,0x04,0x0a,0x00,0x00,0x00}, // *
	{0x08,0x1c,0x08,0x00,0x00,0x00}, // +
	{0x40,0x20,0x00,0x00,0x00,0x00}, // ,
	{0x08,0x08,0x08,0x00,0x00,0x00}, // -
	{0x00,0x20,0x00,0x00,0x00,0x00}, // .
	{0x20,0x10,0x08,0x04,0x02,0x00}, // /
	{0x1c,0x22,0x22,0x1c,0x00,0x00}, // 0
	{0x02,0x3e,0x00,0x00,0x00,0x00}, // 1
	{0x32,0x2a,0x2a,0x24,0x00,0x00}, // 2
	{0x22,0x2a,0x2a,0x14,0x00,0x00}, // 3
	{0x18,0x14,0x3e,0x10,0x00,0x00}, // 4
	{0x2e,0x2a,0x2a,0x12,0x00,0x00}, // 5
	{0x1c,0x2a,0x2a,0x10,0x00,0x00}, // 6
	{0x02,0x32,0x0a,0x06,0x00,0x00}, // 7
	{0x14,0x2a,0x2a,0x14,0x00,0x00}, // 8
	{0x04,0x2a,0x2a,0x1c,0x00,0x00}, // 9
	{0x00,0x00,0x14,0x00,0x00,0x00}, // :
	{0x34,0x00,0x00,0x00,0x00,0x00}, // ;
	{0x08,0x14,0x22,0x00,0x00,0x00}, // <
	{0x14,0x14,0x14,0x00,0x00,0x00}, // =
	{0x22,0x14,0x08,0x00,0x00,0x00}, // >
	{0x02,0x2a,0x0a,0x04,0x00,0x00}, // ?
	{0x1c,0x22,0x3a,0x2a,0x1c,0x00}, // @
	{0x3c,0x12,0x12,0x3c,0x00,0x00}, // A
	{0x3e,0x2a,0x2a,0x14,0x00,0x00}, // B
	{0x1c,0x22,0x22,0x00,0x00,0x00}, // C
	{0x3e,0x22,0x22,0x1c,0x00,0x00}, // D
	{0x3e,0x2a,0x2a,0x00,0x00,0x00}, // E
	{0x3e,0x0a,0x0a,0x00,0x00,0x00}, // F
	{0x1c,0x22,0x2a,0x3a,0x00,0x00}, // G
	{0x3e,0x08,0x08,0x3e,0x00,0x00}, // H
	{0x22,0x3e,0x22,0x00,0x00,0x00}, // I
	{0x10,0x20,0x22,0x1e,0x00,0x00}, // J
	{0x3e,0x08,0x14,0x22,0x00,0x00}, // K
	{0x3e,0x20,0x20,0x00,0x00,0x00}, // L
	{0x3e,0x04,0x08,0x04,0x3e,0x00}, // M
	{0x3e,0x04,0x08,0x3e,0x00,0x00}, // N
	{0x1c,0x22,0x22,0x1c,0x00,0x00}, // O
	{0x3e,0x12,0x12,0x0c,0x00,0x00}, // P
	{0x1c,0x22,0x22,0x5c,0x00,0x00}, // Q
	{0x3e,0x12,0x12,0x2c,0x00,0x00}, // R
	{0x24,0x2a,0x2a,0x12,0x00,0x00}, // S
	{0x02,0x3e,0x02,0x00,0x00,0x00}, // T
	{0x1e,0x20,0x20,0x1e,0x00,0x00}, // U
	{0x1e,0x20,0x18,0x06,0x00,0x00}, // V
	{0x1e,0x20,0x1c,0x20,0x1e,0x00}, // W
	{0x36,0x08,0x08,0x36,0x00,0x00}, // X
	{0x06,0x28,0x28,0x1e,0x00,0x00}, // Y
	{0x32,0x2a,0x26,0x00,0x00,0x00}, // Z
	{0x00,0x00,0x3e,0x22,0x00,0x00}, // [
	{0x02,0x04,0x08,0x10,0x20,0x00}, // "\"
	{0x00,0x00,0x22,0x3e,0x00,0x00}, // ]
	{0x04,0x02,0x04,0x00,0x00,0x00}, // ^
	{0x20,0x20,0x20,0x20,0x00,0x00}, // _
	{0x02,0x04,0x00,0x00,0x00,0x00}, // `
	{0x18,0x24,0x24,0x3c,0x00,0x00}, // a
	{0x3e,0x24,0x24,0x18,0x00,0x00}, // b
	{0x18,0x24,0x24,0x00,0x00,0x00}, // c
	{0x18,0x24,0x24,0x3e,0x00,0x00}, // d
	{0x18,0x34,0x2c,0x08,0x00,0x00}, // e
	{0x08,0x3c,0x0a,0x00,0x00,0x00}, // f
	{0x18,0xa4,0xa4,0x7c,0x00,0x00}, // g
	{0x3e,0x04,0x04,0x38,0x00,0x00}, // h
	{0x00,0x00,0x3a,0x00,0x00,0x00}, // i
	{0x00,0x00,0x80,0x7a,0x00,0x00}, // j
	{0x3e,0x10,0x18,0x24,0x00,0x00}, // k
	{0x00,0x00,0x1e,0x20,0x00,0x00}, // l
	{0x3c,0x04,0x3c,0x04,0x38,0x00}, // m
	{0x3c,0x04,0x04,0x38,0x00,0x00}, // n
	{0x18,0x24,0x24,0x18,0x00,0x00}, // o
	{0xfc,0x24,0x24,0x18,0x00,0x00}, // p
	{0x18,0x24,0x24,0xfc,0x00,0x00}, // q
	{0x3c,0x08,0x04,0x00,0x00,0x00}, // r
	{0x28,0x2c,0x34,0x14,0x00,0x00}, // s
	{0x04,0x1e,0x24,0x00,0x00,0x00}, // t
	{0x1c,0x20,0x20,0x3c,0x00,0x00}, // u
	{0x1c,0x20,0x10,0x0c,0x00,0x00}, // v
	{0x0c,0x30,0x0c,0x30,0x0c,0x00}, // w
	{0x24,0x18,0x24,0x00,0x00,0x00}, // x
	{0x1c,0xa0,0xa0,0x7c,0x00,0x00}, // y
	{0x24,0x34,0x2c,0x24,0x00,0x00}, // z
	{0x08,0x36,0x22,0x00,0x00,0x00}, // {
	{0x3e,0x00,0x00,0x00,0x00,0x00}, // |
	{0x22,0x36,0x08,0x00,0x00,0x00}, // }
	{0x04,0x02,0x04,0x02,0x00,0x00}, // ~
	{0x00,0x00,0x00,0x00,0x00,0x00}
};

static const uint8_t oled_nibble_stretch[16] = {
    0x00, 0x03, 0x0c, 0x0f, 0x30, 0x33, 0x3c, 0x3f,
    0xc0, 0xc3, 0xcc, 0xcf, 0xf0, 0xf3, 0xfc, 0xff
};

static const SPIConfig oled_spi_cfg = {
  NULL, OLED_CS_PORT, OLED_CS_PIN,
  SPI_CR1_BR_2 | SPI_CR1_CPOL | SPI_CR1_CPHA, 0
};

void oled_init() {
    /* Reset OLED */
    palClearPad(OLED_RST_PORT, OLED_RST_PIN);
    chThdSleepMilliseconds(1000);
    palSetPad(OLED_RST_PORT, OLED_RST_PIN);

    /* SPI Config */
    spiStart(&OLED_SPID, &oled_spi_cfg);

    /* Send initialisation commands */
    palClearPad(OLED_DC_PORT, OLED_DC_PIN);
    spiSelect(&OLED_SPID);
    spiSend(&OLED_SPID, sizeof(oled_init_cmds), (void*)oled_init_cmds);
    spiUnselect(&OLED_SPID);
}

void oled_logo() {
    memcpy(oled_buffer, oled_sv_logo, sizeof(oled_sv_logo));
}

void oled_icon(const uint8_t* icon)
{
    int x, y;
    for(y=0; y<4; y++)
        for(x=0; x<40; x++)
            oled_buffer[3-y][x+88] = *(icon + y*40 + x);
}

void oled_erase() {
    memset(oled_buffer, 0, sizeof(oled_buffer));
}

void oled_text_small(uint8_t line, uint8_t x, const char* str)
{
    int i, j;
    int len = strnlen(str, 21-x);
    
    if(line > 3)
        line = 0;

    if(x > 20)
        x = 0;

    for(i=0; i<len; i++) {
        char c = str[i];
        if(c < ' ' || c > '~')
            c = 0;
        else
            c -= ' ';
        
        for(j=0; j<6; j++) {
            oled_buffer[line][1+(x+i)*6+j] = oled_font[(int)c][j];
        }
    }
}

void oled_text_big(uint8_t line, uint8_t x, const char* str)
{
    int i, j;
    int len = strnlen(str, 10-x);
    
    if(line > 1)
        line = 0;

    if(x > 9)
        x = 0;

    for(i=0; i<len; i++) {
        char c = str[i];
        if(c < ' ' || c > '~')
            c = 0;
        else
            c -= ' ';

        for(j=0; j<6; j++) {
            oled_buffer[line*2+0][1+(x+i)*12+j*2+0] =
                oled_nibble_stretch[oled_font[(int)c][j] & 0x0F];
            oled_buffer[line*2+0][1+(x+i)*12+j*2+1] =
                oled_nibble_stretch[oled_font[(int)c][j] & 0x0F];
            oled_buffer[line*2+1][1+(x+i)*12+j*2+0] =
                oled_nibble_stretch[oled_font[(int)c][j] >> 4];
            oled_buffer[line*2+1][1+(x+i)*12+j*2+1] =
                oled_nibble_stretch[oled_font[(int)c][j] >> 4];
        }
    }
}

void oled_draw()
{
    /* Write the buffer to the OLED */
    palClearPad(OLED_DC_PORT, OLED_DC_PIN);
    palSetPad(OLED_DC_PORT, OLED_DC_PIN);
    spiSelect(&OLED_SPID);
    spiSend(&OLED_SPID, sizeof(oled_buffer), (void*)oled_buffer);
    spiUnselect(&OLED_SPID);
}
