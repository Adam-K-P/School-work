	.file	"insertion-sort.c"
	.text
	.globl	cmp
cmp:
.LFB25:
	movl	(%rsi), %edx
	movl	(%rdi), %ecx
	xorl	%eax, %eax
	cmpl	%edx, %ecx
	setl	%dl
	setg	%al
	movzbl	%dl, %edx
	subl	%edx, %eax
	ret
.LFE25:

	.globl	sort
sort:
.LFB23:
	pushq	%rbp
	leaq	15(%rdx), %rax
	movq	%rsp, %rbp
	pushq	%r15
	andq	$-16, %rax
	movq	%rcx, %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	movq	%rdx, %rbx
	subq	$56, %rsp
	movq	%rdi, -80(%rbp)
	movq	%rsi, -88(%rbp)
	subq	%rax, %rsp
	movq	%rdi, %rax
	movq	$2, -64(%rbp)
	addq	%rdx, %rax
	cmpq	$1, %rsi
	movq	%rsp, -56(%rbp)
	movq	%rax, -72(%rbp)
	jbe	.L2
.L12:
	movq	-64(%rbp), %rax
	movq	-72(%rbp), %r14
	movq	%rbx, %rdx
	movq	-56(%rbp), %rdi
	leaq	-1(%rax), %r13
	movq	%r14, %rsi
	call	memcpy
	testq	%r13, %r13
	je	.L5
	subq	%rbx, %r14
	jmp	.L8
.L6:
	leaq	(%r14,%rbx), %rdi
	movq	%r14, %rsi
	movq	%rbx, %rdx
	subq	%rbx, %r14
	call	memcpy
	testq	%r12, %r12
	je	.L11
	movq	%r12, %r13
.L8:
	movq	-56(%rbp), %rsi
	movq	%r14, %rdi
	leaq	-1(%r13), %r12
	call	*%r15
	testl	%eax, %eax
	jns	.L6
	movq	%r13, %rdi
	imulq	%rbx, %rdi
.L7:
	addq	-80(%rbp), %rdi
	movq	-56(%rbp), %rsi
	movq	%rbx, %rdx
	call	memcpy
	movq	-88(%rbp), %rax
	cmpq	%rax, -64(%rbp)
	jae	.L2
.L9:
	addq	%rbx, -72(%rbp)
	addq	$1, -64(%rbp)
	jmp	.L12
.L11:
	xorl	%edi, %edi
	jmp	.L7
.L2:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	ret
.L5:
	movq	-56(%rbp), %rsi
	movq	-80(%rbp), %rdi
	movq	%rbx, %rdx
	call	memcpy
	jmp	.L9
.LFE23:

.LC0:
	.string	" %d"
	.text
	.globl	print
print:
.LFB24:
	pushq	%r12
	movq	%rdi, %r12
	pushq	%rbp
	movq	%rsi, %rbp
	pushq	%rbx
	xorl	%ebx, %ebx
	testq	%rsi, %rsi
	je	.L17
.L19:
	movl	(%r12,%rbx,4), %esi
	xorl	%eax, %eax
	movl	$.LC0, %edi
	addq	$1, %rbx
	call	printf
	cmpq	%rbp, %rbx
	jne	.L19
.L17:
	popq	%rbx
	popq	%rbp
	popq	%r12
	movl	$10, %edi
	jmp	putchar
.LFE24:

	.globl	main
main:
.LFB26:
	subq	$8, %rsp
	movl	$10, %esi
	movl	$a.2584, %edi
	call	print
	movl	$cmp, %ecx
	movl	$4, %edx
	movl	$10, %esi
	movl	$a.2584, %edi
	call	sort
	movl	$10, %esi
	movl	$a.2584, %edi
	call	print
	xorl	%eax, %eax
	addq	$8, %rsp
	ret
.LFE26:
	.data
	.align 32
a.2584:
	.long	13
	.long	91
	.long	41
	.long	22
	.long	67
	.long	48
	.long	11
	.long	16
	.long	55
	.long	30
