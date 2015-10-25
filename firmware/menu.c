#include <stdint.h>
#include <stdio.h>
#include "menu.h"
#include "ch.h"
#include "drivers/oled.h"
#include "drivers/rotenc.h"
#include "clock.h"

typedef struct {
    const char big_text[16];
    const char small_text[16];
    const uint8_t* icon;
    void (*func)(void);
} menu_item;

void do_menu(const menu_item *menu_items, uint8_t num_items);
void do_beef(void);

static const uint8_t root_menu_len = 11;
static const menu_item root_menu[11] = {
    {"COOK:", "Beef", (const uint8_t*)oled_icon_cow, do_beef},
    {"COOK:", "Pork", (const uint8_t*)oled_icon_pig, NULL},
    {"COOK:", "Lamb", (const uint8_t*)oled_icon_sheep, NULL},
    {"COOK:", "Duck", (const uint8_t*)oled_icon_duck, NULL},
    {"COOK:", "Fish", (const uint8_t*)oled_icon_fish, NULL},
    {"COOK:", "Eggs", (const uint8_t*)oled_icon_eggs, NULL},
    {"COOK:", "Custom", (const uint8_t*)oled_icon_thermo, NULL},
    {"SETTINGS:", "Display Time", NULL, rtc_disp_time},
    {"SETTINGS:", "Set Time", NULL, rtc_set_time},
    {"SETTINGS:", "Set backup reg", NULL, rtc_set_bkup},
    {"SETTINGS:", "Read backup reg", NULL, rtc_disp_bkup}
};

static const uint8_t beef_menu_len = 6;
static const menu_item beef_menu[6] = {
    {"BEEF:", "Rare", (const uint8_t*)oled_icon_cow, NULL},
    {"BEEF:", "Med Rare", (const uint8_t*)oled_icon_cow, NULL},
    {"BEEF:", "Medium", (const uint8_t*)oled_icon_cow, NULL},
    {"BEEF:", "Med Done", (const uint8_t*)oled_icon_cow, NULL},
    {"BEEF:", "Well Done", (const uint8_t*)oled_icon_cow, NULL},
    {"", "Back", NULL, NULL},
};

void do_menu(const menu_item *menu_items, uint8_t num_items)
{
    int menu_idx = 0;
    eventflags_t eflags;
    event_listener_t rotenc_el;
    chEvtRegister(&rotenc_es, &rotenc_el, 0);
    while(1)
    {
        oled_erase();
        oled_text_big(0, 0, menu_items[menu_idx].big_text);
        oled_text_small(3, 0, menu_items[menu_idx].small_text);
        oled_icon(menu_items[menu_idx].icon);
        oled_draw();

        chEvtWaitOne(ALL_EVENTS);
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_LEFT_FLAG)
        {
            menu_idx -= 1;
            if(menu_idx < 0)
                menu_idx = num_items - 1;
        }
        else if(eflags & ROTENC_RIGHT_FLAG)
        {
            menu_idx += 1;
            if(menu_idx >= num_items)
                menu_idx = 0;
        }
        else if(eflags & ROTENC_PRESS_FLAG)
        {
            rotenc_led(ROTENC_CYAN);
            chThdSleepMilliseconds(200);
            rotenc_led(ROTENC_BLANK);
            /* Unregister before going back or calling func */
            chEvtUnregister(&rotenc_es, &rotenc_el);
            /* NULL function acts as back button */
            if(menu_items[menu_idx].func == NULL)
                return;
            else
                (*(menu_items[menu_idx].func))();
            chEvtRegister(&rotenc_es, &rotenc_el, 0);
        }
    }
}

void do_beef(void)
{
    do_menu(beef_menu, beef_menu_len);
}

void MenuThread(void* arg)
{
    (void)arg;

    while(1)
        do_menu(root_menu, root_menu_len);
}
