section .data
a       dd      5
b       dd      5
frmt:   db      "%d",10,0

section .text
    global  main
    extern  printf
    main:
        push    rbp
        mov     rbp, rsp
        
        mov     rax, [a]
        inc     rax ; a++
        mov     [a], rax
        add     rax, 5

        mov     rdi, frmt
        mov     rsi, rax
        mov     rax, 0
        call    printf
        ; printf(frmt, a)
        
        mov     rdi, frmt
        mov     rsi, [a]
        mov     rax, 0
        call    printf

        mov     rbx, [b]
        add     rbx, 5

        mov     rdi, frmt
        mov     rsi, rbx
        mov     rax, 0
        call    printf

        mov     rax, [b]
        inc     rax
        mov     [b], rax

        mov     rdi, frmt
        mov     rsi, [b]
        mov     rax, 0
        call    printf

        mov     rax, 0
        ret