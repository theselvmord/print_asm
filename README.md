# syscall x86-64

| Registrador   | Uso           |
| ------------- | ------------- |
| RAX           | ![syscall](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)       |
| RDI           | 1° argumento  |
| RSI           | 2° argumento  |
| RDX           | 3° argumento  |
| R10           | 4° argumento  |
| R8            | 5° argumento  |
| R9            | 6° argumento  |

#### casm.sh
é pra compilar asm mesmo, estava com preguiça de ficar colocando direto os mesmos comandos, só usar: 
```shell
bash casm.sh imprimir.s asm.o asm
```
