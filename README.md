# NexOs Operating System

🚀 A simple operating system built from scratch as a learning journey.

## 📜 Overview
This project is a **bare-metal** operating system written in **Assembly and C**, designed to run on x86 systems. The goal is to learn low-level programming, OS development, and computer architecture.

## 🛠 Features
- Custom **bootloader** written in Assembly
- Kernel in **C** with basic I/O handling
- Switching from **real mode** to **protected mode**
- Basic **GDT (Global Descriptor Table)**
- Simple **print functions** using BIOS interrupts

## 📂 Project Structure
```
📦 my-os-project  
├── bootloader/    # Bootloader code (assembly)  
├── kernel/        # Kernel code (C)  
├── iso/           # Disk image & ISO build files  
├── Makefile       # Build automation  
├── .gitignore     # Git ignore file  
└── README.md      # This file  
```

## 🔧 Build Instructions

### **1️⃣ Install Dependencies**  
Make sure you have the required tools installed:  
```bash
sudo apt install nasm x86_64-elf-gcc x86_64-elf-binutils qemu
```

### **2️⃣ Compile the Bootloader**  
Assemble the bootloader using NASM:  
```bash
nasm -f bin bootloader/boot.asm -o bootloader/boot.bin
```

### **3️⃣ Compile the Kernel**  
Compile the kernel using the cross-compiler:  
```bash
x86_64-elf-gcc -ffreestanding -m64 -c kernel/kernel.c -o kernel/kernel.o
```

### **4️⃣ Link the Kernel**  
Use the linker script to create the final kernel binary:  
```bash
x86_64-elf-ld -T kernel/linker.ld -o kernel.bin kernel/kernel.o
```

### **5️⃣ Create the OS Image**  
Combine the bootloader and kernel to create a bootable image:  
```bash
cat bootloader/boot.bin kernel.bin > os-image.bin
```

### **6️⃣ Run in QEMU**  
Test your OS in a QEMU virtual machine:  
```bash
qemu-system-x86_64 -drive format=raw,file=os-image.bin
```

## 🛠 Future Plans
- Implement a basic **keyboard driver**  
- Add a **memory manager**  
- Create a **simple shell interface**  
- Support for **user-space programs**  

## 📜 License
This project is open-source and free to use under the [MIT License](LICENSE).