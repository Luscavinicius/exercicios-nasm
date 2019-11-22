section .data
str0:	db	"Digite um numero: ",10,0
str1:	db	"%d",0
str2:	db	"O Quadrado de %d eh: %d",10,0
num	dd	0
result	dd	0

section	.text
	global main
	extern printf, scanf
	main:
	push	rbp
	mov	rbp, rsp
	; printf(str0)
	mov	rdi, str0
	mov	rax, 0
	call	printf

	; scanf(str1, num)
	mov	rdi, str1
	mov	rsi, num
	mov	rax, 0
	call	scanf

	; square(num)
	mov	rdi, [num]
	mov	rax, 0
	call	square
	; result <= square(num)
	mov	[result], rax

	; printf(str2, num, result)
	mov	rdi, str2
	mov	rsi, [num]
	mov	rdx, [result]
	mov	rax, 0
	call	printf

	mov	rax, 0
	ret
	square:
	; variavel local apenas escopo da funcao
	nLocal	equ	8
	push	rbp
	mov	rbp, rsp
	sub	rsp, 8
	; nLocal <= rdi(primeiro argumento passado pela call)
	mov	[rbp-nLocal], rdi
	;
	mov	rbx, [rbp-nLocal]
	; nlocal <= nlocal * nlocal
	imul	rbx, rbx
	leave
	mov	rax, rbx
	ret
