%include "io64.inc"

section .text
global main
main:    mov rbp, rsp; for corre ct debugging
    
    PRINT_STRING msg
    
    xor rax, rax
    ret

section .data
    ; msg db 'Hello World', 0x00 ; 연속적인 문자들 -> 문자열. 문자열의 끝을 알려주기 위해 0x00
    msg db 0x48, 0x65, 0x6c, 0x6c, 0x6f, 0x20, 0x57, 0x6f, 0x72, 0x6c, 0x64, 0x0 ; 동일한 데이터라고해도 분석의 방법에 따라 표현이 달라질 수 있다.

    a db 17, 0x11, 0x11, 0x11   ; 다수의 데이터 삽입 가능, 1byte 숫자가 연속적으로 들어가 있음.
    
    ; 서버에 data 전송 시 엔디안 순서에 따라 저장방법이 달라 버그 발생 가능
    ; - 리틀 엔디안 : 캐스팅에 유리하다.
    ; - 빅 엔디안 : 숫자 비교에 유리.
    
    b dd 0x12345678 ; 뒤집혀서 저장됨. big-endian & little-endian 
    
section .bss
    e resb 10