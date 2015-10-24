#ifndef POWERBOARD_H
#define POWERBOARD_H

#include <stdint.h>
#include <stdbool.h>

#include "hal.h"
#include "board.h"

#include "powerboard.h"

PWMConfig pwmConf;
ADCConversionGroup adcConvGrp;

/* Setup PWM, IO, ADCs */
void power_init(void)
{
    /* PWM init: */
    pwmConf.frequency = 100;
    pwmConf.period = 255;
    pwmConf.callback = NULL;
    pwmConf.channels[0].mode = PWM_OUTPUT_ACTIVE_HIGH;
    pwmConf.channels[0].callback = NULL;
    pwmConf.channels[1].mode = PWM_OUTPUT_DISABLED;
    pwmConf.channels[1].callback = NULL;
    pwmConf.channels[2].mode = PWM_OUTPUT_DISABLED;
    pwmConf.channels[2].callback = NULL;
    pwmConf.channels[3].mode = PWM_OUTPUT_DISABLED;
    pwmConf.channels[3].callback = NULL;
    pwmStart(&PWMD1, &pwmConf);
    pwmDisableChannel(&PWMD1, 0);

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
    if(level == 0)
        pwmDisableChannel(&PWMD1, 0);
    else
        pwmEnableChannel(&PWMD1, 0, level);
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

