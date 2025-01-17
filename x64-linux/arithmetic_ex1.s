.globl _start
.section .text
_start:
	movq $4, %rbx
	movq %rbx, %rax
	addq %rbx, %rax
	mulq %rbx
	movq $8, %rbx
	addq %rbx, %rax
	movq $16, %rbx
	mulq %rbx
	movq %rax, %rdi

	movq $60, %rax

	syscall
