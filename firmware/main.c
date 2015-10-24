/*
    ChibiOS - Copyright (C) 2006..2015 Giovanni Di Sirio

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
*/

#include <stdio.h>
#include <string.h>

#include "ch.h"
#include "hal.h"
#include "test.h"

#include "shell.h"
#include "chprintf.h"

#include "usbcfg.h"

#include "drivers/oled.h"

SerialUSBDriver SDU1;

#define SHELL_WA_SIZE   THD_WORKING_AREA_SIZE(2048)
#define TEST_WA_SIZE    THD_WORKING_AREA_SIZE(256)

static void cmd_mem(BaseSequentialStream *chp, int argc, char *argv[]) {
  size_t n, size;

  (void)argv;
  if (argc > 0) {
    chprintf(chp, "Usage: mem\r\n");
    return;
  }
  n = chHeapStatus(NULL, &size);
  chprintf(chp, "core free memory : %u bytes\r\n", chCoreGetStatusX());
  chprintf(chp, "heap fragments   : %u\r\n", n);
  chprintf(chp, "heap free total  : %u bytes\r\n", size);
}

static void cmd_threads(BaseSequentialStream *chp, int argc, char *argv[]) {
  static const char *states[] = {CH_STATE_NAMES};
  thread_t *tp;

  (void)argv;
  if (argc > 0) {
    chprintf(chp, "Usage: threads\r\n");
    return;
  }
  chprintf(chp, "    addr    stack prio refs     state\r\n");
  tp = chRegFirstThread();
  do {
    chprintf(chp, "%08lx %08lx %4lu %4lu %9s\r\n",
            (intptr_t)tp,
            (intptr_t)tp->p_ctx.r13,
            (uint32_t)tp->p_prio,
            (uint32_t)(tp->p_refs - 1),
            states[tp->p_state]);
    tp = chRegNextThread(tp);
  } while (tp != NULL);
}

static void cmd_test(BaseSequentialStream *chp, int argc, char *argv[]) {
  thread_t *tp;

  (void)argv;
  if (argc > 0) {
    chprintf(chp, "Usage: test\r\n");
    return;
  }
  tp = chThdCreateFromHeap(NULL, TEST_WA_SIZE, chThdGetPriorityX(),
                           TestThread, chp);
  if (tp == NULL) {
    chprintf(chp, "out of memory\r\n");
    return;
  }
  chThdWait(tp);
}

static void cmd_write(BaseSequentialStream *chp, int argc, char *argv[]) {
  static uint8_t buf[] =
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef"
      "0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";

  (void)argv;
  if (argc > 0) {
    chprintf(chp, "Usage: write\r\n");
    return;
  }

  while (chnGetTimeout((BaseChannel *)chp, TIME_IMMEDIATE) == Q_TIMEOUT) {
    chSequentialStreamWrite(&SDU1, buf, sizeof buf - 1);
  }
  chprintf(chp, "\r\n\nstopped\r\n");
}

static const ShellCommand commands[] = {
  {"mem", cmd_mem},
  {"threads", cmd_threads},
  {"test", cmd_test},
  {"write", cmd_write},
  {NULL, NULL}
};

static const ShellConfig shell_cfg1 = {
  (BaseSequentialStream *)&SDU1,
  commands
};


/*
 * Blue LED blinker thread, times are in milliseconds.
 */
static THD_WORKING_AREA(waThread1, 128);
static THD_FUNCTION(Thread1, arg) {

  (void)arg;
  chRegSetThreadName("blinker1");
  while (true) {
    systime_t time = serusbcfg.usbp->state == USB_ACTIVE ? 250 : 500;
    /*palClearPad(GPIOB, GPIOB_ENC_GRN);*/
    chThdSleepMilliseconds(time);
    /*palSetPad(GPIOB, GPIOB_ENC_GRN);*/
    chThdSleepMilliseconds(time);
  }
}

#define DAC_BUFFER_SIZE 256

/*
 * DAC test buffer
 */

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
size_t nx = 0, ny = 0, nz = 0;
static void end_cb1(DACDriver *dacp, const dacsample_t *buffer, size_t n) {

  (void)dacp;

  nz++;
  if (dac_buffer == buffer) {
    nx += n;
  }
  else {
    ny += n;
  }

  if ((nz % 1000) == 0) {
    /*palTogglePad(GPIOB, GPIOB_ENC_BLU);*/
  }
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
  frequency:    100000U,
  callback:     NULL,
  cr2:          TIM_CR2_MMS_1,  /* MMS = 010 = TRGO on Update Event.        */
  dier:         0U
};

static const DACConfig dac1cfg1 = {
  init:         2047U,
  datamode:     DAC_DHRM_12BIT_RIGHT_DUAL
};

