#ifndef COOK_H
#define COOK_H

#include <stdint.h>
#include <stdbool.h>
#include "ch.h"

extern volatile struct cook_control {
    bool cooking;
    bool error;
    bool preheating;
    int32_t temperature;
    int32_t setpoint;
} cook_control;

void cook_thread(void* arg);

#endif
