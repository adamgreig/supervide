#include "hal.h"
#include "board.h"

/* These variables are DEFINED in board.h
 * but there's no easy way to get that data into Rust.
 * This way rust can just externally reference these
 * constants and the DEFINEs get filled in here.
 * Maybe they get optimized out, but probably not,
 * since it crosses an object file boundary.
 */
const uint32_t *ch_GPIOB = (uint32_t *)GPIOB;
const uint32_t ch_GPIOB_RELAY_M = GPIOB_RELAY_M;
const uint32_t ch_GPIOB_RELAY_PH = GPIOB_RELAY_PH;
const uint32_t ch_GPIOB_TRIAC = GPIOB_TRIAC;

// GLOBALS used for storing peripheral config:
PWMConfig pwmConf;
ADCConversionGroup adcConvGrp;

/* Wrap these functions so that Rust code doesn't have to
 * worry about ChibiOS' macros -- GCC compiles this and
 * fills in the macros there, and Rust modules just link
 * against nice sensible functions.
 */
void ch_palSetPad(uint32_t *port, uint32_t pad) {
    palSetPad((stm32_gpio_t *)port, pad);
}

void ch_palClearPad(uint32_t *port, uint32_t pad) {
    palClearPad((stm32_gpio_t *)port, pad);
}

void ch_pwmInit(uint32_t frequency, uint32_t periodticks, bool ch0,	bool ch1,
				bool ch2, bool ch3 ) {
	// No need to pwmInit, that's done by halInit()
	pwmConf.frequency = frequency;
	pwmConf.period = periodticks;
	pwmConf.callback = NULL;
	pwmConf.channels[0].mode = ch0 ? PWM_OUTPUT_ACTIVE_HIGH:PWM_OUTPUT_DISABLED;
	pwmConf.channels[0].callback = NULL;
	pwmConf.channels[1].mode = ch1 ? PWM_OUTPUT_ACTIVE_HIGH:PWM_OUTPUT_DISABLED;
	pwmConf.channels[1].callback = NULL;
	pwmConf.channels[2].mode = ch2 ? PWM_OUTPUT_ACTIVE_HIGH:PWM_OUTPUT_DISABLED;
	pwmConf.channels[2].callback = NULL;
	pwmConf.channels[3].mode = ch3 ? PWM_OUTPUT_ACTIVE_HIGH:PWM_OUTPUT_DISABLED;
	pwmConf.channels[3].callback = NULL;

    pwmStart(&PWMD1, &pwmConf);
    pwmDisableChannel(&PWMD1, 0);
}

void ch_pwmSet(uint8_t channel, uint32_t width) {
	if(width == 0)
		pwmDisableChannel(&PWMD1, channel);
	else
		pwmEnableChannel(&PWMD1, channel, width);
}

void ch_adcInit(void) {
	// No need to adcInit and adcObjectInit, that's done by halInit()
	adcStart(&ADCD1, NULL);  // Protip: ADCConfig* config is unused!
	adcConvGrp.circular = false;  // Disable circular buffer mode
	adcConvGrp.num_channels = 1;
	adcConvGrp.end_cb = NULL;
	adcConvGrp.error_cb = NULL; 
	// TODO: Do I need to run calibration?
	// TODO: STM32F072-specific adcConvGrp setup!
}

uint16_t ch_adcConvSync(void) {
	msg_t result;
	uint16_t buffer;
	// Single sample "buffer" to convert into
	result = adcConvert(&ADCD1, &adcConvGrp, &buffer, 1);
	if(result != MSG_OK)
		return 1337;  // TODO, handle the failure / panic / ...
	else
		return buffer;
}
