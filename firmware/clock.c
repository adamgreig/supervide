#include <stdint.h>
#include <stdio.h>
#include "ch.h"
#include "chprintf.h"
#include "drivers/oled.h"
#include "drivers/rotenc.h"
#include "drivers/piezo.h"
#include "rtc.h"
#include "clock.h"

void rtc_disp_time(void)
{
    RTCDateTime thetime;
    uint8_t hour, min, sec;
    char time_buf[9];
    eventflags_t eflags;
    event_listener_t rotenc_el;

    chEvtRegister(&rotenc_es, &rotenc_el, 0);

    while(1)
    {
        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_PRESS_FLAG)
        {
            piezo_beep(50);
            chEvtUnregister(&rotenc_es, &rotenc_el);
            return;
        }

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

void rtc_set_time(void)
{
    RTCDateTime newtime;
    int8_t hour, min, sec;
    uint8_t which_set = 0;
    bool disp_hour=true, disp_min=true, disp_sec=true;
    char time_buf[9];
    eventflags_t eflags;
    event_listener_t rotenc_el;

    chEvtRegister(&rotenc_es, &rotenc_el, 0);

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
                piezo_beep(1);
                hour--;
                disp_hour = true;
            }
            if(eflags & ROTENC_RIGHT_FLAG)
            {
                piezo_beep(1);
                hour++;
                disp_hour = true;
            }
            if(hour >= 24)
                hour = 0;
            if(hour < 0)
                hour = 23;
            if(eflags & ROTENC_PRESS_FLAG)
            {
                piezo_beep(50);
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
                piezo_beep(1);
                min--;
                disp_min = true;
            }
            if(eflags & ROTENC_RIGHT_FLAG)
            {
                piezo_beep(1);
                min++;
                disp_min = true;
            }
            if(min >= 60)
                min = 0;
            if(min < 0)
                min = 59;
            if(eflags & ROTENC_PRESS_FLAG)
            {
                piezo_beep(50);
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
                piezo_beep(1);
                sec--;
                disp_sec = true;
            }
            if(eflags & ROTENC_RIGHT_FLAG)
            {
                piezo_beep(1);
                sec++;
                disp_sec = true;
            }
            if(sec >= 60)
                sec = 0;
            if(sec < 0)
                sec = 59;
            if(eflags & ROTENC_PRESS_FLAG)
            {
                piezo_beep(50);
                break;
            }
        }
    }
    newtime.millisecond = (60*60*1000*hour +
                           60*1000*min +
                           1000*sec);
    rtcSetTime(&RTCD1, &newtime);
    chEvtUnregister(&rotenc_es, &rotenc_el);
}

void rtc_set_bkup(void)
{
    eventflags_t eflags;
    uint8_t value = 0;
    char buf[4];
    event_listener_t rotenc_el;

    chEvtRegister(&rotenc_es, &rotenc_el, 0);

    while(1)
    {
        chsnprintf(buf, 4, "%03d", value);
        oled_erase();
        oled_text_big(0, 1, buf);
        oled_draw();

        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_LEFT_FLAG)
        {
            piezo_beep(1);
            value--;
        }
        if(eflags & ROTENC_RIGHT_FLAG)
        {
            piezo_beep(1);
            value++;
        }
        if(eflags & ROTENC_PRESS_FLAG)
        {
            piezo_beep(50);
            RTC->BKP0R = value;
            chEvtUnregister(&rotenc_es, &rotenc_el);
            return;
        }
    }
}

void rtc_disp_bkup(void)
{
    eventflags_t eflags;
    uint8_t value = RTC->BKP0R;
    char buf[4];
    event_listener_t rotenc_el;

    chEvtRegister(&rotenc_es, &rotenc_el, 0);

    chsnprintf(buf, 4, "%03d", value);
    oled_erase();
    oled_text_big(0, 1, buf);
    oled_draw();

    while(1)
    {
        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_PRESS_FLAG)
        {
            piezo_beep(50);
            chEvtUnregister(&rotenc_es, &rotenc_el);
            return;
        }
    }
}

