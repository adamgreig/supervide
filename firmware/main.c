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
char screenbuf[4][128];

uint8_t imgdata[4][128] = {
    { 0xFF, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0xFF     },
    { 0xFF, 0x00, 0x7C, 0xFE, 0xFE, 0xFF, 0xE7, 0xC3, 0xC3, 0xC3, 0xC3, 0x87,
0x8F, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00,
0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x03,
0x03, 0x03, 0x87, 0xFF, 0xFE, 0xFE, 0x78, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF,
0xFF, 0xC3, 0xC3, 0xC3, 0xC3, 0xC3, 0x03, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF,
0xFF, 0xFF, 0x83, 0x83, 0x83, 0xFF, 0xFF, 0x7E, 0x3C, 0x00, 0x00, 0x01, 0x0F,
0x7F, 0xFF, 0xFE, 0xF0, 0x80, 0x00, 0x80, 0xF0, 0xFE, 0xFF, 0x7F, 0x0F, 0x01,
0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF,
0x03, 0x03, 0x03, 0x03, 0x07, 0x1E, 0xFE, 0xFC, 0xF8, 0xF0, 0x00, 0x00, 0x00,
0xFF, 0xFF, 0xFF, 0xFF, 0xC3, 0xC3, 0xC3, 0xC3, 0xC3, 0x03, 0x00, 0xFF     },
    { 0xFF, 0x00, 0x38, 0x70, 0x70, 0x61, 0x61, 0x61, 0x61, 0x73, 0x7F, 0x3F,
0x3F, 0x1F, 0x00, 0x00, 0x00, 0x0F, 0x3F, 0x3F, 0x7F, 0x70, 0x60, 0x60, 0x60,
0x70, 0x7F, 0x3F, 0x3F, 0x0F, 0x00, 0x00, 0x00, 0x7F, 0x7F, 0x7F, 0x7F, 0x03,
0x03, 0x03, 0x03, 0x03, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x7F, 0x7F, 0x7F,
0x7F, 0x60, 0x60, 0x60, 0x60, 0x60, 0x60, 0x00, 0x00, 0x00, 0x00, 0x7F, 0x7F,
0x7F, 0x7F, 0x01, 0x01, 0x07, 0x1F, 0x7F, 0x7E, 0x7C, 0x70, 0x40, 0x00, 0x00,
0x00, 0x03, 0x1F, 0x7F, 0x7F, 0x7C, 0x7F, 0x7F, 0x1F, 0x03, 0x00, 0x00, 0x00,
0x00, 0x00, 0x7F, 0x7F, 0x7F, 0x7F, 0x00, 0x00, 0x00, 0x7F, 0x7F, 0x7F, 0x7F,
0x60, 0x60, 0x60, 0x60, 0x70, 0x3C, 0x3F, 0x1F, 0x0F, 0x07, 0x00, 0x00, 0x00,
0x7F, 0x7F, 0x7F, 0x7F, 0x60, 0x60, 0x60, 0x60, 0x60, 0x60, 0x00, 0xFF     },
    { 0xFF, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80,
0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0xFF     },
};

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
            (uint32_t)tp,
            (uint32_t)tp->p_ctx.r13,
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
  palClearPad(GPIOB, GPIOB_OLED_RST);
  chThdSleepMilliseconds(1000);
  palSetPad(GPIOB, GPIOB_OLED_RST);

  const SPIConfig spi_cfg = {
    NULL, GPIOB, GPIOB_OLED_CS,
    SPI_CR1_BR_2 | SPI_CR1_CPOL | SPI_CR1_CPHA
  };

  spiStart(&SPID1, &spi_cfg);

  char cmdbuf[] = {
      0xAE,       /* OLED panel off */
      0xD5, 0x70, /* Display clock divide: default freq, div by 1 */
      0xA8, 0x1F, /* MUX ratio: 32MUX (as 32 rows) */
      0xD3, 0x00, /* Display offset: not offset */
      0xD8, 0x05, /* Area Colour Mode: monochrome, low power mode */
      0xA1,       /* Segment remap: Remap columns, flipping left/right */
      0xC8,       /* COM scan direction: Flipped top/bottom */
      0xDA, 0x12, /* COM pins hardware config: L/R remap + alt config */
      0x91, 0x3F, 0x3F, 0x3F, 0x3F, /* Current drive pulse widths */
      0xD9, 0x22, /* Pre-charge period: default values (example is 0xD2) */
      0xDB, 0x34, /* VCOMH: 0.77 * VCC (default) */
      0xA6,       /* Normal (not inverse) display */
      0xA4,       /* Disable entire display ON */
      0x20, 0x00, /* Memory addressing mode: horizontal */
      0x21, 4, 131, /* Start at column 4, end at column 131 (NB 0xA1 remap) */
      0x22, 0x00, 0x03, /* Start page 0, end at page 3 (as 4 rows of 8 pix) */
      0x81, 0xFF, /* Contrast control: maximum contrast */
      0x82, 0xFF, /* Set maximum brightness for colour banks */
      0xAD, 0x8F, /* Master configuration: DC-DC enabled */
      0xAF,       /* OLED panel on, normal (not dim) mode */
  };

  palClearPad(GPIOA, GPIOA_OLED_DC);
  spiSelect(&SPID1);
  spiSend(&SPID1, sizeof(cmdbuf), (void*)cmdbuf);
  spiUnselect(&SPID1);

  int i;
  for(i=0; i<128; i++) {
      screenbuf[0][i] = 0x01;
      screenbuf[1][i] = 0x00;
      screenbuf[2][i] = 0x00;
      screenbuf[3][i] = 0x80;
  }
  for(i=0; i<4; i++) {
      screenbuf[i][0] = 0xFF;
      screenbuf[i][127] = 0xFF;
  }

  palSetPad(GPIOA, GPIOA_OLED_DC);
  spiSelect(&SPID1);
  spiSend(&SPID1, 128*4, (void*)imgdata);
  spiUnselect(&SPID1);

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
