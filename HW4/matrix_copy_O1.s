	.file	"matrix_copy.c"
	.text
	.globl	copyij
	.type	copyij, @function
copyij:
.LFB22:
	.cfi_startproc
	movq	%rdi, %r9
	movq	%rsi, %r8
	addq	$16777216, %r9
.L2:
	movq	%rdi, %rsi
	movq	%r8, %rcx
	movl	$0, %eax
.L3:
	movl	(%rsi,%rax), %edx
	movl	%edx, (%rcx,%rax)
	addq	$4, %rax
	cmpq	$8192, %rax
	jne	.L3
	addq	$8192, %rdi
	addq	$8192, %r8
	cmpq	%r9, %rdi
	jne	.L2
	ret
	.cfi_endproc
.LFE22:
	.size	copyij, .-copyij
	.globl	copyji
	.type	copyji, @function
copyji:
.LFB23:
	.cfi_startproc
	movl	$16777216, %ecx
.L7:
	leaq	-16777216(%rcx), %rax
.L8:
	movl	(%rdi,%rax), %edx
	movl	%edx, (%rsi,%rax)
	addq	$8192, %rax
	cmpq	%rcx, %rax
	jne	.L8
	addq	$4, %rcx
	cmpq	$16785408, %rcx
	jne	.L7
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
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	$16777216, %edi
	call	malloc@PLT
	movq	%rax, %r13
	movl	$16777216, %edi
	call	malloc@PLT
	testq	%r13, %r13
	je	.L18
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L18
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	leaq	8192(%r13), %rbp
	leaq	16785408(%r13), %r12
.L15:
	leaq	-8192(%rbp), %rbx
.L16:
	call	rand@PLT
	movslq	%eax, %rdx
	imulq	$219891331, %rdx, %rdx
	sarq	$42, %rdx
	movl	%eax, %ecx
	sarl	$31, %ecx
	subl	%ecx, %edx
	imull	$20001, %edx, %edx
	subl	%edx, %eax
	subl	$10000, %eax
	movl	%eax, (%rbx)
	addq	$4, %rbx
	cmpq	%rbp, %rbx
	jne	.L16
	addq	$8192, %rbp
	cmpq	%r12, %rbp
	jne	.L15
	call	clock@PLT
	movq	%rax, %rbx
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	copyij
	call	clock@PLT
	subq	%rbx, %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	divsd	.LC1(%rip), %xmm0
	movq	%xmm0, %r12
	call	clock@PLT
	movq	%rax, %rbp
	movq	%r14, %rsi
	movq	%r13, %rdi
	call	copyji
	call	clock@PLT
	movq	%rax, %rbx
	movq	%r12, %xmm0
	leaq	.LC2(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	subq	%rbp, %rbx
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rbx, %xmm0
	divsd	.LC1(%rip), %xmm0
	leaq	.LC3(%rip), %rdi
	movl	$1, %eax
	call	printf@PLT
	movq	%r13, %rdi
	call	free@PLT
	movq	%r14, %rdi
	call	free@PLT
	movl	$0, %eax
.L11:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	movq	stderr(%rip), %rcx
	movl	$26, %edx
	movl	$1, %esi
	leaq	.LC0(%rip), %rdi
	call	fwrite@PLT
	movl	$1, %eax
	jmp	.L11
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
