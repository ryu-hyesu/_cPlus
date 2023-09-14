%include "io64.inc"

section .text
global main
main:
        mov rbp, rsp; for corre ct debugging
    
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
    
    ; 메모리 <-> 레지스터
    ; mov rax, a   ; a라는 바구니의 주소값을 rax에 복사 
    ; mov rax, [a]  ; a라는 바구니 안에 있는 값을 rax에 복사
    mov al, [a];
    
    mov [a], byte 0x55; ; 0이 생략되어 있다 보니까 몇 바이트인지 알 수 없음. 그래서 크기를 명시해주어야 함.
    mov [a], word 0x6666;
    mov [a], cl
    
    xor rax, rax
    ret
    
    ; 변수의 선언 및 사용
    ; 변수는 그냥 데이터를 저장하는 바구니 [ ]
    ; - 처음에 바구니 사용하겠다 선언 ( 이름과 크기 지정 )
    

    ;초기화 된 데이터
    ; [변수 이름] [크기] [초기값]
    ; [크기] db(1) dw(2) dd(4) dq(8)
section .data
    a db 0x11   ; [0x11]
    b dw 0x2222
    c dd 0x33333333
    d dq 0x4444444444444444

    ;초기화 되지 않은 데이터
    ;[변수이름] [크기] [개수]
    ;[크기] resb(1) resw(2) resd(4) resq(8)
    ;변수 안의 값이 없는 경우를 따로 설정해서 조금이라도 용량을 줄이려는 노력에서 비롯됨
section .bss
    e resb 10