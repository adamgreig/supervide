#include "thermo.h"
#include "hal.h"

static const ADCConversionGroup adcgrp = {
    circular: false,
    num_channels: 1,
    end_cb: NULL,
    error_cb: NULL,
    cfgr1: 0,
    tr: 0,
    smpr: ADC_SMPR_SMP_239P5,
    chselr: (1<<0)
};

/*
 * Read thermocouple.
 * Thermocouple amp attached to ADC1_IN0 outputs 5mV/'C
 * Full scale is 3.3V
 * Scale by ((3.3 / 4096) / 0.005) * 10 to get output in 0.1'C
 */
msg_t thermo_read(int32_t *result)
{
    adcsample_t samp;
    msg_t rv;

    adcStart(&ADCD1, NULL);
    rv = adcConvert(&ADCD1, &adcgrp, &samp, 1);
    if(rv == MSG_OK) {
        *result = ((int32_t)samp * 440) / 273;
    }
    adcStop(&ADCD1);

    return rv;
}
