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
    adcConvGrp.chselr = 1<<3; /* Current sense channel */
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

uint32_t sqrt_int(uint32_t a_nInput)
{
    uint32_t op  = a_nInput;
    uint32_t res = 0;
    uint32_t one = 1uL << 30; // The second-to-top bit is set: use 1u << 14 for uint16_t type; use 1uL<<30 for uint32_t type


    // "one" starts at the highest power of four <= than the argument.
    while (one > op)
    {
        one >>= 2;
    }

    while (one != 0)
    {
        if (op >= res + one)
        {
            op = op - (res + one);
            res = res +  2 * one;
        }
        res >>= 1;
        one >>= 2;
    }

    /* Do arithmetic rounding to nearest integer */
    if (op > res)
    {
        res++;
    }

    return res;
}

void *power_currentsense_thread(void *arg)
{
    uint16_t raw_buf[20];
    uint32_t cycle_buf[255];
    uint8_t raw_ptr, cycle_ptr;
    uint32_t sum;

    while(1)
    {
        /* Read 
        result = adcConvert(&ADCD1, &adcConvGrp, raw_buf, 20);
        if(result != MSG_OK)
            while(1); /* TODO: HANDLE THIS! */

        sum = 0;
        for(raw_ptr=0; raw_ptr<20; raw_ptr++)
        {
            uint16_t current = (raw_buf[raw_ptr] & 4095) * 3300 / 4095;
            sum += current * current;
        }
        
        cycle_buf[cycle_ptr] = sqrt_int(sum/20);
        cycle_ptr++;
    }
}

/* Return measured current in mA */
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
    return raw; /* TODO FIXME DEBUG */
    raw &= 4095;
    millivolts = raw * 3300 / 4095;
    
    /* Sensor returns 56mV/A, so I = millivolts / 56 */
    return millivolts / 56;
}

#endif