/*
 * Encoder stuff.
 */
static void encoder_cb(GPTDriver *gptp)
{
    if(gptp->tim->CR1 & STM32_TIM_CR1_DIR) {
        palSetPad(GPIOB, GPIOB_ENC_BLU);
        palClearPad(GPIOB, GPIOB_ENC_GRN);
    } else {
        palClearPad(GPIOB, GPIOB_ENC_BLU);
        palSetPad(GPIOB, GPIOB_ENC_GRN);
    }
    /*palTogglePad(GPIOB, GPIOB_ENC_GRN);*/
}

static const GPTConfig gpt3cfg1 = {
    frequency: 1000U,
    callback:  encoder_cb,
    cr2:       0U,
    dier:      0U
};

/*
 * Application entry point.
 */
int main(void) {
  thread_t *shelltp = NULL;

  /*
   * System initializations.
   * - HAL initialization, this also initializes the configured device drivers
   *   and performs the board-specific initializations.
   * - Kernel initialization, the main() function becomes a thread and the
   *   RTOS is active.
   */
  halInit();
  chSysInit();

  gptStart(&GPTD3, &gpt3cfg1);
  GPTD3.tim->SMCR  ^= STM32_TIM_SMCR_SMS(3);
  GPTD3.tim->CCMR1 ^= STM32_TIM_CCMR1_CC1S(1) | STM32_TIM_CCMR1_CC2S(1);
  GPTD3.tim->PSC = 2;
  gptStartContinuous(&GPTD3, 2);

    oled_init();
    oled_logo();
    oled_draw();
    chThdSleepMilliseconds(1000);
while(1) {
    oled_erase();
    oled_icon_cow();
    oled_text_big(0, 0, "COOK:");
    oled_text_small(3, 0, "Beef");
    oled_draw();
    chThdSleepMilliseconds(1000);
    oled_erase();
    oled_icon_pig();
    oled_text_big(0, 0, "COOK:");
    oled_text_small(3, 0, "Pork");
    oled_draw();
    chThdSleepMilliseconds(1000);
    oled_erase();
    oled_icon_sheep();
    oled_text_big(0, 0, "COOK:");
    oled_text_small(3, 0, "Lamb");
    oled_draw();
    chThdSleepMilliseconds(1000);
    oled_erase();
    oled_icon_duck();
    oled_text_big(0, 0, "COOK:");
    oled_text_small(3, 0, "Duck");
    oled_draw();
    chThdSleepMilliseconds(1000);
    oled_erase();
    oled_icon_fish();
    oled_text_big(0, 0, "COOK:");
    oled_text_small(3, 0, "Fish");
    oled_draw();
    chThdSleepMilliseconds(1000);
}

#if 0
  dacStart(&DACD1, &dac1cfg1);

  /*
   * Starting GPT2 driver, it is used for triggering the DAC.
   */
  gptStart(&GPTD2, &gpt2cfg1);

  /*
   * Starting a continuous conversion.
   * Note, the buffer size is divided by two because two elements are fetched
   * for each transfer.
   */
  dacStartConversion(&DACD1, &dacgrpcfg1, dac_buffer, DAC_BUFFER_SIZE / 2U);
  gptStartContinuous(&GPTD2, 2U);
#endif

#if 0
  sduObjectInit(&SDU1);
  sduStart(&SDU1, &serusbcfg);

  usbDisconnectBus(serusbcfg.usbp);
  chThdSleepMilliseconds(500);
  usbStart(serusbcfg.usbp, &usbcfg);
  usbConnectBus(serusbcfg.usbp);
#endif

#if 0
  shellInit();

  /*
   * Creates the blinker threads.
   */
  chThdCreateStatic(waThread1, sizeof(waThread1), NORMALPRIO, Thread1, NULL);


  while (true) {
      if(!shelltp && (SDU1.config->usbp->state == USB_ACTIVE))
          shelltp = shellCreate(&shell_cfg1, SHELL_WA_SIZE, NORMALPRIO);
      else if(chThdTerminatedX(shelltp)) {
          chThdRelease(shelltp);
          shelltp = NULL;
      }
      chThdSleepMilliseconds(1000);
  }
#endif

  while(true) {
#if 0
    char buf[64];
    int n;
    n = chsnprintf(buf, 64, "%04lu\r", GPTD3.tim->CNT);
    streamWrite((BaseSequentialStream*)&SDU1, (uint8_t*)buf, n);
#endif

    if(palReadPad(GPIOB, GPIOB_ENC_SW) == PAL_LOW)
        palSetPad(GPIOB, GPIOB_ENC_BLU);
    else
        palClearPad(GPIOB, GPIOB_ENC_BLU);

    chThdSleepMilliseconds(50);
  }
}
