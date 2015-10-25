#include <stdint.h>
#include <stdio.h>
#include "menu.h"
#include "ch.h"
#include "chprintf.h"
#include "drivers/oled.h"
#include "drivers/rotenc.h"
#include "clock.h"

typedef struct {
    const char big_text[16];
    const char small_text[16];
    const uint8_t* icon;
    void (*func)(void);
} menu_item;

uint32_t get_cook_time(void);
void cook(uint8_t temperature, uint16_t time);
void do_menu(const menu_item *menu_items, uint8_t num_items);
void do_custom(void);

void do_beef_rare(void) {cook(0, get_cook_time()); }
void do_beef_medrare(void) {cook(0, get_cook_time()); }
void do_beef_med(void) {cook(0, get_cook_time()); }
void do_beef_meddone(void) {cook(0, get_cook_time()); }
void do_beef_done(void) {cook(0, get_cook_time()); }
static const uint8_t beef_menu_len = 6;
static const menu_item beef_menu[6] = {
    {"BEEF:", "Rare", (const uint8_t*)oled_icon_cow, do_beef_rare},
    {"BEEF:", "Med Rare", (const uint8_t*)oled_icon_cow, do_beef_medrare},
    {"BEEF:", "Medium", (const uint8_t*)oled_icon_cow, do_beef_med},
    {"BEEF:", "Med Done", (const uint8_t*)oled_icon_cow, do_beef_meddone},
    {"BEEF:", "Well Done", (const uint8_t*)oled_icon_cow, do_beef_done},
    {"", "Back", NULL, NULL},
};
void do_beef(void) { do_menu(beef_menu, beef_menu_len); }

void do_pork_rare(void) {cook(0, get_cook_time()); }
void do_pork_medrare(void) {cook(0, get_cook_time()); }
void do_pork_med(void) {cook(0, get_cook_time()); }
void do_pork_meddone(void) {cook(0, get_cook_time()); }
void do_pork_done(void) {cook(0, get_cook_time()); }
static const uint8_t pork_menu_len = 6;
static const menu_item pork_menu[6] = {
    {"PORK:", "Rare", (const uint8_t*)oled_icon_pig, do_pork_rare},
    {"PORK:", "Med Rare", (const uint8_t*)oled_icon_pig, do_pork_medrare},
    {"PORK:", "Medium", (const uint8_t*)oled_icon_pig, do_pork_med},
    {"PORK:", "Med Done", (const uint8_t*)oled_icon_pig, do_pork_meddone},
    {"PORK:", "Well Done", (const uint8_t*)oled_icon_pig, do_pork_done},
    {"", "Back", NULL, NULL},
};
void do_pork(void) { do_menu(pork_menu, pork_menu_len); }

void do_lamb_rare(void) {cook(0, get_cook_time()); }
void do_lamb_medrare(void) {cook(0, get_cook_time()); }
void do_lamb_med(void) {cook(0, get_cook_time()); }
void do_lamb_meddone(void) {cook(0, get_cook_time()); }
void do_lamb_done(void) {cook(0, get_cook_time()); }
static const uint8_t lamb_menu_len = 6;
static const menu_item lamb_menu[6] = {
    {"LAMB:", "Rare", (const uint8_t*)oled_icon_sheep, do_beef_rare},
    {"LAMB:", "Med Rare", (const uint8_t*)oled_icon_sheep, do_beef_medrare},
    {"LAMB:", "Medium", (const uint8_t*)oled_icon_sheep, do_beef_med},
    {"LAMB:", "Med Done", (const uint8_t*)oled_icon_sheep, do_beef_meddone},
    {"LAMB:", "Well Done", (const uint8_t*)oled_icon_sheep, do_beef_done},
    {"", "Back", NULL, NULL},
};
void do_lamb(void) { do_menu(lamb_menu, lamb_menu_len); }

void do_duck_med(void) {cook(0, get_cook_time()); }
void do_duck_meddone(void) {cook(0, get_cook_time()); }
void do_duck_done(void) {cook(0, get_cook_time()); }
static const uint8_t duck_menu_len = 4;
static const menu_item duck_menu[4] = {
    {"DUCK:", "Medium", (const uint8_t*)oled_icon_duck, do_duck_med},
    {"DUCK:", "Med Done", (const uint8_t*)oled_icon_duck, do_duck_meddone},
    {"DUCK:", "Well Done", (const uint8_t*)oled_icon_duck, do_duck_done},
    {"", "Back", NULL, NULL},
};
void do_duck(void) { do_menu(duck_menu, duck_menu_len); }

void do_fish_oily(void) {cook(0, get_cook_time()); }
void do_fish_white(void) {cook(0, get_cook_time()); }
void do_fish_shell(void) {cook(0, get_cook_time()); }
static const uint8_t fish_menu_len = 4;
static const menu_item fish_menu[4] = {
    {"FISH:", "Oily fish", (const uint8_t*)oled_icon_fish, do_fish_oily},
    {"FISH:", "White fish", (const uint8_t*)oled_icon_fish, do_fish_white},
    {"FISH:", "Shellfish", (const uint8_t*)oled_icon_fish, do_fish_shell},
    {"", "Back", NULL, NULL},
};
void do_fish(void) { do_menu(fish_menu, fish_menu_len); }

void do_eggs_runny(void) {cook(0, get_cook_time()); }
void do_eggs_jellied(void) {cook(0, get_cook_time()); }
void do_eggs_firm(void) {cook(0, get_cook_time()); }
static const uint8_t eggs_menu_len = 4;
static const menu_item eggs_menu[4] = {
    {"EGGS:", "Runny", (const uint8_t*)oled_icon_eggs, do_eggs_runny},
    {"EGGS:", "Jellied", (const uint8_t*)oled_icon_eggs, do_eggs_jellied},
    {"EGGS:", "Firm", (const uint8_t*)oled_icon_eggs, do_eggs_firm},
    {"", "Back", NULL, NULL},
};
void do_eggs(void) { do_menu(eggs_menu, eggs_menu_len); }

