# Supervide Firmware

This firmware is mostly written in Rust. As Rust is currently in development, 
the toolchain is a little more complicated to build than it might otherwise be.

## Checkout ChibiOS

    git submodule update --init --recursive

## Firmware Toolchain

Remove any old toolchains, if applicable:
    
    sudo apt-get remove binutils-arm-none-eabi gcc-arm-none-eabi

Add the PPA for latest `gcc-arm-embedded`:

    sudo add-apt-repository ppa:terry.guo/gcc-arm-embedded
    sudo apt-get update
    sudo apt-get install gcc-arm-none-eabi

## Rust Setup

First install the latest Rust nightly. We use nightlies because the special compilation magic to make this work is an "unstable" feature only allowed in nightlies for now.

    curl -s https://static.rust-lang.org/rustup.sh | sudo sh -s -- --channel=nightly

Now you can either just run `make` and it will build `libcore.rlib` for you, or 
you can do it manually as follows, replacing `~/Projects/supervide` as 
appropriate:

    cd /tmp
    HASH=$(rustc --version | cut -f 3 -d " " | cut -c 2-)
    wget https://github.com/rust-lang/rust/archive/$HASH.zip
    unzip rust-$HASH*.zip
    cd rust-$HASH*
    mkdir libcore-thumbv6m-none-eabi
    cp ~/Projects/supervide/firmware/thumbv6m-none-eabi.json .
    rustc -C opt-level=2 -Z no-landing-pads --target thumbv6m-none-eabi -g src/libcore/lib.rs --out-dir libcore-thumbv6m-none-eabi
    cp libcore-thumbv6m-none-eabi/libcore.rlib ~/Projects/supervide/firmware/

## Build

    make

## Program

    make flash

## Toggle Power from Programmer

    make power
    make unpower
