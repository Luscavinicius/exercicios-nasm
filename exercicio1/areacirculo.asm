section .data
format:	db	"%f", 10, 0
raio	dq	5.0
pi	dq	3.14
area	dq	0.0
cnst	dq	2.0

section .text
	global main
	extern printf
	main:
	push	rbp
	mov	rbp, rsp

	fld	qword [raio]	; empilha o valor de raio na stack
	fld	qword [pi]	; "
	fld	qword [cnst]	; "
	fmul	st0, st1	; multiplica os elementos da pilha e armazena em st0
	fmul	st0, st2	; multiplica os elementos da pilha e armazena em st0
	fstp	qword [area]	; area <- o que tem em st0 e desempilha tudo.

	; printf(format, area)
	mov	rdi, format
	movq	xmm0,[area]
	mov	rax, 1
	call	printf

	mov	rax, 0
	ret
