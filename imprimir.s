.global _start
.intel_syntax noprefix

_start:
	CALL imprimir
	JMP exit

imprimir:
	MOV rax, 0x1
	MOV rdi, 0x1
	LEA rsi, variavel
	MOV rdx, tamanho
	SYSCALL
	RET

exit:
	MOV rax, 0x3c
	MOV rdi, 0x0
	SYSCALL

.section .data
	variavel: .asciz "Ola Mundo!\n"
	tamanho: .word 13
