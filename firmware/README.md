# Supervide Firmware

This firmware is mostly written in Rust. As Rust is currently in development, 
the toolchain is a little more complicated to build than it might otherwise be.

## Rust Setup

First install the latest Rust nightly. We use nightlies because the special compilation magic to make this work is an "unstable" feature only allowed in nightlies for now.

    curl -s https://static.rust-lang.org/rustup.sh | sudo sh -s -- --channel=nightly
    HASH=$(rustc --version | cut -f 3 -d " " | cut -c 2-)

Now fetch the latest Rust source and use it to compile the core library for STM32F0. Replace `~/Projects/supervide/` as appropriate.

    cd /tmp
    wget https://github.com/rust-lang/rust/archive/$HASH.zip
    unzip rust-$HASH*.zip
    cd rust-$HASH*
    mkdir libcore-thumbv6m-none-eabi
    cp ~/Projects/supervide/firmware/thumbv6m-none-eabi.json .
    rustc -C opt-level=2 -Z no-landing-pads --target thumbv6m-none-eabi -g src/libcore/lib.rs --out-dir libcore-thumbv6m-none-eabi
    cp libcore-thumbv6m-none-eabi/libcore.rlib ~/Projects/supervide/firmware/
