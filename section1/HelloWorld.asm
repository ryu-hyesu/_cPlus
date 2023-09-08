%include "io64.inc"

section .text
global main
main:
    ;write your code here
    
    PRINT_STRING msg
    
    xor eax, eax
    ret
    
section .data
    msg db 'hello', 0x00