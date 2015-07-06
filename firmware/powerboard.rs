// Basic low-level drivers for the power board peripherals

extern crate core;

use chibisupport::*;

pub fn power_init() -> () {
    // Frequency = 100Hz in order to switch whole half-cycles with 50Hz mains
    // period = 255 ticks for a 2.55s period, giving us 256 possible states
    // Use CH0
    unsafe {
        ch_pwmInit(100, 255, true, false, false, false);
    }
}

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

/// Set TRIAC activation level
/// level varies from from 0 (fully off) to 255 (fully on)
/// This controls the number of live half-cycles over a 2.55s period
pub fn power_set_triac(level: u8) -> () {
    unsafe {
        ch_pwmSet(0, level as u32);
    }
}
