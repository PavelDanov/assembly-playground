.globl _start
.section .text
_start:
	movq $4, %rax
	movq $2, %rbx
	divq %rbx
	cmpq $0, %rdx
	jz complete_even
	mov $0, %rdi
	jmp exit

complete_even:
	movq $1, %rdi

exit:
	movq $60, %rax
	syscall
