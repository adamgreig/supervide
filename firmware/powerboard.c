#ifndef POWERBOARD_H
#define POWERBOARD_H

#include <stdint.h>
#include <stdbool.h>

#include "hal.h"
#include "board.h"

#include "powerboard.h"

ADCConversionGroup adcConvGrp;
struct _pwm_struct
{
    virtual_timer_t timer;
    uint8_t pwm_value;
    bool up_cycle;
};
struct _pwm_struct triacPwm;

void *triacPwmTimer_cb(void *par)
{
    (void)par;
    /* Hardcode fully on and fully off so we don't get blips */
    if(triacPwm.pwm_value == 0 || triacPwm.pwm_value == 255)
    {
        if(triacPwm.pwm_value == 0)
            palClearPad(GPIOB, GPIOB_TRIAC);
        if(triacPwm.pwm_value == 255)
            palSetPad(GPIOB, GPIOB_TRIAC);
        chSysLockFromISR();
        /* Delay full period of 2.55s = 2550ms */
        chVTSetI(&(triacPwm.timer), MS2ST(2550), (vtfunc_t)triacPwmTimer_cb,
                 NULL);
        chSysUnlockFromISR();
        return NULL;
    }

    triacPwm.up_cycle = !triacPwm.up_cycle;
    if(triacPwm.up_cycle)
    {
        palSetPad(GPIOB, GPIOB_TRIAC);
        chSysLockFromISR();
        chVTSetI(&(triacPwm.timer), MS2ST(10*triacPwm.pwm_value),
                 (vtfunc_t)triacPwmTimer_cb, NULL);
        chSysUnlockFromISR();
    }
    else
    {
        palClearPad(GPIOB, GPIOB_TRIAC);
        chSysLockFromISR();
        chVTSetI(&(triacPwm.timer), MS2ST(10*(255-triacPwm.pwm_value)),
                (vtfunc_t)triacPwmTimer_cb, NULL);
        chSysUnlockFromISR();
    }
    return NULL;
}

/* Setup PWM, IO, ADCs */
void power_init(void)
{
    /* PWM init: */
    /* Start cb timer with 2.55s period */
    triacPwm.pwm_value = 0;
    triacPwm.up_cycle = false;
    chVTObjectInit(&(triacPwm.timer));
    chVTSet(&(triacPwm.timer), MS2ST(2550),
            (vtfunc_t)triacPwmTimer_cb, NULL);

    /* ADC init */
    /* halInit does adcInit and adcObjectInit */
    /* adcInit runs adc_lld_init which does calibration, amongst other things
     */
    adcStart(&ADCD1, NULL);
    adcConvGrp.circular = false;
    adcConvGrp.num_channels = 1;
    adcConvGrp.end_cb = NULL;
    adcConvGrp.error_cb = NULL;
    /* STM32F072-specific convgrp settings: */
    adcConvGrp.cfgr1 = 0;
    adcConvGrp.tr = 0; /* Don't care */
    adcConvGrp.smpr = 6; /* 71.5 ADC clocks: complete guess */
    adcConvGrp.chselr = 3; /* Current sense channel */
}

/* Set master relay on or off */
void power_set_master(bool state)
{
    if(state)
        palSetPad(GPIOB, GPIOB_RELAY_M);
    else
        palClearPad(GPIOB, GPIOB_RELAY_M);
}

/* Set preheat relay on or off */
void power_set_preheat(bool state)
{
    if(state)
        palSetPad(GPIOB, GPIOB_RELAY_PH);
    else
        palClearPad(GPIOB, GPIOB_RELAY_PH);
}

/* Set TRIAC level from 0 (fully off) to 255 (fully on)
 * This controls the number of live half cycles over a 2.55s period */
void power_set_triac(uint8_t level)
{
    triacPwm.pwm_value = level;
}

uint16_t power_get_current(void)
{
    uint16_t raw; /* Value straight from ADC */
    uint32_t millivolts; /* Voltage at pin in mV */
    msg_t result;

    /* First retrieve the reading: */
    result = adcConvert(&ADCD1, &adcConvGrp, &raw, 1);
    if(result != MSG_OK)
        while(1); /* TODO: HANDLE THIS! */

    /* Assume data is right-aligned. TODO: ensure this */

    raw &= 4095;
    millivolts = raw * 3300 / 4095;
    
    /* Sensor returns 56mV/A, so I = millivolts / 56 */
    return millivolts / 56;
}

#endif

