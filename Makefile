CC = x86_64-elf-gcc
AS = nasm
LD = x86_64-elf-ld
CFLAGS = -ffreestanding -nostdlib -lgcc

all: os-image.bin

bootloader/boot.bin: bootloader/boot.asm
	$(AS) -f bin bootloader/boot.asm -o bootloader/boot.bin

kernel/kernel.o: kernel/kernel.c
	$(CC) $(CFLAGS) -c kernel/kernel.c -o kernel/kernel.o

kernel.bin: kernel/kernel.o
	$(LD) -T kernel/linker.ld -o kernel.bin kernel/kernel.o

os-image.bin: bootloader/boot.bin kernel.bin
	cat bootloader/boot.bin kernel.bin > os-image.bin

run: os-image.bin
	qemu-system-x86_64 -drive format=raw,file=os-image.bin

clean:
	rm -f bootloader/boot.bin kernel/*.o kernel.bin os-image.bin