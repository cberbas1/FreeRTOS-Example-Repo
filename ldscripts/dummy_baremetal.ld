ENTRY(_start)

MEMORY
{
  OCM_RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 256K
}

SECTIONS
{
  .text : {
    KEEP(*(.vectors))
    *(.text*)
    *(.rodata*)
  } > OCM_RAM

  .data : {
    *(.data*)
  } > OCM_RAM

  .bss : {
    __bss_start__ = .;  /* Define __bss_start__ */
    *(.bss*)
    *(COMMON)
    __bss_end__ = .;    /* Define __bss_end__ */
  } > OCM_RAM
}