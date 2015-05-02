// Basic low-level drivers for the power board peripherals

extern crate core;

use chibisupport::*;

// Enable or disable master relay
pub fn power_master_enable() -> () {
    unsafe {
        ch_palSetPad(ch_GPIOB, ch_GPIOB_RELAY_M);
    }
}

pub fn power_master_disable() -> () {
    unsafe {
        ch_palClearPad(ch_GPIOB, ch_GPIOB_RELAY_M);
    }
}

// Enable or disable preheat relay
pub fn power_preheat_enable() -> () {
    unsafe {
        ch_palSetPad(ch_GPIOB, ch_GPIOB_RELAY_PH);
    }
}

pub fn power_preheat_disable() -> () {
    unsafe {
        ch_palClearPad(ch_GPIOB, ch_GPIOB_RELAY_PH);
    }
}

// Set TRIAC activation level from 0 (fully off) to 255 (fully on)
// Controls the number of live half-cycles over a 2.55s period
pub fn power_set_triac(level: u8) -> () {
    if level == 255 {
        unsafe {
            ch_palSetPad(ch_GPIOB, ch_GPIOB_TRIAC);
        }
    }
    if level == 0 {
        unsafe {
            ch_palClearPad(ch_GPIOB, ch_GPIOB_TRIAC);
        }
    }
}

