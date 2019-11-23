section .data
str0:   db  "x eh maior que 9.", 10, 0
str1:   db  "x eh maior ou igual a 5, mas nao maior que 9.",10,0
str2:   db  "x e igual a zero.",10,0
str3:   db  "x eh nao nulo e menor que 5.",10,0
frmt:   db  "%s",0
x       dd  3

section .text
    global  main
    extern  printf
    main:
    push    rbp
    mov     rbp,rsp

    ; if (x > 9)
    mov     rax, 9
    cmp     [x], rax
    jg      _if1
    ; else if (x >= 5)
    mov     rax, 5
    cmp     [x], rax
    jge     _else_if1
    ; else
    jmp     _else1

    _if1:
    mov     rdi, str0
    mov     rax, 0
    call    printf
    jmp     exit
    _else_if1:
    mov     rdi, str1
    mov     rax,0
    call    printf
    jmp     exit

    _else1:
    mov     rax, 0
    cmp     [x], rax
    je      _if2
    jmp     _else2

    _if2:
    mov     rdi, str2
    mov     rax,0
    call    printf
    jmp     exit

    _else2:
    mov     rdi, str3
    mov     rax,0
    call    printf
    jmp     exit

    exit:
    mov     rax, 0
    ret
