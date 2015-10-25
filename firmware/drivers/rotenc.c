#include "drivers/rotenc.h"

event_source_t rotenc_es;

static volatile systime_t rotenc_press_time;

void rotenc_rotate_cb(EXTDriver *extp, expchannel_t channel)
{
    (void)extp;
    (void)channel;
    chSysLockFromISR();
    if(GPTD3.tim->CR1 & STM32_TIM_CR1_DIR) {
        chEvtBroadcastFlagsI(&rotenc_es, ROTENC_LEFT_FLAG);
    } else {
        chEvtBroadcastFlagsI(&rotenc_es, ROTENC_RIGHT_FLAG);
    }
    chSysUnlockFromISR();
}

void rotenc_push_cb(EXTDriver *extp, expchannel_t channel)
{
    (void)extp;
    (void)channel;
    if(ST2MS(chVTTimeElapsedSinceX(rotenc_press_time)) > 500) {
        chSysLockFromISR();
        chEvtBroadcastFlagsI(&rotenc_es, ROTENC_PRESS_FLAG);
        rotenc_press_time = chVTGetSystemTimeX();
        chSysUnlockFromISR();
    }
}

static const GPTConfig gpt3cfg1 = {
    frequency: 1000U,
    callback:  NULL,
    cr2:       0U,
    dier:      0U
};

void rotenc_init() {
    /* Set up the Event Source */
    chEvtObjectInit(&rotenc_es);

    /* Set up the press debouncing time */
    rotenc_press_time = chVTGetSystemTime();

    /* Start up the timer and configure it to measure the rotary encoder */
    gptStart(&GPTD3, &gpt3cfg1);
    GPTD3.tim->SMCR  ^= STM32_TIM_SMCR_SMS(3);
    GPTD3.tim->CCMR1 ^= STM32_TIM_CCMR1_CC1S(1) | STM32_TIM_CCMR1_CC2S(1);
    GPTD3.tim->PSC = 2;
    gptStartContinuous(&GPTD3, 128);
}

void rotenc_led(uint8_t colour)
{
    if(colour & ROTENC_RED)
        palClearPad(GPIOB, GPIOB_ENC_RED);
    else
        palSetPad(GPIOB, GPIOB_ENC_RED);

    if(colour & ROTENC_GREEN)
        palClearPad(GPIOB, GPIOB_ENC_GRN);
    else
        palSetPad(GPIOB, GPIOB_ENC_GRN);

    if(colour & ROTENC_BLUE)
        palClearPad(GPIOB, GPIOB_ENC_BLU);
    else
        palSetPad(GPIOB, GPIOB_ENC_BLU);
}
