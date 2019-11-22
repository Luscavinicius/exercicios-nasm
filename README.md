# exercicios-nasm
Alguns exercícios de Assembly - NASM 64 bits Linux

Para compilar em uma máquina linux 64 bits basta fazer:
nasm program.asm -felf64 -o program.o

Como usei a libc nos exercicios precisamos fazer a linkagem com o gcc ao invés do ld:
gcc -no-pie -o program program.o
