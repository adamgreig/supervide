// Rust bindings to the chibisupport.c

extern {
	// Pin setting procedures
    pub fn ch_palSetPad(port: *const u32, pad: u32) -> ();
    pub fn ch_palClearPad(port: *const u32, pad: u32) -> ();

    // Globals/constants we need for pin-setting
    pub static ch_GPIOB: *const u32;
    pub static ch_GPIOB_RELAY_M: u32;
    pub static ch_GPIOB_RELAY_PH: u32;
    pub static ch_GPIOB_TRIAC: u32;

    // PWM procedures

    /// Setup PWM with given timer frequency and period
    /// * frequency is PWM timer tick frequency
    /// * periodticks is PWM duty cycle length in ticks
    /// * ch[0-3]: true to activate given channel, otherwise disable.
    pub fn ch_pwmInit(frequency: u32, periodticks: u32, ch0: bool, ch1: bool,
    				  ch2: bool, ch3: bool) -> ();

    /// Set PWM width on given channel (as number of clock pulses)
    pub fn ch_pwmSet(channel: u8, width: u32) -> ();
}
