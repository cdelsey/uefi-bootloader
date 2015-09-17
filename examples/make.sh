#!/bin/sh
gcc -nostdlib -e foo -o out-serial-A.elf out-serial-A.c
cp out-serial-A.elf ../image/

nasm -felf32 32-bit-os.asm -o 32-bit-os.o
ld -T linker.ld -m elf_i386 -o 32-bit-os.elf 32-bit-os.o
cp 32-bit-os.elf ../image

