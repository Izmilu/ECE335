	.file	"hw2.c"
	.text
	.globl	loop
	.type	loop, @function
loop:
.LFB0:
	.cfi_startproc
	movq	%rsi, %rcx
	movl	$1, %eax
	movl	$0, %edx
.L2:
	movq	%rdi, %r8
	andq	%rax, %r8
	orq	%r8, %rdx
	salq	%cl, %rax
	testq	%rax, %rax
	jne	.L2
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE0:
	.size	loop, .-loop
	.ident	"GCC: (Debian 13.2.0-2) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
