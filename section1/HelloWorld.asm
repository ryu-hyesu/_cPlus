%include "io64.inc"

section .text
global main
main:    

    mov rbp, rsp; for corre ct debugging
   
    ; input 
    GET_DEC 1, al 
    GET_DEC 1, num 
    
    ; PRINT_DEC 1, al
    ; NEWLINE
    ; PRINT_DEC 1, num
    
    ; 더하기 연산
    ; add a, b (a = a + b)
    ; a는 레지스터 or 메모리
    ; b는 레지스터 or 메모리 or 상수
    ; -단! a, b 모두 메모리 x
    
    add al, 1; 레지스터 + 상수
    PRINT_DEC 1, al ; 1 + 1 = 2
    NEWLINE
    
    add al, [num]  ; 레지스터 + 메모리, 메모리 이름 그대로 사용하면 주소값과 더해지므로 crush가 생긴다.
    PRINT_DEC 1, al
    NEWLINE
    
    mov bl, 3 ; 레지스터 + 레지스터
    add al, bl
    PRINT_DEC 1, al
    NEWLINE
    
    add [num], byte 1 ; 메모리 + 상수 ; num 자체는 메모리 주소이기 때문에 메모리 크기 정보가 함께 오는 게 아님. 따라서 byte 1로 크기 지정을 해줘야 한다.
    PRINT_DEC 1, [num]
    NEWLINE
    
    add [num], al ; 메모리 + 레지스터 ; num 자체는 메모리 주소이기 때문에 메모리 크기 정보가 함께 오는 게 아님. 따라서 byte 1로 크기 지정을 해줘야 한다.
    PRINT_DEC 1, [num]
    NEWLINE
    
    ; PRINT_STRING msg ; 공식 어셈블리어 아님. os에서 제공하는 helper 메크로
    
    ; 곱하기 연산
    ; mul reg
    ; - mul bl -> al * bl
    ; -- 연산 결과를 ax에 저장
    ; - mul bx => ax * bx
    ; -- 연산 결과는 dx(상위 16비트), ax(하위 16비트)에 저장
    ; - mul ebx -> eax * ebx
    
    ; ex) 5 * 8 은?
    mov ax, 0
    mov al, 5
    mov bl, 8
    mul bl
    
    PRINT_DEC 2, ax
    NEWLINE
    
    ; 나누기 연산
    ; div reg
    ; - div bl -> ax / bl
    ; -- 연산 결과는 al(몫) ah(나머지)
    
    ; ex) 100/3?
    mov ax, 100
    mov bl, 3
    div bl
    
    PRINT_DEC 1, al
    NEWLINE
    mov al, ah
    PRINT_DEC 1, al
 
    xor rax, rax
    ret

;section .data
    
section .bss
    num resb 1