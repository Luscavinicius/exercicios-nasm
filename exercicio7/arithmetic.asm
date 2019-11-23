section .data
result		dq	0.0
i		dq	5.0
j		dq	2.0
f		dq	3.0
s:		db 	"O resultado eh: %f",10,0

section .text
global main
extern printf
main:
	push	rbp
	mov	rbp, rsp

	fld	qword [f]
	fld	qword [i]
	fld	qword [j]
	fdiv	st0, st1
	fadd	st0, st2
	fstp	qword [result]

	mov	rdi, s
	movq	xmm0, [result]
	mov	rax, 1
	call	printf

	leave
	mov	rax,0
	ret
