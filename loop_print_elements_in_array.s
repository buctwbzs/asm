.section .data
output:
    .asciz "The value is %d\n"
values:
    .quad 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60

.section .text
.global _start
_start:
    nop
    movq $0, %rbx

loop:
    movq $output, %rdi
    movq values(, %rbx, 8), %rsi
    call printf
    incq %rbx
    cmpq $11, %rbx
    jne loop
    movq $0, %rbx
    movq $1, %rax
    int $0x80

# as -gstabs -o loop.o loop_print_array.s
# ld -dynamic-linker  /lib64/ld-linux-x86-64.so.2 -lc  -o loop ./loop.o
# ./loop

