%include "io64.inc"

section .text
global main
main:
    ;write your code here
    
    ;메모를 남길 수 있는 기능 = 주석
    
    ;10진수(0 1 2 3 4 5 6 7 8 9)
    
    ;2진수(0 1) -컴퓨터 친화적, 숫자가 빨리 증가하는 문제.
    ; 0 1 10 11 100 101 110 111
    ; 0b0 0b1 0b10 0b11 0b100
    
    ;16진수(0 1 2 3 4 5 6 7 8 9 A B C D E F)-10진수와 2진수의 절충안
    ; 0 1 2 3 4 5 6 7 8 9 A B C D E F 10
    ; 0X00
    
    ; 0B 1001 0101 = 0X95 - 4개씩 끊어서 확인 가능해서 2진수와 16진수 오가기 쉽다.
    
    PRINT_STRING msg
    
    xor eax, eax
    ret
    
section .data
    msg db 'hello', 0x00