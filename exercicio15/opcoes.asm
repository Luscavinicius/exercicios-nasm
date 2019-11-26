section .data
str0:   db  "Escolha uma opcao entre 1 e 5:",10,0
fmt:    db  "%d",0
opcao   dd  0
op1:    db  "Primeira opcao...",10,0
op2:    db  "Segunda opcao...",10,0
op3:    db  "Terceira opcao...",10,0
op4:    db  "Quarta opcao...",10,0
op5:    db  "Abandonando...",10,0

section .text
    global main
    extern printf, scanf
    main:
    push    rbp
    mov     rbp, rsp

    _loop:
    mov     rdi, str0
    mov     rax, 0
    call    printf

    mov     rdi, fmt
    mov     rsi, opcao
    mov     rax, 0
    call    scanf

    cmp     byte [opcao], 5
    jg      _loop
    cmp     byte [opcao], 1
    jl      _loop
    _switch:
    cmp     byte [opcao], 1
    je      _opcao1
    cmp     byte [opcao], 2
    je      _opcao2
    cmp     byte [opcao], 3
    je      _opcao3
    cmp     byte [opcao], 4
    je      _opcao4
    cmp     byte [opcao], 5
    je      _opcao5
    _opcao1:
    mov     rdi, op1
    mov     rax, 0
    call    printf
    jmp     _loop
    _opcao2:
    mov     rdi, op2
    mov     rax, 0
    call    printf
    jmp     _loop
    _opcao3:
    mov     rdi, op3
    mov     rax, 0
    call    printf
    jmp     _loop
    _opcao4:
    mov     rdi, op4
    mov     rax, 0
    call    printf
    jmp     _loop
    _opcao5:
    mov     rdi, op5
    mov     rax, 0
    call    printf
    jmp     _fimloop
    _fimloop:
    leave   
    mov     rax,0
    ret
