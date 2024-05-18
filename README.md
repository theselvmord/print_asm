# ![imprimir.s](https://github.com/tisiohw/assembly/blob/main/imprimir.s)
já no começo do codigo, você vai ver um:
```assembly
.global _start
```
Ai você pode se perguntar, "para que serve isto?", ai meu caro, eu respondo. Nada mais é que declarando meio que a "main()" em seu codigo assembly;
Logo abaixo temos:
```assembly
.intel_syntax noprefix
```
digamos que assembly é uma linguagem de "maquina" e já como você não é uma maquina temos que "dizer" a ela que você não é uma maquina, pode está um pouco confuso mas ja ja você pega a manha;
já o `noprefix` é para facilitar nosso trabalho na criação de comandos para a maquina, digamos que sem o `noprefix` você teria que sempre colocar um prefixo (**%**) ao usar o "mov", por exemplo, na função `imprimir` sem o `noprefix` ficaria assim:
```assembly
imprimir:
	MOV %rax, 0x1
	MOV %rdi, 0x1
	LEA %rsi, variavel
	MOV %rdx, tamanho
	SYSCALL
	RET
```
Agora vamos inspecionar a função "imprimir", já nas primeiras linhas dessa função estaremos definindo os parometros (deixando bem claro que algumas syscall precisam de alguns parometros especificos, e pode ser encontrado no site [syscall](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)) 
| Registrador   | Uso           |
| ------------- | ------------- |
| RAX           | [syscall](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)       |
| RDI           | 1° argumento  |
| RSI           | 2° argumento  |
| RDX           | 3° argumento  |
| R10           | 4° argumento  |
| R8            | 5° argumento  |
| R9            | 6° argumento  |
```assembly
imprimir:                ; declarando a função
	MOV %rax, 0x1        ; (rax) 1 parometro = 1 (0x1)
	MOV %rdi, 0x1        ; (rdi) 2 parometro = 1 (0x1) 
	LEA %rsi, variavel   ; (rsi) 3 parometro = variavel [string]
	MOV %rdx, tamanho    ; (rdx) 4 parometro = tamanho [word]
	SYSCALL              ; chamando a syscall
	RET                  ; digamos que é um "return"
```
Esse `LEA` (Load Effective Address) em Assembly é usada para carregar o endereço:
```assembly
LEA destino, origem
```
# ...
```assembly
.global _start         ; declarando nosso "main"
.intel_syntax noprefix ; falando pra maquina que não somos uma maquina

_start:                ; nosso "main"
	CALL imprimir        ; chamando a função "imprimir"
	JMP exit             ; nada depois do JMP será chamando, meio que é um "return exit();"

imprimir:
	MOV rax, 0x1         ; syscall (sys_write)
	MOV rdi, 0x1         ; parometro
	LEA rsi, variavel    ; obtendo a string da variavel para rsi
	MOV rdx, tamanho     ; obtendo o valor dentro da variavel tamanho para rdx
	SYSCALL              ; chamando ela
	RET                  ; return

exit:                  ; declarando a função exit
	MOV rax, 0x3c        ; syscall (sys_exit)
	MOV rdi, 0x0         ; exit(0)
	SYSCALL              ; chamando ela

.section .data         ; declarando variaveis
	variavel: .asciz "Ola Mundo!\n"
	tamanho: .word 13
```

# casm.sh
é pra compilar asm mesmo, estava com preguiça de ficar colocando direto os mesmos comandos, só usar: 
```shell
bash casm.sh imprimir.s asm.o asm
```
