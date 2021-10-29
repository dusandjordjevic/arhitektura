#autor: Dusan Djordjevic SV/1
.section .data
a:  .quad 0
b:  .long 3, 4
n:  .long 2
prekoracenje:   .byte 0
#Formula:
# a = b^n

.section .text
.globl main
main:
    movl b, %eax
    movl b+4, %ebx
    movl b, %ecx
    movl b+4, %edx
    movl b, %esi
    movl b+4, %edi
za_n_nula:
    cmpl $0, n
    je n_nula
    cmpl $1, n
    je n_jedan
    jmp n_puta
n_jedan:
    movl b, %eax
    movl b+4, %ebx
    movl %eax, a
    movl %ebx, a+4
    jmp kraj
n_nula:
    movl $1, a+4
    jmp kraj
n_puta: 
    cmpl $1, n
    je premestanje_u_a
    subl $1, n
    #za nizi deo
    movl %ecx, b
    movl %esi, %eax
    #za visi deo
    movl %edx, b+4
    movl %edi, %ebx
    ja while1
while1:
    cmpl $1, %eax
    je while2
    addl b, %ecx
    subl $1, %eax
    jmp while1
while2:
    cmpl $1, %ebx
    je n_puta
    addl b+4, %edx
    subl $1, %ebx
    jmp while2
premestanje_u_a:
    movl %ecx, a
    movl %edx, a+4
    jmp kraj
kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80