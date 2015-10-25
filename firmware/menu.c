#include <stdint.h>
#include <stdio.h>
#include "menu.h"
#include "ch.h"
#include "drivers/oled.h"
#include "drivers/rotenc.h"
#include "rtc.h"

static event_listener_t rotenc_el;

typedef struct {
    const char name[16];
    const uint8_t* icon;
} menu_item;

#define MENU_LEN (11)
static const menu_item menu_items[MENU_LEN] = {
    {"Beef", (const uint8_t*)oled_icon_cow},
    {"Pork", (const uint8_t*)oled_icon_pig},
    {"Lamb", (const uint8_t*)oled_icon_sheep},
    {"Duck", (const uint8_t*)oled_icon_duck},
    {"Fish", (const uint8_t*)oled_icon_fish},
    {"Eggs", (const uint8_t*)oled_icon_eggs},
    {"Custom", (const uint8_t*)oled_icon_thermo},
    {"Display Time", NULL},
    {"Set Time", NULL},
    {"Set backup reg", NULL},
    {"Read backup reg", NULL}
};

void disp_time(void)
{
    RTCDateTime thetime;
    uint8_t hour, min, sec;
    char time_buf[9];
    eventflags_t eflags;

    while(1)
    {
        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_PRESS_FLAG)
            return;

        rtcGetTime(&RTCD1, &thetime);
        hour = thetime.millisecond / 3600000;
        min = (thetime.millisecond % 3600000)/60000;
        sec = (thetime.millisecond % 60000) / 1000;

        chsnprintf(time_buf, 9, "%02d:%02d:%02d", hour, min, sec);              
        oled_erase();
        oled_text_big(0, 1, time_buf);
        oled_draw();
    }
}

void set_time(void)
{
    RTCDateTime newtime;
    int8_t hour, min, sec;
    uint8_t which_set = 0;
    bool disp_hour=true, disp_min=true, disp_sec=true;
    char time_buf[9];
    eventflags_t eflags;

    rtcGetTime(&RTCD1, &newtime);
    hour = newtime.millisecond / 3600000;
    min = (newtime.millisecond % 3600000)/60000;
    sec = (newtime.millisecond % 60000) / 1000;

    while(1)
    {
        if(disp_hour)
            chsnprintf(time_buf, 4, "%02d:", hour);
        else
            chsnprintf(time_buf, 4, "  :");
        if(disp_min)
            chsnprintf(time_buf+3, 4, "%02d:", min);
        else
            chsnprintf(time_buf+3, 4, "  :");
        if(disp_sec)
            chsnprintf(time_buf+6, 3, "%02d", sec);
        else
            chsnprintf(time_buf+6, 3, "  ");
        
        oled_erase();
        oled_text_big(0, 1, time_buf);
        oled_draw();

        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(which_set == 0)
        {
            disp_hour = !disp_hour;
            if(eflags & ROTENC_LEFT_FLAG)
            {
                hour--;
                disp_hour = true;
            }
            if(eflags & ROTENC_RIGHT_FLAG)
            {
                hour++;
                disp_hour = true;
            }
            if(hour >= 24)
                hour = 0;
            if(hour < 0)
                hour = 23;
            if(eflags & ROTENC_PRESS_FLAG)
            {
                disp_hour = true;
                which_set++;
                continue;
            }
        }
        if(which_set == 1)
        {
            disp_min = !disp_min;
            if(eflags & ROTENC_LEFT_FLAG)
            {
                min--;
                disp_min = true;
            }
            if(eflags & ROTENC_RIGHT_FLAG)
            {
                min++;
                disp_min = true;
            }
            if(min >= 60)
                min = 0;
            if(min < 0)
                min = 59;
            if(eflags & ROTENC_PRESS_FLAG)
            {
                disp_min = true;
                which_set++;
                continue;
            }
        }
        if(which_set == 2)
        {
            disp_sec = !disp_sec;
            if(eflags & ROTENC_LEFT_FLAG)
            {
                sec--;
                disp_sec = true;
            }
            if(eflags & ROTENC_RIGHT_FLAG)
            {
                sec++;
                disp_sec = true;
            }
            if(sec >= 60)
                sec = 0;
            if(sec < 0)
                sec = 59;
            if(eflags & ROTENC_PRESS_FLAG)
                break;
        }
    }
    newtime.millisecond = (60*60*1000*hour +
                           60*1000*min +
                           1000*sec);
    rtcSetTime(&RTCD1, &newtime);
}

void set_bkup(void)
{
    eventflags_t eflags;
    uint8_t value = 0;
    char buf[4];

    while(1)
    {
        chsnprintf(buf, 4, "%03d", value);
        oled_erase();
        oled_text_big(0, 1, buf);
        oled_draw();

        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_LEFT_FLAG)
            value--;
        if(eflags & ROTENC_RIGHT_FLAG)
            value++;
        if(eflags & ROTENC_PRESS_FLAG)
        {
            RTC->BKP0R = value;
            return;
        }
    }
}

void disp_bkup(void)
{
    eventflags_t eflags;
    uint8_t value = RTC->BKP0R;
    char buf[4];

    chsnprintf(buf, 4, "%03d", value);
    oled_erase();
    oled_text_big(0, 1, buf);
    oled_draw();

    while(1)
    {
        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_PRESS_FLAG)
            return;
    }
}

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
            if(menu_idx == 7)
                disp_time();
            if(menu_idx == 8)
                set_time();
            if(menu_idx == 9)
                set_bkup();
            if(menu_idx == 10)
                disp_bkup();
        }
    }
}
