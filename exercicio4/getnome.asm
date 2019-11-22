section .data
buffer:		db	"          ",0
str0:		db	"Entre com seu nome: ",10,0
str1:		db	"O nome eh: %s", 10, 0

section .text
	global main
	extern printf, gets
	main:
	push 	rbp
	mov	rbp, rsp

	; printf(str0)
	mov	rdi, str0
	mov	rax, 0
	call 	printf

	; gets(buffer)
	mov	rdi, buffer
	mov	rax, 0
	call	gets

	; printf(str1, buffer)
	mov	rdi, str1
	mov	rsi, buffer
	mov	rax, 0
	call	printf

	mov	rax, 0
	ret
