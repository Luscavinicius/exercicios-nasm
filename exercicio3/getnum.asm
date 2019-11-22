section .data
str0:	db	"Digite um numero: ", 10, 0
str1:	db	"%d", 0
str2:	db	"O numero digitado foi %d", 10, 0
num	dd	0

section .text
	global main
	extern printf, scanf
	main:
	push	rbp
	mov	rbp, rsp
	; printf(str0)
	mov	rdi, str0
	mov	rax, 0
	call	printf
	; scanf(str1, &num)
	mov	rdi, str1
	mov	rsi, num
	mov	rax, 0
	call 	scanf
	; printf(str2, num)
	mov	rdi, str2
	mov	rsi, [num]
	mov	rax, 0
	call	printf

	mov	rax, 0
	ret
