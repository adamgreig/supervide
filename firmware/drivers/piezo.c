#include "drivers/piezo.h"
#include "drivers/dma_mutexes.h"
#include "hal.h"
#define DAC_BUFFER_SIZE 256

static void piezo_start(void);
static void piezo_stop(void);

static const dacsample_t dac_buffer[DAC_BUFFER_SIZE] = {
    4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0,
    0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095,
    4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0,
    0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095,

    4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0,
    0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095,
    4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0,
    0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095,

    4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0,
    0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095,
    4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0,
    0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095,

    4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0,
    0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095,
    4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0,
    0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095, 0, 4095,
};

/*
 * DAC streaming callback.
 */
static void end_cb1(DACDriver *dacp, const dacsample_t *buffer, size_t n) {
    (void)dacp;
}

/*
 * DAC error callback.
 */
static void error_cb1(DACDriver *dacp, dacerror_t err) {
    (void)dacp;
    (void)err;

    chSysHalt("DAC failure");
}

static const DACConversionGroup dacgrpcfg1 = {
    num_channels: 2U,
    end_cb:       end_cb1,
    error_cb:     error_cb1,
    trigger:      DAC_TRG(4)
};

/*
 * GPT2 configuration.
 */
static const GPTConfig gpt2cfg1 = {
    frequency:    48000U,
    callback:     NULL,
    cr2:          TIM_CR2_MMS_1,  /* MMS = 010 = TRGO on Update Event. */
    dier:         0U
};

static const DACConfig dac1cfg1 = {
    init:         2047U,
    datamode:     DAC_DHRM_12BIT_RIGHT_DUAL
};

static void piezo_start()
{
    chMtxLock(&dma_mutexes_ch3);
    dacStart(&DACD1, &dac1cfg1);
}

static void piezo_stop()
{
    dacStop(&DACD1);
    chMtxUnlock(&dma_mutexes_ch3);
}

void piezo_init()
{
}

void piezo_beep()
{
    piezo_start();
    gptStart(&GPTD2, &gpt2cfg1);
    dacStartConversion(&DACD1, &dacgrpcfg1, dac_buffer, DAC_BUFFER_SIZE / 2);
    gptStartContinuous(&GPTD2, 2U);
    chThdSleepMilliseconds(400);
    piezo_stop();
}
