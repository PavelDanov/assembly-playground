.globl _start
.section .text
_start:
	movq $3, %rbx
	movq $5, %rcx

	cmpq $0, %rcx
	je complete

mainloop:
	addq %rbx, %rax
	loopq mainloop

complete:
	movq %rax, %rdi
	movq $60, %rax
	syscall
