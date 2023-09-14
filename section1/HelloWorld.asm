%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    
    ; 16bit = 2byte = 1 word
    ; 32bit = 4byte = 2 word = 1 dword (double-word)
    ; 64bit = 8byte = 4 word = 1 qword (quard-word)
    
    ; 왜 레지스터를 사용해야 하는가?
    ; 속도가 빠르지만 저장 용량이 매우 작음
    ; 연산 결과를 임시적으로 저장하는 곳이 레지스터.
    ; RAX EAX AX AH AL
    
    ; move [register name], cat (데이터의 이동, 오른쪽 -> 이동)
    ; move reg1, reg2 (레지스터2 -> 레지스터1)
    mov eax, 0x1234 ; 32bit 레지스터에 1234(16) 삽입
    mov rbx, 0x12345678
    mov cl, 0xff ; 0xffffff build하면 에러
    
    mov al, 0x00 ; 1byte만 가능, eax에서 1234로 삽입 후 8bit까지를 0으로 민다는 뜻. 따라서 0x00이 아니라 0x1234로 저장됨.

    mov rax, rdx ; rdx의 레지스터를 rax에 복사;        
    
    xor eax, eax
    ret
    
;section .data