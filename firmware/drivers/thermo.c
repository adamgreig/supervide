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

msg_t thermo_read(int32_t *result)
{
    adcsample_t samp;
    msg_t rv;

    adcStart(&ADCD1, NULL);
    rv = adcConvert(&ADCD1, &adcgrp, &samp, 1);
    if(rv == MSG_OK) {
        *result = (int32_t)samp;
    }
    adcStop(&ADCD1);

    return rv;
}
