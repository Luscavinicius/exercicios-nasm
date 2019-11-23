section .data
string1:	db	"10 20 30",0
strfrmt:	db	"%d %d %d",0
strout:		db	"Valores lidos: %d, %d, %d",10,0
i		dd	0
j		dd	0
k		dd	0

section .text
	global main
	extern printf, sscanf
	main:
	push	rbp
	mov	rbp, rsp

	; sscanf( string1, strfrmt, x, y ,z)
	mov	rdi, string1
	mov	rsi, strfrmt
	mov	rdx, i
	mov	rcx, j
	mov 	r8, k
	xor	rax, rax
	call	sscanf

	mov	rdi, strout
	mov	rsi, [i]
	mov	rdx, [j]
	mov	rcx, [k]
	mov	rax, 0
	call	printf

	mov	rax,0
	ret
