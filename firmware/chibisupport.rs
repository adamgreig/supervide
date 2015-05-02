// Rust bindings to the chibisupport.c

extern {
    pub fn ch_palSetPad(port: *const u32, pad: u32) -> ();
    pub fn ch_palClearPad(port: *const u32, pad: u32) -> ();

    pub static ch_GPIOB: *const u32;
    pub static ch_GPIOB_RELAY_M: u32;
    pub static ch_GPIOB_RELAY_PH: u32;
    pub static ch_GPIOB_TRIAC: u32;
}

