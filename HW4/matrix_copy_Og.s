	.file	"matrix_copy.c"
	.text
	.globl	copyij
	.type	copyij, @function
copyij:
.LFB22:
	.cfi_startproc
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$0, %edi
	jmp	.L2
.L3:
	movslq	%edi, %rax
	salq	$13, %rax
	leaq	(%r9,%rax), %rsi
	addq	%r8, %rax
	movslq	%edx, %rcx
	movl	(%rsi,%rcx,4), %esi
	movl	%esi, (%rax,%rcx,4)
	addl	$1, %edx
.L4:
	cmpl	$2047, %edx
	jle	.L3
	addl	$1, %edi
.L2:
	cmpl	$2047, %edi
	jg	.L6
	movl	$0, %edx
	jmp	.L4
.L6:
	ret
	.cfi_endproc
.LFE22:
	.size	copyij, .-copyij
	.globl	copyji
	.type	copyji, @function
copyji:
.LFB23:
	.cfi_startproc
	movq	%rdi, %r9
	movq	%rsi, %r8
	movl	$0, %edi
	jmp	.L8
.L9:
	movslq	%edx, %rax
	salq	$13, %rax
	leaq	(%r9,%rax), %rsi
	addq	%r8, %rax
	movslq	%edi, %rcx
	movl	(%rsi,%rcx,4), %esi
	movl	%esi, (%rax,%rcx,4)
	addl	$1, %edx
.L10:
	cmpl	$2047, %edx
	jle	.L9
	addl	$1, %edi
.L8:
	cmpl	$2047, %edi
	jg	.L12
	movl	$0, %edx
	jmp	.L10
.L12:
	ret
	.cfi_endproc
.LFE23:
	.size	copyji, .-copyji
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"Memory allocation failed.\n"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Execution time of copyij: %lf seconds\n"
	.align 8
.LC3:
	.string	"Execution time of copyji: %lf seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	$16777216, %edi
	call	malloc@PLT
	movq	%rax, %r12
	movl	$16777216, %edi
	call	malloc@PLT
	movq	%rax, %r13
	testq	%r12, %r12
	sete	%al
	testq	%r13, %r13
	sete	%dl
	orb	%dl, %al
	jne	.L21
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, %ebp
	jmp	.L16
.L21:
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L13
.L17:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$219891331, %rdx, %rdx
	sarq	$42, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$20001, %edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movslq	%ebp, %rax
	salq	$13, %rax
	addq	%r12, %rax
	subl	$10000, %edx
	movslq	%ebx, %rcx
	movl	%edx, (%rax,%rcx,4)
	addl	$1, %ebx
.L18:
	cmpl	$2047, %ebx
	jle	.L17
	addl	$1, %ebp
.L16:
	cmpl	$2047, %ebp
	jg	.L22
	movl	$0, %ebx
	jmp	.L18
.L22:
	call	clock@PLT
	movq	%rax, %rbx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	copyij
	call	clock@PLT
	subq	%rbx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC1(%rip), %xmm0
	movq	%xmm0, %rbp
	call	clock@PLT
	movq	%rax, %rbx
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	copyji
	call	clock@PLT
	subq	%rbx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC1(%rip), %xmm0
	movq	%xmm0, %rbx
	movq	%rbp, %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	%rbx, %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	%r12, %rdi
	call	free@PLT
	movq	%r13, %rdi
	call	free@PLT
	movl	$0, %eax
.L13:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1093567616
	.ident	"GCC: (Debian 13.2.0-4) 13.2.0"
	.section	.note.GNU-stack,"",@progbits
