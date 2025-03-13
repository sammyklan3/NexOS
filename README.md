# My Custom Operating System

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
📦 my-os-project ├── bootloader/ # Bootloader code (assembly) ├── kernel/ # Kernel code (C) ├── iso/ # Disk image & ISO build files ├── Makefile # Build automation ├── .gitignore # Git ignore file └── README.md # This file

## 🔧 Build Instructions
### **1️⃣ Install Dependencies**
Make sure you have the required tools:
```bash
sudo apt install nasm x86_64-elf-gcc qemu