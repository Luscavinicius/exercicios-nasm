section .data
msg:    db  "Escolha a fruta pelo numero: ",10,0
fmt:    db  "%d",0
opcao   dd  0
op1:    db  "Mamao!",10,0
op2:    db  "Abacaxi!",10,0
op3:    db  "Laranja!",10,0
ex:     db  "saindo...",10,0

section .text
    global main
    extern printf, scanf
    main:

    
    push    rbp
    mov     rbp, rsp
    _loop:
    mov     rdi, msg
    mov     rax, 0
    call    printf

    mov     rdi, fmt
    mov     rsi, opcao
    mov     rax, 0
    call    scanf

    cmp     byte [opcao], 1
    jl      _loop
    cmp     byte [opcao], 4
    jg      _loop

    cmp     byte [opcao], 1
    je      _case1
    cmp     byte [opcao], 2
    je      _case2
    cmp     byte [opcao], 3
    je      _case3
    cmp     byte [opcao], 4
    je      _case4

    _case1:
    mov     rdi, op1
    mov     rax, 0
    call    printf
    jmp     _loop
    _case2:
    mov     rdi, op2
    mov     rax, 0
    call    printf
    jmp     _loop
    _case3:
    mov     rdi, op3
    mov     rax, 0
    call    printf
    jmp     _loop
    _case4:
    mov     rdi, ex
    mov     rax, 0
    call    printf
    leave
    mov     rax, 0
    ret
