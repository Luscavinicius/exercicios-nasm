section .data
choose:    db    "[1] Cadastrar cliente", 10, "[2] Procurar cliente",10,"[3] Inserir Pedido",10,"[0] Sair",10,"Digite sua escolha",10,0
chsfrmt:   db    "%d",0
x          dd    1
invalid:   db    "Opcao invalida!",10,0
op1:       db    "cadastra_cliente()",10,0
op2:       db    "procura_cliente()",10,0
op3:       db    "insere_pedido()",10,0
ex:        db    "saindo...",10,0

section .text
    global main
    extern printf, scanf
    main:
        push    rbp
        mov     rbp, rsp
        
        ; printf( choose )
        mov     rdi, choose
        mov     rax, 0
        call    printf
        ;scanf( chsfrmt, &x )
        mov     rdi, chsfrmt
        mov     rsi, x
        mov     rax, 0
        call    scanf

    switch:
        cmp     byte [x], 1
        je      opcao_1
        cmp     byte [x], 2
        je      opcao_2
        cmp     byte [x], 3
        je      opcao_3
        cmp     byte [x], 0
        je      opcao_0
    default1:
        mov     rdi, invalid
        mov     rax, 0
        call    printf
        jmp     exit1
    opcao_0:
        jmp     exit1
    opcao_1:
        ; printf( op1 )
        mov     rdi, op1
        mov     rax, 0
        call    printf
        jmp     exit1
    opcao_2:
        ; printf( op2 )
        mov     rdi, op2
        mov     rax, 0
        call    printf
        jmp     exit1
    opcao_3:
        ; printf( op3 )
        mov     rdi, op3
        mov     rax, 0
        call    printf
        jmp     exit1
    exit1:
        ; printf( ex )
        mov     rdi, ex
        mov     rax, 0
        call    printf
        mov     rax, 0
        ret