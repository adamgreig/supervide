#include "hal.h"
#include "chprintf.h"
#include "cook.h"
#include "powerboard.h"
#include "drivers/thermo.h"

extern SerialUSBDriver SDU1;

static void cook_all_off(void);
static void cook_run(uint32_t setpoint);
static void cook_pid(int32_t difference);

volatile struct cook_control cook_control;

#define MA_LEN (50)
static int32_t ma_buf[MA_LEN] = {0};
static int32_t ma_idx = 0;

static void cook_all_off()
{
    power_set_triac(0);
    power_set_preheat(false);
    power_set_master(false);
}

static void cook_pid(int32_t difference)
{
    int32_t power = (difference * 255) / 50;
    if(power < 0)
        power = 0;
    else if(power > 255)
        power = 255;
    power_set_triac((uint8_t)power);
}

static void cook_run(uint32_t setpoint)
{
    int32_t raw_temperature, ma_temperature, difference, i;
    thermo_read(&raw_temperature);
    ma_buf[ma_idx++] = raw_temperature;
    if(ma_idx >= MA_LEN)
        ma_idx = 0;
    ma_temperature = 0;
    for(i=0; i<MA_LEN; i++)
        ma_temperature += ma_buf[i];
    ma_temperature /= MA_LEN;
    cook_control.temperature = ma_temperature;
    difference = setpoint - ma_temperature;
    chprintf((BaseSequentialStream*)&SDU1, "%d %d\r\n",
             raw_temperature, ma_temperature);

    if(ma_temperature > 6000) {
        cook_control.error = true;
        cook_all_off();
        return;
    }

    power_set_master(true);

    if(difference < 0) {
        power_set_preheat(false);
        power_set_triac(0);
        cook_control.preheating = false;
    } else if(difference > 70 && !cook_control.preheating) {
        power_set_preheat(true);
        power_set_triac(0);
        cook_control.preheating = true;
    } else if((difference < 50 &&  cook_control.preheating) ||
              (difference < 70 && !cook_control.preheating)) {
        power_set_preheat(false);
        cook_pid(difference);
        cook_control.preheating = false;
    }
}

void cook_thread(void* arg)
{
    (void)arg;

    cook_control.cooking = false;
    cook_control.error = false;
    cook_control.preheating = false;
    cook_control.setpoint = 0;
    cook_control.temperature = 0;

    while(1) {
        if(!cook_control.cooking) {
            cook_all_off();
        } else {
            cook_run(cook_control.setpoint);
        }
        chThdSleepMilliseconds(100);
    }
}
