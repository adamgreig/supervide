#include "cook.h"
#include "powerboard.h"
#include "drivers/thermo.h"

static void cook_all_off(void);
static void cook_run(uint32_t setpoint);
static void cook_pid(int32_t temperature, int32_t setpoint);

volatile struct cook_control cook_control;

static void cook_all_off()
{
    power_set_triac(0);
    power_set_preheat(false);
    power_set_master(false);
}

static void cook_pid(int32_t temperature, int32_t setpoint)
{
    int32_t error = setpoint - temperature;
    int32_t power = (error * 255) / 100;
    if(power < 0)
        power = 0;
    else if(power > 255)
        power = 255;
    power_set_triac(power);
}

static void cook_run(uint32_t setpoint)
{
    int32_t temperature;
    thermo_read(&temperature);
    cook_control.temperature = temperature;

    if(temperature > 6000) {
        cook_control.error = true;
        cook_all_off();
        return;
    }

    power_set_master(true);

    if(setpoint - temperature > 100)
    {
        /* If more than 10C from set, turn on preheat */
        power_set_preheat(true);
    } else {
        /* Otherwise use the PID loop */
        power_set_preheat(false);
        cook_pid(temperature, setpoint);
    }
}

void cook_thread(void* arg)
{
    (void)arg;

    cook_control.cooking = false;
    cook_control.error = false;
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
