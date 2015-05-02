#![feature(core)]
#![feature(no_std)]
#![feature(lang_items)]
#![no_std]
#![crate_type="staticlib"]

extern crate core;

mod runtime;
pub mod powerboard;
pub mod chibisupport;

use powerboard::*;

#[no_mangle]
pub fn rust_main() -> () {
    power_master_enable();
    power_preheat_enable();
    loop {
    }
}
