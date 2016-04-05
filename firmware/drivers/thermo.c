#include "thermo.h"
#include "hal.h"
#include "drivers/oled.h"
#include "drivers/rotenc.h"
#include "drivers/piezo.h"
#include "chprintf.h"

static const ADCConversionGroup adcgrpthermo = {
    circular: false,
    num_channels: 1,
    end_cb: NULL,
    error_cb: NULL,
    cfgr1: 0,
    tr: 0,
    smpr: ADC_SMPR_SMP_239P5,
    chselr: (1<<0)
};

static const ADCConversionGroup adcgrpvintref = {
    circular: false,
    num_channels: 1,
    end_cb: NULL,
    error_cb: NULL,
    cfgr1: 0,
    tr: 0,
    smpr: ADC_SMPR_SMP_239P5,
    chselr: (1<<17)
};

/*
 * Read thermocouple.
 * Thermocouple amp attached to ADC1_IN0 outputs 5mV/'C
 * Full scale is 3.3V
 * Scale by ((3.3 / 4095) / 0.005) * 10 to get output in 0.1'C
 */
msg_t thermo_read(int32_t *result)
{
    adcsample_t samp, vrefint;
    uint16_t vrefcal = *(int16_t*)0x1FFFF7BA;
    msg_t rv1, rv2;

    adcStart(&ADCD1, NULL);
    adcSTM32SetCCR(ADC_CCR_VREFEN);
    rv1 = adcConvert(&ADCD1, &adcgrpvintref, &vrefint, 1);
    adcSTM32SetCCR(0);
    rv2 = adcConvert(&ADCD1, &adcgrpthermo, &samp, 1);
    adcStop(&ADCD1);

    if(rv1 == MSG_OK && rv2 == MSG_OK) {
        *result = ((((int32_t)samp * 440) / 273) * vrefcal) / vrefint;
        return MSG_OK;
    } else {
        return -1;
    }
}

/*
 * Display current temperature.
 */
void thermo_disp_temp(void)
{
    int32_t temperature;
    char buf[16];
    eventflags_t eflags;
    event_listener_t rotenc_el;
    chEvtRegister(&rotenc_es, &rotenc_el, 0);

    while(1)
    {
        /* Wait 200ms and check the button wasn't pressed to return */
        chEvtWaitOneTimeout(ALL_EVENTS, MS2ST(200));
        eflags = chEvtGetAndClearFlags(&rotenc_el);
        if(eflags & ROTENC_PRESS_FLAG)
        {
            piezo_beep(50);
            chEvtUnregister(&rotenc_es, &rotenc_el);
            return;
        }

        /* Read and display the temperature */
        thermo_read(&temperature);
        if(temperature > 6000) {
            chsnprintf(buf, 16, "No Thermocouple");
        } else {
            chsnprintf(buf, 16, "%d.%d C", temperature/10, temperature%10);
        }
        oled_erase();
        oled_text_big(0, 1, buf);
        oled_draw();
    }
}
