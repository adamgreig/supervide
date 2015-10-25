#include <stdint.h>
#include "menu.h"
#include "ch.h"
#include "drivers/oled.h"
#include "drivers/rotenc.h"
#include "drivers/piezo.h"

static event_listener_t rotenc_el;

typedef struct {
    const char name[16];
    const uint8_t* icon;
} menu_item;

#define MENU_LEN (7)

static const menu_item menu_items[MENU_LEN] = {
    {"Beef", (const uint8_t*)oled_icon_cow},
    {"Pork", (const uint8_t*)oled_icon_pig},
    {"Lamb", (const uint8_t*)oled_icon_sheep},
    {"Duck", (const uint8_t*)oled_icon_duck},
    {"Fish", (const uint8_t*)oled_icon_fish},
    {"Eggs", (const uint8_t*)oled_icon_eggs},
    {"Custom", (const uint8_t*)oled_icon_thermo}
};

void MenuThread(void* arg)
{
    (void)arg;

    int menu_idx = 0;
    eventflags_t eflags;

    chEvtRegister(&rotenc_es, &rotenc_el, 0);

    while(true) {
        oled_erase();
        oled_text_big(0, 0, "COOK:");
        oled_icon(menu_items[menu_idx].icon);
        oled_text_small(3, 0, menu_items[menu_idx].name);
        oled_draw();

        chEvtWaitOne(ALL_EVENTS);
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        piezo_beep();
        if(eflags & ROTENC_LEFT_FLAG) {
            menu_idx -= 1;
            if(menu_idx < 0)
                menu_idx = MENU_LEN - 1;
        } else if(eflags & ROTENC_RIGHT_FLAG) {
            menu_idx += 1;
            if(menu_idx >= MENU_LEN)
                menu_idx = 0;
        } else if(eflags & ROTENC_PRESS_FLAG) {
            oled_erase();
            oled_draw();
            rotenc_led(ROTENC_WHITE);
            chThdSleepMilliseconds(200);
            rotenc_led(ROTENC_BLANK);
        }
    }
}
