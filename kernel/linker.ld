ENTRY(kernel_main)

SECTIONS {
    . = 0x1000;  /* Kernel entry point */

    .text : {
        *(.text)
    }
    
    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
