section .data
str0:	db	"Entre um valor inteiro: ",10,0
str1:	db	"%d",0
str2:	db	"Valor de i = %d",10,0
i	dd	0

section .bss
buffer	resb	30

section .text
	global main
	extern printf, scanf, sprintf, puts
	main:
	push	rbp
	mov	rbp, rsp
	; printf(str0)
	mov	rdi, str0
	mov	rax, 0
	call	printf

	; scanf(str1, i)
	mov	rdi, str1
	mov	rsi, i
	mov	rax, 0
	call	scanf

	; sprintf(string1, str2, i)
	mov	rdi, buffer
	mov	rsi, str2
	mov	rdx, [i]
	mov	rax, 0
	call	sprintf

	; puts(string1)
	mov	rdi, buffer
	mov	rax,0
	call	puts

	leave
	mov	rax, 0
	ret