static const uint8_t root_menu_len = 11;
static const menu_item root_menu[11] = {
    {"COOK:", "Beef", (const uint8_t*)oled_icon_cow, do_beef},
    {"COOK:", "Pork", (const uint8_t*)oled_icon_pig, do_pork},
    {"COOK:", "Lamb", (const uint8_t*)oled_icon_sheep, do_lamb},
    {"COOK:", "Duck", (const uint8_t*)oled_icon_duck, do_duck},
    {"COOK:", "Fish", (const uint8_t*)oled_icon_fish, do_fish},
    {"COOK:", "Eggs", (const uint8_t*)oled_icon_eggs, do_eggs},
    {"COOK:", "Custom", (const uint8_t*)oled_icon_thermo, do_custom},
    {"SETTINGS:", "Display Time", NULL, rtc_disp_time},
    {"SETTINGS:", "Set Time", NULL, rtc_set_time},
    {"SETTINGS:", "Set backup reg", NULL, rtc_set_bkup},
    {"SETTINGS:", "Read backup reg", NULL, rtc_disp_bkup}
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

void MenuThread(void* arg)
{
    (void)arg;

    while(1)
        do_menu(root_menu, root_menu_len);
}

uint32_t get_cook_time(void)
{
    int16_t hours = 0;
    int8_t mins = 0;
    bool set_mins = false, disp_mins = true, disp_hours = true;
    char str_buf[9];
    eventflags_t eflags;
    event_listener_t rotenc_el;
    chEvtRegister(&rotenc_es, &rotenc_el, 0);

    while(1)
    {
        if(disp_hours)
            chsnprintf(str_buf, 6, "%3dh ", hours);
        else
            chsnprintf(str_buf, 6, "   h ");
        if(disp_mins)
            chsnprintf(str_buf+5, 4, "%02dm", mins);
        else
            chsnprintf(str_buf+5, 4, "  m");

        oled_erase();
        oled_text_big(0, 0, "Cook time:");
        oled_text_big(1, 0, str_buf);
        oled_draw();

        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(set_mins)
        {
            disp_mins = !disp_mins;
            if(eflags & ROTENC_LEFT_FLAG)
            {
                mins--;
                disp_mins = true;
            }
            else if(eflags & ROTENC_RIGHT_FLAG)
            {
                mins++;
                disp_mins = true;
            }
            else if(eflags & ROTENC_PRESS_FLAG)
            {
                chEvtUnregister(&rotenc_es, &rotenc_el);
                return hours*60 + mins;
            }
            if(mins >= 60)
                mins = 0;
            if(mins < 0)
                mins = 59;
        }
        else
        {
            disp_hours = !disp_hours;
            if(eflags & ROTENC_LEFT_FLAG)
            {
                hours--;
                disp_hours = true;
            }
            else if(eflags & ROTENC_RIGHT_FLAG)
            {
                hours++;
                disp_hours = true;
            }
            else if(eflags & ROTENC_PRESS_FLAG)
            {
                disp_hours = true;
                set_mins = true;
            }
            if(hours < 0)
                hours = 999;
            if(hours > 999)
                hours = 0;
        }
    }
}

/* Temp is temperature in celcius*2, time is time in mins */
void cook(uint8_t temp, uint16_t time)
{
    char buf[25];
    eventflags_t eflags;
    event_listener_t rotenc_el;
    chEvtRegister(&rotenc_es, &rotenc_el, 0);

    oled_erase();
    oled_text_big(0, 0, "Cooking:");
    chsnprintf(buf, 20, "Temp: %2d  `C", temp/2);
    oled_text_small(2, 0, buf);
    if(temp % 2 != 0)
        oled_text_small(2, 8, ".5");
    chsnprintf(buf, 20, "Time: %d mins", time);
    oled_text_small(3, 0, buf);
    oled_draw();

    while(1)
    {
        chEvtWaitOne(ALL_EVENTS);
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_PRESS_FLAG)
        {
            chEvtUnregister(&rotenc_es, &rotenc_el);
            return;
        }
    }
}

void do_custom(void)
{
    uint8_t temp=110; /* 2x temperature */
    char str_buf[3];
    eventflags_t eflags;
    event_listener_t rotenc_el;
    chEvtRegister(&rotenc_es, &rotenc_el, 0);

    oled_erase();
    oled_text_small(1, 0, "Temperature:");
    oled_icon((const uint8_t*)oled_icon_thermo);

    while(1)
    {
        chsnprintf(str_buf, 3, "%2d", temp/2);
        oled_text_big(1, 0, str_buf);
        if(temp % 2 != 0)
            oled_text_big(1, 2, ".5");
        else
            oled_text_big(1, 2, "  ");
        oled_text_big(1, 4, "`C");
        oled_draw();

        chEvtWaitOne(ALL_EVENTS);
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_LEFT_FLAG)
        {
            temp--;
            if(temp < 30*2)
                temp = 30*2;
        }
        else if(eflags & ROTENC_RIGHT_FLAG)
        {
            temp++;
            if(temp > 99*2)
                temp = 99*2;
        }
        else if(eflags & ROTENC_PRESS_FLAG)
        {
            chEvtUnregister(&rotenc_es, &rotenc_el);
            cook(temp, get_cook_time());
            return;
        }
    }
}
