[BITS 16]
[ORG 0x7C00]

msg db "Loading kernel...", 0

mov ah, 0x0E
mov si, msg
call print_string

cli
lgdt [gdt_descriptor] ; Load Global Descriptor Table (GDT)

mov eax, cr0
or eax, 0x1         ; Set protected mode bit
mov cr0, eax

jmp CODE_SEG:init_protected_mode

print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    int 0x10
    jmp print_string
done:
    ret

align 4
gdt_start:
    dq 0                ; Null descriptor
    dq 0x00CF9A000000FFFF ; Code segment descriptor
    dq 0x00CF92000000FFFF ; Data segment descriptor
gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

[BITS 32]
init_protected_mode:
    mov ax, DATA_SEG
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    jmp KERNEL_ENTRY

CODE_SEG equ 0x08
DATA_SEG equ 0x10
KERNEL_ENTRY equ 0x1000

times 510 - ($-$$) db 0
dw 0xAA55