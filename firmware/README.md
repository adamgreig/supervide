# Supervide Firmware

## Setup and Building

### Checkout ChibiOS

    git submodule update --init --recursive

### Firmware Toolchain

Remove any old tool-chains, if applicable:
    
    sudo apt-get remove binutils-arm-none-eabi gcc-arm-none-eabi

Add the PPA for latest `gcc-arm-embedded`:

    sudo add-apt-repository ppa:terry.guo/gcc-arm-embedded
    sudo apt-get update
    sudo apt-get install gcc-arm-none-eabi gdb-arm-none-eabi

### Build

    make

### Program

    make flash

### Toggle Power from Programmer

    make power
    make unpower
