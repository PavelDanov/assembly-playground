.globl _start
.section .text
_start:
	movq $5, %rax
	movq $2, %rbx
	movq $2, %rcx

	cmpq $0, %rcx
	je exit

mainloop:
	subq %rbx, %rax
	loopq mainloop

exit:
	mov %rax, %rdi
	movq $60, %rax
	syscall
