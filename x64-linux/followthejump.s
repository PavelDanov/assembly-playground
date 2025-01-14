.globl _start

.section .text
_start:
	movq $25, %rax
	jmp thelabel

somewhere:
	movq %rax, %rdi # rdi = 11
	jmp anotherlabel

label1:
	addq %rbx, %rax # rax - 55
	movq $5, %rbx # rbx - 5
	jmp here

labellabel:
	syscall

anotherlabel:
	movq $60, %rax
	jmp labellabel

thelabel:
	movq %rax, %rbx
	jmp there

here:
	divq %rbx # rax 55/5 = 11
	jmp somewhere

there:
	addq $5, %rbx # rbx - 30
	jmp label1

anywhere:
	jmp thelabel
