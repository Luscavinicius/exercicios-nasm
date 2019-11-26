section .data
str:    db  "%d",10,0
str1:   db  "saindo..",10,0
a       dd  1
b       dd  10

section .text
    global  main
    extern printf
    main:
    push rbp
    mov  rbp, rsp
    
    _loop:
    mov  rdi, str
    mov  rsi, [a]
    mov  rax, 0
    call printf

    mov  rbx, [a]
    inc  rbx
    mov  [a], rbx

    cmp  byte [a], 100
    jl  _loop


    leave
    mov  rax,0
    ret
