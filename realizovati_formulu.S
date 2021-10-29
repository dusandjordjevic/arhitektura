#autor: Dusan Djordjevic SV/1
.section .data
a:  .quad 0
b:  .quad 40
c:  .quad 70
n1:   .long 0
n2:   .long 0
prekoracenje:   .byte 0

#Forumla:
#a = 2b + c/3

.section .text
.globl main
main:
    movl b, %eax
    movl b+4, %ebx
    movl c, %ecx
    movl c+4, %edx

mnozenje:
    addl %eax, %eax
    adcl %ebx, %ebx
    jnc poredjenje_nizeg
    movb $1, prekoracenje
    jmp kraj
poredjenje_nizeg:
    cmpl $0, %ecx
    je poredjenje_viseg
    cmpl $2, %ecx
    je poredjenje_viseg
    cmpl $1, %ecx
    je poredjenje_viseg
    ja deljenje_nizeg
deljenje_nizeg:
    subl $3, %ecx
    addl $1, n1
    jmp poredjenje_nizeg
poredjenje_viseg:
    cmpl $0, %edx
    je racunanje
    cmpl $1, %edx
    je racunanje
    cmpl $2, %edx
    je racunanje
    ja deljenje_viseg
deljenje_viseg:
    subl $3, %edx
    addl $1, n2
    jmp poredjenje_viseg
racunanje:
    addl n1, %eax
    addl n2, %ebx
    movl %eax, a
    movl %ebx, a+4
    jmp kraj
kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80




