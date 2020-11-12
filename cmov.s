# max in values
.section .data
output:
    .asciz "The largest value is %d\n"
values:
    .quad 105, 235, 61, 315, 134, 221, 53, 145, 117, 5

.section .text
.global _start
_start:
    nop
    movq values, %rbx
    movq $1, %rcx
loop:
    movq values(, %rcx, 8), %rax
    cmpq %rbx, %rax
    cmovaq %rax, %rbx
    incq %rcx
    cmpq $10, %rcx
    jne loop
    movq $output, %rdi
    movq %rbx, %rsi
    call printf
    movq $0, %rbx
    movq $1, %rax
    int $0x80

# as -gstabs -o cmov.o cmov.s
# ld -dynamic-linker  /lib64/ld-linux-x86-64.so.2 -lc  -o cmov cmov.o.