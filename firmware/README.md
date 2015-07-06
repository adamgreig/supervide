# Supervide Firmware

This firmware is mostly written in Rust. As Rust is currently in development, 
the tool-chain is a little more complicated to build than it might otherwise be.
Furthermore, the interfacing between ChibiOS, an embedded RTOS written in C,
and the drivers and "business logic" written in Rust leads to some sharp edges.
This is exacerbated by ChibiOS exposing many core "functions" as macros which
cannot be called directly from Rust without further wrappers.

## Files

* [`libsv.rs`](libsv.rs): This contains the high level control of Supervide.
  It contains `rust_main()`, the entry point to all Rust code, called promptly
  from the "actual" C main function in [`chibi/main.c`](chibi/main.c).
* [`chibisupport.c`](chibisupport.c): Wrappers around various ChibiOS functions
  we need.  Mostly these are wrapped because they are C macros rather than
  functions, so we cannot call them directly.  These wrappers effectively
  compile the macros so they can be conveniently called from Rust.  We also
  ensure the functions have convenient types to call from Rust.
* [`chibisupport.rs`](chibisupport.rs): Rust function definitions for the
  wrappers in [`chibisupport.c`](chibisupport.c).
* [`powerboard.rs`](powerboard.rs): Drivers for the functionality of the power
  board, including switching relays, controlling the TRIAC value, and reading
  the current sensor.
* [`runtime.rs`](runtime.rs),
  [`thumbv6m-none-eabi.json`](thumbv6m-none-eabi.json): These are required for
  building Rust for the STM32 sans-runtime and require little attention.

## Setup and Building

### Checkout ChibiOS

    git submodule update --init --recursive

### Firmware Toolchain

Remove any old tool-chains, if applicable:
    
    sudo apt-get remove binutils-arm-none-eabi gcc-arm-none-eabi

Add the PPA for latest `gcc-arm-embedded`:

    sudo add-apt-repository ppa:terry.guo/gcc-arm-embedded
    sudo apt-get update
    sudo apt-get install gcc-arm-none-eabi

### Rust Setup

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

### Build

    make

### Program

    make flash

### Toggle Power from Programmer

    make power
    make unpower
