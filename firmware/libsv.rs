#![feature(core)]
#![feature(no_std)]
#![feature(lang_items)]
#![no_std]
#![crate_type="staticlib"]

extern crate core;

mod runtime;

#[no_mangle]
pub fn rust_add(a: u32, b: u32) -> u32 {
    a + b
}
