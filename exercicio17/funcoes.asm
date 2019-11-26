section .data
hello:  db  "Ola",10,0
bye:    db  "Fim do programa",10,0
str0:   db  "Digite um numero inteiro",10,0
str1:   db  "O quadrado de %d eh %d",10,0
fmt:    db  "%d";
num     dd  0
resul   dd  0

section .text
    global main
    extern printf, scanf
    main:
    push    rbp
    mov     rbp, rsp

    call    saudacao

    mov     rdi, str0
    mov     rax, 0
    call    printf

    mov     rdi, fmt
    mov     rsi, num
    mov     rax, 0
    call    scanf

    mov     rdi, [num]
    call    quadrado
    mov     [resul], rax

    mov     rdi, str1
    mov     rsi, [num]
    mov     rdx, [resul]
    mov     rax, 0
    call    printf

    call    despedida

    leave
    mov     rax, 0
    ret

    quadrado:
    push    rbp
    mov     rbp, rsp
    sub     rsp, 8
    x       equ     8
    mov     [rbp-x], rdi
    mov     rax, [rbp-x]
    imul    rax, rax
    leave
    ret
    
    saudacao:
    push    rbp
    mov     rbp, rsp
    mov     rdi, hello
    mov     rax, 0
    call    printf
    leave
    ret

    despedida:
    push    rbp
    mov     rbp, rsp
    mov     rdi, bye
    mov     rax, 0
    call    printf
    leave
    ret

