UEFI-BootLoader
=============

## Overview
Boot loader that will load a 32-bit OS image from a 64-bit UEFI system.

## Feature
* Simple
* Easy to understand

## Build
Environment: Ubuntu 14.10 x86_64, gcc 4.9.1
Target: x64

1. apt-get install git uuid-dev nasm gcc g++ python ruby rake qemu-system-x86-64
2. git submodule update --init
3. rake setup
4. cd edk2 && . edksetup.sh && cd ..
5. rake build

## How to Run
1. rake run

## Running Example
1. cd edk2 && . edksetup.sh && cd ..
2. rake example     # This will build the examples, create and image, and boot qemu with that image.
3. (At the Qemu prompt) UefiOSloader fs0:\32-bit-os.elf
4. At this point, halt the system with the debugger, change to 32-bit mode and set the instruction pointer to 32-bit-os.elf entrypoint.
5. Ctrl-a, x to exit Qemu

Credits:
UefiBootLoader is based on the project by fgken https://github.com/fgken/uefi-bootloader
32-bit-os.asm is based on http://wiki.osdev.org/Bare_Bones_with_NASM which is licensed under http://creativecommons.org/publicdomain/zero/1.0/
