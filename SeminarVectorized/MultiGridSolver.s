	.file	"MultiGridSolver.cpp"
	.section	.text.unlikely,"ax",@progbits
	.align 2
.LCOLDB0:
	.text
.LHOTB0:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolverD2Ev
	.type	_ZN15MultiGridSolverD2Ev, @function
_ZN15MultiGridSolverD2Ev:
.LFB5531:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	72(%rdi), %rdx
	movq	%rdi, %r12
	testq	%rdx, %rdx
	je	.L13
	.p2align 4,,10
	.p2align 3
.L32:
	movq	(%r12), %rax
	movq	(%rax,%rbp,8), %rbx
	testq	%rbx, %rbx
	je	.L5
	movq	136(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L6
	call	_ZdlPv
.L6:
	movq	112(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L7
	call	_ZdlPv
.L7:
	movq	88(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L8
	call	_ZdlPv
.L8:
	movq	64(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L9
	call	_ZdlPv
.L9:
	movq	40(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L10
	call	_ZdlPv
.L10:
	movq	16(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L11
	call	_ZdlPv
.L11:
	movq	%rbx, %rdi
	call	_ZdlPv
	movq	72(%r12), %rdx
.L5:
	addq	$1, %rbp
	cmpq	%rdx, %rbp
	jb	.L32
.L13:
	movq	48(%r12), %rdi
	testq	%rdi, %rdi
	je	.L4
	call	_ZdlPv
.L4:
	movq	24(%r12), %rdi
	testq	%rdi, %rdi
	je	.L14
	call	_ZdlPv
.L14:
	movq	(%r12), %rdi
	testq	%rdi, %rdi
	je	.L1
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZdlPv
	.p2align 4,,10
	.p2align 3
.L1:
	.cfi_restore_state
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5531:
	.size	_ZN15MultiGridSolverD2Ev, .-_ZN15MultiGridSolverD2Ev
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.globl	_ZN15MultiGridSolverD1Ev
	.set	_ZN15MultiGridSolverD1Ev,_ZN15MultiGridSolverD2Ev
	.section	.text.unlikely
	.align 2
.LCOLDB3:
	.text
.LHOTB3:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver9getRedIndERKmS1_S1_
	.type	_ZN15MultiGridSolver9getRedIndERKmS1_S1_, @function
_ZN15MultiGridSolver9getRedIndERKmS1_S1_:
.LFB5535:
	.cfi_startproc
	movq	(%rsi), %rax
	imulq	(%rcx), %rax
	addq	(%rdx), %rax
	js	.L45
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L46:
	mulsd	.LC1(%rip), %xmm0
	movsd	.LC2(%rip), %xmm1
	ucomisd	%xmm1, %xmm0
	jnb	.L47
	cvttsd2siq	%xmm0, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	subsd	%xmm1, %xmm0
	movabsq	$-9223372036854775808, %rdx
	cvttsd2siq	%xmm0, %rax
	xorq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L45:
	movq	%rax, %rdx
	pxor	%xmm0, %xmm0
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L46
	.cfi_endproc
.LFE5535:
	.size	_ZN15MultiGridSolver9getRedIndERKmS1_S1_, .-_ZN15MultiGridSolver9getRedIndERKmS1_S1_
	.section	.text.unlikely
.LCOLDE3:
	.text
.LHOTE3:
	.section	.text.unlikely
	.align 2
.LCOLDB4:
	.text
.LHOTB4:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver11getBlackIndERKmS1_S1_
	.type	_ZN15MultiGridSolver11getBlackIndERKmS1_S1_, @function
_ZN15MultiGridSolver11getBlackIndERKmS1_S1_:
.LFB5536:
	.cfi_startproc
	movq	(%rsi), %rax
	movq	(%rdx), %rdx
	imulq	(%rcx), %rax
	leaq	-1(%rdx,%rax), %rax
	testq	%rax, %rax
	js	.L50
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L51:
	mulsd	.LC1(%rip), %xmm0
	movsd	.LC2(%rip), %xmm1
	ucomisd	%xmm1, %xmm0
	jnb	.L52
	cvttsd2siq	%xmm0, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L52:
	subsd	%xmm1, %xmm0
	movabsq	$-9223372036854775808, %rdx
	cvttsd2siq	%xmm0, %rax
	xorq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L50:
	movq	%rax, %rdx
	pxor	%xmm0, %xmm0
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L51
	.cfi_endproc
.LFE5536:
	.size	_ZN15MultiGridSolver11getBlackIndERKmS1_S1_, .-_ZN15MultiGridSolver11getBlackIndERKmS1_S1_
	.section	.text.unlikely
.LCOLDE4:
	.text
.LHOTE4:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"src/MultiGridSolver.cpp"
.LC6:
	.string	"level>1"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC7:
	.string	"Wall clock time of Restriction() in "
	.section	.rodata.str1.1
.LC9:
	.string	" seconds\n"
	.section	.text.unlikely
	.align 2
.LCOLDB10:
	.text
.LHOTB10:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver16applyRestrictionERKm
	.type	_ZN15MultiGridSolver16applyRestrictionERKm, @function
_ZN15MultiGridSolver16applyRestrictionERKm:
.LFB5537:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	(%rsi), %rax
	movq	%rsi, 88(%rsp)
	cmpq	$1, %rax
	jbe	.L105
	movl	72(%rdi), %ebx
	movq	(%rdi), %rdx
	movq	%rdi, %r13
	leaq	96(%rsp), %rdi
	xorl	%esi, %esi
	subl	%eax, %ebx
	movslq	%ebx, %rax
	leaq	0(,%rax,8), %rbx
	movq	(%rdx,%rax,8), %rax
	movq	%rbx, 56(%rsp)
	movq	8(%rax), %rax
	movq	%rax, %r14
	movq	%rax, 40(%rsp)
	leaq	8(%rbx), %rax
	movq	%rax, 64(%rsp)
	movq	8(%rdx,%rbx), %rax
	leaq	-2(%r14), %rbx
	movq	8(%rax), %rax
	movq	%rax, 48(%rsp)
	call	gettimeofday
	cmpq	$2, %rbx
	movq	%r14, %rax
	movq	%rbx, 8(%rsp)
	jbe	.L56
	addq	%rax, %rax
	movsd	.LC1(%rip), %xmm4
	movq	%rax, 72(%rsp)
	movq	%rax, %rbp
	movq	0(%r13), %rax
	movsd	.LC2(%rip), %xmm3
	movq	$2, 32(%rsp)
	movabsq	$-9223372036854775808, %r12
	movq	%rax, 80(%rsp)
	.p2align 4,,10
	.p2align 3
.L57:
	cmpq	$0, 32(%rsp)
	js	.L97
	pxor	%xmm0, %xmm0
	cvtsi2sdq	32(%rsp), %xmm0
.L98:
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jnb	.L99
	cvttsd2siq	%xmm0, %rax
	movq	%rax, (%rsp)
.L100:
	movq	80(%rsp), %rdx
	movq	56(%rsp), %rbx
	xorl	%r8d, %r8d
	movq	64(%rsp), %rsi
	movq	40(%rsp), %rdi
	movq	(%rdx,%rbx), %rax
	movq	(%rdx,%rsi), %r14
	movq	(%rsp), %rdx
	leaq	1(%rdi,%rbp), %r10
	imulq	48(%rsp), %rdx
	movq	64(%rax), %r9
	movq	88(%rax), %rbx
	movq	%rbp, %rax
	subq	%rdi, %rax
	leaq	1(%rax), %r11
	movq	%rdx, %rsi
	movq	%rdx, 16(%rsp)
	movl	$2, %edx
	movq	%rsi, %rax
	subq	$1, %rax
	movq	%rax, 24(%rsp)
	jmp	.L96
	.p2align 4,,10
	.p2align 3
.L107:
	movq	%r11, %rcx
	cvttsd2siq	%xmm0, %rax
	addq	%r8, %rcx
	js	.L62
.L108:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm0
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jnb	.L64
.L109:
	cvttsd2siq	%xmm0, %rdi
	movq	%rbp, %rcx
	salq	$3, %rdi
	addq	%rdx, %rcx
	js	.L66
.L110:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm0
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jnb	.L68
.L111:
	cvttsd2siq	%xmm0, %rsi
	movq	%r10, %rcx
	salq	$3, %rsi
	addq	%r8, %rcx
	js	.L70
.L112:
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm0
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jnb	.L72
.L113:
	cvttsd2siq	%xmm0, %rcx
.L73:
	movsd	136(%r13), %xmm2
	salq	$3, %rcx
	movsd	144(%r13), %xmm0
	mulsd	(%r9,%rdi), %xmm2
	mulsd	(%rbx,%rdi), %xmm0
	movq	%r11, %rdi
	addq	%rdx, %rdi
	addsd	%xmm0, %xmm2
	js	.L74
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdi, %xmm0
.L75:
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jnb	.L76
	cvttsd2siq	%xmm0, %rdi
.L77:
	movsd	152(%r13), %xmm0
	movsd	(%r9,%rdi,8), %xmm1
	movq	%rbp, %rdi
	addq	%r8, %rdi
	mulsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
	js	.L78
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdi, %xmm1
.L79:
	mulsd	%xmm4, %xmm1
	ucomisd	%xmm3, %xmm1
	jnb	.L80
	cvttsd2siq	%xmm1, %rdi
.L81:
	movsd	160(%r13), %xmm2
	mulsd	(%rbx,%rdi,8), %xmm2
	movapd	%xmm2, %xmm1
	movapd	%xmm0, %xmm2
	movsd	168(%r13), %xmm0
	addsd	%xmm1, %xmm2
	movsd	(%r9,%rsi), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
	movsd	176(%r13), %xmm2
	mulsd	(%rbx,%rsi), %xmm2
	movapd	%xmm2, %xmm1
	movapd	%xmm0, %xmm2
	movsd	184(%r13), %xmm0
	addsd	%xmm1, %xmm2
	movsd	(%r9,%rcx), %xmm1
	mulsd	%xmm0, %xmm1
	addsd	%xmm1, %xmm2
	movsd	(%rbx,%rcx), %xmm1
	movq	%r10, %rcx
	addq	%rdx, %rcx
	movapd	%xmm2, %xmm0
	movsd	192(%r13), %xmm2
	mulsd	%xmm2, %xmm1
	movapd	%xmm0, %xmm2
	addsd	%xmm1, %xmm2
	js	.L82
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm0
.L83:
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jnb	.L84
	cvttsd2siq	%xmm0, %rcx
.L85:
	movsd	200(%r13), %xmm0
	movq	(%rsp), %rsi
	movsd	(%r9,%rcx,8), %xmm1
	mulsd	%xmm0, %xmm1
	leaq	(%rax,%rsi), %rcx
	andl	$1, %ecx
	addsd	%xmm1, %xmm2
	movapd	%xmm2, %xmm0
	je	.L86
	addq	24(%rsp), %rax
	js	.L87
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L88:
	mulsd	%xmm4, %xmm1
	ucomisd	%xmm3, %xmm1
	jnb	.L89
	cvttsd2siq	%xmm1, %rax
.L90:
	addq	$2, %rdx
	addq	$2, %r8
	cmpq	8(%rsp), %rdx
	movq	40(%r14), %rcx
	movsd	%xmm0, (%rcx,%rax,8)
	jnb	.L106
.L96:
	testq	%rdx, %rdx
	js	.L58
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L59:
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jb	.L107
	subsd	%xmm3, %xmm0
	movq	%r11, %rcx
	cvttsd2siq	%xmm0, %rax
	xorq	%r12, %rax
	addq	%r8, %rcx
	jns	.L108
.L62:
	movq	%rcx, %rsi
	pxor	%xmm0, %xmm0
	shrq	%rsi
	andl	$1, %ecx
	orq	%rcx, %rsi
	cvtsi2sdq	%rsi, %xmm0
	addsd	%xmm0, %xmm0
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jb	.L109
.L64:
	subsd	%xmm3, %xmm0
	movq	%rbp, %rcx
	cvttsd2siq	%xmm0, %rdi
	xorq	%r12, %rdi
	salq	$3, %rdi
	addq	%rdx, %rcx
	jns	.L110
.L66:
	movq	%rcx, %rsi
	pxor	%xmm0, %xmm0
	shrq	%rsi
	andl	$1, %ecx
	orq	%rcx, %rsi
	cvtsi2sdq	%rsi, %xmm0
	addsd	%xmm0, %xmm0
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jb	.L111
.L68:
	subsd	%xmm3, %xmm0
	movq	%r10, %rcx
	cvttsd2siq	%xmm0, %rsi
	xorq	%r12, %rsi
	salq	$3, %rsi
	addq	%r8, %rcx
	jns	.L112
.L70:
	movq	%rcx, %r15
	pxor	%xmm0, %xmm0
	shrq	%r15
	andl	$1, %ecx
	orq	%rcx, %r15
	cvtsi2sdq	%r15, %xmm0
	addsd	%xmm0, %xmm0
	mulsd	%xmm4, %xmm0
	ucomisd	%xmm3, %xmm0
	jb	.L113
.L72:
	subsd	%xmm3, %xmm0
	cvttsd2siq	%xmm0, %rcx
	xorq	%r12, %rcx
	jmp	.L73
	.p2align 4,,10
	.p2align 3
.L86:
	addq	16(%rsp), %rax
	js	.L92
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L93:
	mulsd	%xmm4, %xmm1
	ucomisd	%xmm3, %xmm1
	jnb	.L94
	cvttsd2siq	%xmm1, %rax
.L95:
	addq	$2, %rdx
	addq	$2, %r8
	cmpq	8(%rsp), %rdx
	movq	16(%r14), %rcx
	movsd	%xmm0, (%rcx,%rax,8)
	jb	.L96
.L106:
	addq	$2, 32(%rsp)
	addq	72(%rsp), %rbp
	movq	32(%rsp), %rax
	cmpq	8(%rsp), %rax
	jb	.L57
.L56:
	leaq	112(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	88(%rsp), %rax
	movq	72(%r13), %rdx
	movq	112(%rsp), %rbp
	movq	96(%rsp), %r14
	movq	120(%rsp), %rbx
	movq	104(%rsp), %r12
	cmpq	%rdx, (%rax)
	je	.L114
.L54:
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L84:
	.cfi_restore_state
	subsd	%xmm3, %xmm0
	cvttsd2siq	%xmm0, %rcx
	xorq	%r12, %rcx
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L76:
	subsd	%xmm3, %xmm0
	cvttsd2siq	%xmm0, %rdi
	xorq	%r12, %rdi
	jmp	.L77
	.p2align 4,,10
	.p2align 3
.L80:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rdi
	xorq	%r12, %rdi
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L94:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rax
	xorq	%r12, %rax
	jmp	.L95
	.p2align 4,,10
	.p2align 3
.L89:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rax
	xorq	%r12, %rax
	jmp	.L90
	.p2align 4,,10
	.p2align 3
.L58:
	movq	%rdx, %rax
	movq	%rdx, %rcx
	pxor	%xmm0, %xmm0
	shrq	%rax
	andl	$1, %ecx
	orq	%rcx, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L59
	.p2align 4,,10
	.p2align 3
.L78:
	movq	%rdi, %r15
	pxor	%xmm1, %xmm1
	shrq	%r15
	andl	$1, %edi
	orq	%rdi, %r15
	cvtsi2sdq	%r15, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L79
	.p2align 4,,10
	.p2align 3
.L82:
	movq	%rcx, %rsi
	pxor	%xmm0, %xmm0
	shrq	%rsi
	andl	$1, %ecx
	orq	%rcx, %rsi
	cvtsi2sdq	%rsi, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L83
	.p2align 4,,10
	.p2align 3
.L74:
	movq	%rdi, %r15
	pxor	%xmm0, %xmm0
	shrq	%r15
	andl	$1, %edi
	orq	%rdi, %r15
	cvtsi2sdq	%r15, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L75
	.p2align 4,,10
	.p2align 3
.L92:
	movq	%rax, %rcx
	pxor	%xmm1, %xmm1
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	cvtsi2sdq	%rcx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L87:
	movq	%rax, %rcx
	pxor	%xmm1, %xmm1
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	cvtsi2sdq	%rcx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L99:
	subsd	%xmm3, %xmm0
	cvttsd2siq	%xmm0, %rax
	xorq	%r12, %rax
	movq	%rax, (%rsp)
	jmp	.L100
	.p2align 4,,10
	.p2align 3
.L97:
	movq	32(%rsp), %rdx
	pxor	%xmm0, %xmm0
	movq	%rdx, %rax
	andl	$1, %edx
	shrq	%rax
	orq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L98
.L114:
	movl	$36, %edx
	movl	$.LC7, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbp, %rax
	pxor	%xmm0, %xmm0
	subq	%r14, %rax
	movl	$_ZSt4cout, %edi
	imulq	$1000000, %rax, %rax
	addq	%rbx, %rax
	subq	%r12, %rax
	cvtsi2sdq	%rax, %xmm0
	mulsd	.LC8(%rip), %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$9, %edx
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	jmp	.L54
.L105:
	movl	$_ZZN15MultiGridSolver16applyRestrictionERKmE19__PRETTY_FUNCTION__, %ecx
	movl	$217, %edx
	movl	$.LC5, %esi
	movl	$.LC6, %edi
	call	__assert_fail
	.cfi_endproc
.LFE5537:
	.size	_ZN15MultiGridSolver16applyRestrictionERKm, .-_ZN15MultiGridSolver16applyRestrictionERKm
	.section	.text.unlikely
.LCOLDE10:
	.text
.LHOTE10:
	.section	.rodata.str1.1
.LC11:
	.string	"level > 0 && level< numLevel_"
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"Wall clock time of Interpolation() in "
	.section	.text.unlikely
	.align 2
.LCOLDB13:
	.text
.LHOTB13:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver18applyInterpolationERKm
	.type	_ZN15MultiGridSolver18applyInterpolationERKm, @function
_ZN15MultiGridSolver18applyInterpolationERKm:
.LFB5538:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movq	(%rsi), %rdx
	movq	%rsi, 136(%rsp)
	testq	%rdx, %rdx
	je	.L116
	movq	72(%rdi), %rax
	movq	%rdi, %rbp
	cmpq	%rax, %rdx
	jnb	.L116
	movq	(%rdi), %rcx
	subl	%edx, %eax
	cltq
	leaq	0(,%rax,8), %r15
	movq	(%rcx,%rax,8), %rax
	movq	8(%rax), %rax
	movq	%rax, %rbx
	movq	%rax, 120(%rsp)
	movq	-8(%rcx,%r15), %rax
	movq	8(%rax), %r12
	movq	%rbx, %rax
	subq	$1, %rax
	movq	%rax, 8(%rsp)
	js	.L118
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L119:
	movsd	.LC1(%rip), %xmm2
	movsd	.LC2(%rip), %xmm0
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L120
	cvttsd2siq	%xmm1, %rax
	movq	%rax, 16(%rsp)
.L121:
	leaq	144(%rsp), %rdi
	xorl	%esi, %esi
	movsd	%xmm0, 32(%rsp)
	movsd	%xmm2, 40(%rsp)
	call	gettimeofday
	cmpq	$0, 8(%rsp)
	je	.L122
	movq	0(%rbp), %rax
	movsd	32(%rsp), %xmm0
	movq	%r12, %rdi
	movl	$1, %edx
	movq	%r12, 104(%rsp)
	subq	%rdi, %rdx
	movapd	%xmm0, %xmm3
	movq	%rax, 24(%rsp)
	movq	-8(%rax,%r15), %rax
	movsd	40(%rsp), %xmm2
	movq	$0, 48(%rsp)
	movq	%rdx, 32(%rsp)
	movq	112(%rax), %rbx
	movq	136(%rax), %r13
	leaq	(%r12,%r12), %rax
	movabsq	$-9223372036854775808, %r12
	movq	%rax, 128(%rsp)
	movq	120(%rsp), %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L123:
	leaq	1(%rax), %rdi
	cmpq	%rax, 16(%rsp)
	leaq	-1(%rax), %r14
	movq	48(%rsp), %rax
	movl	$1, %r8d
	movq	%rdi, 112(%rsp)
	movq	104(%rsp), %rdi
	setne	40(%rsp)
	leaq	-1(%rdi), %r9
	leaq	-1(%rax), %rdi
	subq	$2, %rax
	movq	%rax, 88(%rsp)
	movq	%rdi, 72(%rsp)
	movq	56(%rsp), %rdi
	leaq	-2(%rdi), %rcx
	leaq	-1(%rdi), %rax
	movq	%rcx, 80(%rsp)
	movq	%rax, 96(%rsp)
	jmp	.L188
	.p2align 4,,10
	.p2align 3
.L201:
	movq	(%rax,%r15), %rdx
	movq	88(%rsp), %rax
	addq	%r8, %rax
	movq	136(%rdx), %rsi
	js	.L125
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L126:
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L127
	cvttsd2siq	%xmm1, %rax
.L128:
	movsd	(%rsi,%rax,8), %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L129
	movq	112(%rdx), %r10
	movq	48(%rsp), %rdx
	cvttsd2siq	%xmm1, %rax
	addq	%r8, %rdx
	js	.L131
.L211:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
.L132:
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L133
	cvttsd2siq	%xmm1, %rdx
.L134:
	movsd	(%r10,%rdx,8), %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L135
	movq	96(%rsp), %rdx
	cvttsd2siq	%xmm1, %rcx
	addq	%r8, %rdx
	js	.L137
.L210:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
.L138:
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L139
	cvttsd2siq	%xmm1, %rdx
.L140:
	movsd	(%r10,%rdx,8), %xmm1
	leaq	0(,%rdx,8), %rdi
	ucomisd	%xmm0, %xmm1
	jnb	.L141
	cvttsd2siq	%xmm1, %rdx
.L142:
	movsd	(%rsi,%rdi), %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L199
.L164:
	subsd	%xmm3, %xmm1
	leaq	-1(%r8), %rsi
	cvttsd2siq	%xmm1, %rdi
	xorq	%r12, %rdi
	cmpq	%rsi, 16(%rsp)
	ja	.L166
.L202:
	cmpb	$0, 40(%rsp)
	jne	.L166
	addq	%rax, %rcx
	testq	%r9, %r9
	js	.L176
.L203:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%r9, %xmm1
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L178
.L204:
	cvttsd2siq	%xmm1, %rsi
	addq	%rdx, %rax
	leaq	0(%r13,%rsi,8), %rsi
	js	.L180
.L205:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L181:
	mulsd	336(%rbp), %xmm1
	addq	$2, %r9
	addsd	(%rsi), %xmm1
	movsd	%xmm1, (%rsi)
	js	.L182
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%r9, %xmm1
.L183:
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L184
	cvttsd2siq	%xmm1, %rax
	addq	%rdi, %rdx
	addq	%rdx, %rcx
	leaq	(%rbx,%rax,8), %rax
	js	.L186
.L206:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
.L187:
	mulsd	344(%rbp), %xmm1
	cmpq	%r8, 8(%rsp)
	addsd	(%rax), %xmm1
	movsd	%xmm1, (%rax)
	leaq	1(%r8), %rax
	jbe	.L200
	movq	%rax, %r8
.L188:
	leaq	(%r14,%r8), %rax
	testb	$1, %al
	movq	24(%rsp), %rax
	jne	.L201
	movq	(%rax,%r15), %rcx
	movq	72(%rsp), %rax
	addq	%r8, %rax
	movq	112(%rcx), %rdi
	js	.L146
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L147:
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L148
	cvttsd2siq	%xmm1, %rax
.L149:
	movsd	(%rdi,%rax,8), %xmm1
	leaq	0(,%rax,8), %rdx
	ucomisd	%xmm0, %xmm1
	jnb	.L150
	cvttsd2siq	%xmm1, %rax
.L151:
	movq	136(%rcx), %rsi
	movsd	(%rsi,%rdx), %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L152
	movq	80(%rsp), %rdx
	cvttsd2siq	%xmm1, %rcx
	addq	%r8, %rdx
	js	.L154
.L209:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
.L155:
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L156
	cvttsd2siq	%xmm1, %rdx
.L157:
	movsd	(%rsi,%rdx,8), %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L158
	movq	56(%rsp), %rsi
	cvttsd2siq	%xmm1, %rdx
	addq	%r8, %rsi
	js	.L160
.L208:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rsi, %xmm1
.L161:
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L162
	cvttsd2siq	%xmm1, %rsi
.L163:
	movsd	(%rdi,%rsi,8), %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L164
.L199:
	leaq	-1(%r8), %rsi
	cmpq	%rsi, 16(%rsp)
	cvttsd2siq	%xmm1, %rdi
	jbe	.L202
.L166:
	movq	32(%rsp), %rsi
	addq	%r9, %rsi
	js	.L168
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rsi, %xmm1
.L169:
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jnb	.L170
	cvttsd2siq	%xmm1, %rsi
	salq	$3, %rsi
	testq	%rax, %rax
	leaq	(%rbx,%rsi), %r10
	js	.L172
.L207:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L173:
	mulsd	312(%rbp), %xmm1
	addq	%r13, %rsi
	addq	%rax, %rcx
	addsd	(%r10), %xmm1
	movsd	%xmm1, (%r10)
	js	.L174
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
.L175:
	mulsd	320(%rbp), %xmm1
	testq	%r9, %r9
	addsd	(%rsi), %xmm1
	movsd	%xmm1, (%rsi)
	jns	.L203
.L176:
	movq	%r9, %rsi
	movq	%r9, %r10
	pxor	%xmm1, %xmm1
	shrq	%rsi
	andl	$1, %r10d
	orq	%r10, %rsi
	cvtsi2sdq	%rsi, %xmm1
	addsd	%xmm1, %xmm1
	mulsd	%xmm2, %xmm1
	ucomisd	%xmm0, %xmm1
	jb	.L204
.L178:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rsi
	xorq	%r12, %rsi
	addq	%rdx, %rax
	leaq	0(%r13,%rsi,8), %rsi
	jns	.L205
.L180:
	movq	%rax, %r10
	pxor	%xmm1, %xmm1
	shrq	%r10
	andl	$1, %eax
	orq	%rax, %r10
	cvtsi2sdq	%r10, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L181
	.p2align 4,,10
	.p2align 3
.L184:
	subsd	%xmm3, %xmm1
	addq	%rdi, %rdx
	cvttsd2siq	%xmm1, %rax
	xorq	%r12, %rax
	addq	%rdx, %rcx
	leaq	(%rbx,%rax,8), %rax
	jns	.L206
.L186:
	movq	%rcx, %rsi
	pxor	%xmm1, %xmm1
	shrq	%rsi
	andl	$1, %ecx
	orq	%rcx, %rsi
	cvtsi2sdq	%rsi, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L187
	.p2align 4,,10
	.p2align 3
.L170:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rsi
	xorq	%r12, %rsi
	salq	$3, %rsi
	testq	%rax, %rax
	leaq	(%rbx,%rsi), %r10
	jns	.L207
.L172:
	movq	%rax, %r11
	pxor	%xmm1, %xmm1
	shrq	%r11
	movq	%r11, 64(%rsp)
	movq	%rax, %r11
	andl	$1, %r11d
	orq	%r11, 64(%rsp)
	cvtsi2sdq	64(%rsp), %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L173
	.p2align 4,,10
	.p2align 3
.L162:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rsi
	xorq	%r12, %rsi
	jmp	.L163
	.p2align 4,,10
	.p2align 3
.L158:
	subsd	%xmm3, %xmm1
	movq	56(%rsp), %rsi
	cvttsd2siq	%xmm1, %rdx
	xorq	%r12, %rdx
	addq	%r8, %rsi
	jns	.L208
.L160:
	movq	%rsi, %r10
	pxor	%xmm1, %xmm1
	shrq	%r10
	andl	$1, %esi
	orq	%rsi, %r10
	cvtsi2sdq	%r10, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L161
	.p2align 4,,10
	.p2align 3
.L156:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rdx
	xorq	%r12, %rdx
	jmp	.L157
	.p2align 4,,10
	.p2align 3
.L152:
	subsd	%xmm3, %xmm1
	movq	80(%rsp), %rdx
	cvttsd2siq	%xmm1, %rcx
	xorq	%r12, %rcx
	addq	%r8, %rdx
	jns	.L209
.L154:
	movq	%rdx, %r10
	pxor	%xmm1, %xmm1
	shrq	%r10
	andl	$1, %edx
	orq	%rdx, %r10
	cvtsi2sdq	%r10, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L155
	.p2align 4,,10
	.p2align 3
.L150:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rax
	xorq	%r12, %rax
	jmp	.L151
	.p2align 4,,10
	.p2align 3
.L148:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rax
	xorq	%r12, %rax
	jmp	.L149
	.p2align 4,,10
	.p2align 3
.L141:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rdx
	xorq	%r12, %rdx
	jmp	.L142
	.p2align 4,,10
	.p2align 3
.L139:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rdx
	xorq	%r12, %rdx
	jmp	.L140
	.p2align 4,,10
	.p2align 3
.L135:
	subsd	%xmm3, %xmm1
	movq	96(%rsp), %rdx
	cvttsd2siq	%xmm1, %rcx
	xorq	%r12, %rcx
	addq	%r8, %rdx
	jns	.L210
.L137:
	movq	%rdx, %rdi
	pxor	%xmm1, %xmm1
	shrq	%rdi
	andl	$1, %edx
	orq	%rdx, %rdi
	cvtsi2sdq	%rdi, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L138
	.p2align 4,,10
	.p2align 3
.L133:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rdx
	xorq	%r12, %rdx
	jmp	.L134
	.p2align 4,,10
	.p2align 3
.L129:
	subsd	%xmm3, %xmm1
	movq	112(%rdx), %r10
	movq	48(%rsp), %rdx
	cvttsd2siq	%xmm1, %rax
	xorq	%r12, %rax
	addq	%r8, %rdx
	jns	.L211
.L131:
	movq	%rdx, %rcx
	pxor	%xmm1, %xmm1
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	cvtsi2sdq	%rcx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L132
	.p2align 4,,10
	.p2align 3
.L127:
	subsd	%xmm3, %xmm1
	cvttsd2siq	%xmm1, %rax
	xorq	%r12, %rax
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L182:
	movq	%r9, %rax
	movq	%r9, %rsi
	pxor	%xmm1, %xmm1
	shrq	%rax
	andl	$1, %esi
	orq	%rsi, %rax
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L183
	.p2align 4,,10
	.p2align 3
.L168:
	movq	%rsi, %r10
	pxor	%xmm1, %xmm1
	shrq	%r10
	andl	$1, %esi
	orq	%rsi, %r10
	cvtsi2sdq	%r10, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L169
	.p2align 4,,10
	.p2align 3
.L174:
	movq	%rcx, %r10
	movq	%rcx, %r11
	pxor	%xmm1, %xmm1
	shrq	%r10
	andl	$1, %r11d
	orq	%r11, %r10
	cvtsi2sdq	%r10, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L175
	.p2align 4,,10
	.p2align 3
.L125:
	movq	%rax, %rcx
	pxor	%xmm1, %xmm1
	shrq	%rcx
	andl	$1, %eax
	orq	%rax, %rcx
	cvtsi2sdq	%rcx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L126
	.p2align 4,,10
	.p2align 3
.L146:
	movq	%rax, %rdx
	pxor	%xmm1, %xmm1
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L147
	.p2align 4,,10
	.p2align 3
.L200:
	movq	128(%rsp), %rdi
	movq	112(%rsp), %rax
	addq	%rdi, 104(%rsp)
	movq	120(%rsp), %rdi
	addq	%rdi, 48(%rsp)
	addq	%rdi, 56(%rsp)
	cmpq	%rax, 8(%rsp)
	jne	.L123
.L122:
	leaq	160(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	136(%rsp), %rax
	movq	72(%rbp), %rdi
	movq	160(%rsp), %r14
	movq	144(%rsp), %r13
	movq	168(%rsp), %rbx
	movq	152(%rsp), %r12
	cmpq	%rdi, (%rax)
	je	.L212
.L115:
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L120:
	.cfi_restore_state
	subsd	%xmm0, %xmm1
	cvttsd2siq	%xmm1, %rax
	movq	%rax, %rbx
	movabsq	$-9223372036854775808, %rax
	xorq	%rax, %rbx
	movq	%rbx, 16(%rsp)
	jmp	.L121
.L118:
	movq	%rax, %rdx
	pxor	%xmm1, %xmm1
	shrq	%rax
	andl	$1, %edx
	orq	%rdx, %rax
	cvtsi2sdq	%rax, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L119
.L212:
	movl	$38, %edx
	movl	$.LC12, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%r14, %rax
	pxor	%xmm0, %xmm0
	subq	%r13, %rax
	movl	$_ZSt4cout, %edi
	imulq	$1000000, %rax, %rax
	addq	%rbx, %rax
	subq	%r12, %rax
	cvtsi2sdq	%rax, %xmm0
	mulsd	.LC8(%rip), %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$9, %edx
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	jmp	.L115
.L116:
	movl	$_ZZN15MultiGridSolver18applyInterpolationERKmE19__PRETTY_FUNCTION__, %ecx
	movl	$292, %edx
	movl	$.LC5, %esi
	movl	$.LC11, %edi
	call	__assert_fail
	.cfi_endproc
.LFE5538:
	.size	_ZN15MultiGridSolver18applyInterpolationERKm, .-_ZN15MultiGridSolver18applyInterpolationERKm
	.section	.text.unlikely
.LCOLDE13:
	.text
.LHOTE13:
	.section	.rodata.str1.1
.LC14:
	.string	"cgInd>=0"
	.section	.rodata.str1.8
	.align 8
.LC16:
	.string	"Wall clock time of compute Residual() is "
	.section	.text.unlikely
	.align 2
.LCOLDB17:
	.text
.LHOTB17:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver15computeResidualERKm
	.type	_ZN15MultiGridSolver15computeResidualERKm, @function
_ZN15MultiGridSolver15computeResidualERKm:
.LFB5539:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	72(%rdi), %rbp
	subl	(%rsi), %ebp
	movq	%rsi, 56(%rsp)
	js	.L260
	movq	(%rdi), %rax
	movslq	%ebp, %rbp
	leaq	64(%rsp), %rdi
	movsd	.LC15(%rip), %xmm4
	movq	(%rax,%rbp,8), %rax
	movsd	(%rax), %xmm0
	movq	8(%rax), %rsi
	mulsd	%xmm0, %xmm0
	movq	%rsi, %r14
	movq	%rsi, 32(%rsp)
	xorl	%esi, %esi
	divsd	%xmm0, %xmm4
	movsd	%xmm4, (%rsp)
	call	gettimeofday
	leaq	-1(%r14), %rax
	movsd	(%rsp), %xmm4
	cmpq	$1, %rax
	movq	%rax, 40(%rsp)
	jbe	.L254
	movq	(%rbx), %rax
	movq	32(%rsp), %rsi
	movabsq	$-9223372036854775808, %r12
	movsd	.LC1(%rip), %xmm3
	movq	$1, 24(%rsp)
	movsd	.LC2(%rip), %xmm2
	movq	(%rax,%rbp,8), %r10
	movl	$1, %eax
	movq	%rsi, %rdx
	subq	%rsi, %rax
	movq	%rax, 48(%rsp)
	movq	%rax, 16(%rsp)
	movq	136(%r10), %r8
	movq	112(%r10), %rdi
	.p2align 4,,10
	.p2align 3
.L253:
	movq	32(%rsp), %r11
	movq	16(%rsp), %rsi
	movq	%rdx, %rcx
	addq	$1, 24(%rsp)
	leaq	2(%rdx), %rax
	subq	%r11, %rcx
	leaq	(%rdx,%r11), %r9
	leaq	-1(%rsi), %rbp
	leaq	-2(%rcx), %rsi
	subq	$1, %rcx
	subq	$2, %r11
	subq	%rdx, %rcx
	movq	%rcx, (%rsp)
	leaq	-1(%r9), %rcx
	subq	%rdx, %rsi
	subq	%rdx, %rcx
	movq	%rcx, 8(%rsp)
	jmp	.L252
	.p2align 4,,10
	.p2align 3
.L262:
	subq	$2, %rdx
	js	.L219
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L220:
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jnb	.L221
	cvttsd2siq	%xmm0, %rdx
.L222:
	movq	(%rsp), %rcx
	salq	$3, %rdx
	movq	88(%r10), %r13
	movq	40(%r10), %r14
	addq	%rax, %rcx
	js	.L223
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm0
.L224:
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jnb	.L225
	cvttsd2siq	%xmm0, %rcx
.L226:
	movsd	216(%rbx), %xmm0
	testq	%rax, %rax
	movsd	(%rdi,%rcx,8), %xmm1
	mulsd	%xmm0, %xmm1
	movsd	232(%rbx), %xmm0
	mulsd	(%rdi,%rdx), %xmm0
	addsd	%xmm1, %xmm0
	movsd	240(%rbx), %xmm1
	mulsd	(%r8,%rdx), %xmm1
	addsd	%xmm1, %xmm0
	js	.L227
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L228:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L229
	cvttsd2siq	%xmm1, %rcx
.L230:
	movsd	248(%rbx), %xmm1
	mulsd	(%rdi,%rcx,8), %xmm1
	movq	8(%rsp), %rcx
	addq	%rax, %rcx
	addsd	%xmm1, %xmm0
	js	.L231
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
.L232:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L233
	cvttsd2siq	%xmm1, %rcx
.L234:
	movsd	264(%rbx), %xmm1
	mulsd	(%rdi,%rcx,8), %xmm1
.L258:
	addsd	%xmm1, %xmm0
	movsd	(%r14,%rdx), %xmm1
	addq	$1, %rax
	cmpq	%r9, %rax
	mulsd	%xmm4, %xmm0
	subsd	%xmm0, %xmm1
	movsd	%xmm1, 0(%r13,%rdx)
	je	.L261
.L252:
	leaq	0(%rbp,%rax), %rdx
	andl	$1, %edx
	movq	%rax, %rdx
	jne	.L262
	subq	$1, %rdx
	js	.L236
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L237:
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jnb	.L238
	cvttsd2siq	%xmm0, %rdx
.L239:
	movq	%rsi, %rcx
	salq	$3, %rdx
	movq	64(%r10), %r13
	addq	%rax, %rcx
	movq	16(%r10), %r14
	js	.L240
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm0
.L241:
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jnb	.L242
	cvttsd2siq	%xmm0, %rcx
.L243:
	movsd	(%r8,%rcx,8), %xmm1
	movq	%rax, %rcx
	movsd	216(%rbx), %xmm0
	subq	$3, %rcx
	mulsd	%xmm0, %xmm1
	js	.L244
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rcx, %xmm0
.L245:
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jnb	.L246
	cvttsd2siq	%xmm0, %rcx
.L247:
	movsd	232(%rbx), %xmm0
	mulsd	(%r8,%rcx,8), %xmm0
	movq	%r11, %rcx
	addq	%rax, %rcx
	addsd	%xmm1, %xmm0
	movsd	240(%rbx), %xmm1
	mulsd	(%rdi,%rdx), %xmm1
	addsd	%xmm1, %xmm0
	movsd	248(%rbx), %xmm1
	mulsd	(%r8,%rdx), %xmm1
	addsd	%xmm1, %xmm0
	js	.L248
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rcx, %xmm1
.L249:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L250
	cvttsd2siq	%xmm1, %rcx
.L251:
	movsd	264(%rbx), %xmm1
	mulsd	(%r8,%rcx,8), %xmm1
	jmp	.L258
	.p2align 4,,10
	.p2align 3
.L233:
	subsd	%xmm2, %xmm1
	cvttsd2siq	%xmm1, %rcx
	xorq	%r12, %rcx
	jmp	.L234
	.p2align 4,,10
	.p2align 3
.L229:
	subsd	%xmm2, %xmm1
	cvttsd2siq	%xmm1, %rcx
	xorq	%r12, %rcx
	jmp	.L230
	.p2align 4,,10
	.p2align 3
.L225:
	subsd	%xmm2, %xmm0
	cvttsd2siq	%xmm0, %rcx
	xorq	%r12, %rcx
	jmp	.L226
	.p2align 4,,10
	.p2align 3
.L221:
	subsd	%xmm2, %xmm0
	cvttsd2siq	%xmm0, %rdx
	xorq	%r12, %rdx
	jmp	.L222
	.p2align 4,,10
	.p2align 3
.L250:
	subsd	%xmm2, %xmm1
	cvttsd2siq	%xmm1, %rcx
	xorq	%r12, %rcx
	jmp	.L251
	.p2align 4,,10
	.p2align 3
.L246:
	subsd	%xmm2, %xmm0
	cvttsd2siq	%xmm0, %rcx
	xorq	%r12, %rcx
	jmp	.L247
	.p2align 4,,10
	.p2align 3
.L242:
	subsd	%xmm2, %xmm0
	cvttsd2siq	%xmm0, %rcx
	xorq	%r12, %rcx
	jmp	.L243
	.p2align 4,,10
	.p2align 3
.L238:
	subsd	%xmm2, %xmm0
	cvttsd2siq	%xmm0, %rdx
	xorq	%r12, %rdx
	jmp	.L239
	.p2align 4,,10
	.p2align 3
.L240:
	movq	%rcx, %r15
	pxor	%xmm0, %xmm0
	shrq	%r15
	andl	$1, %ecx
	orq	%rcx, %r15
	cvtsi2sdq	%r15, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L241
	.p2align 4,,10
	.p2align 3
.L236:
	movq	%rdx, %rcx
	pxor	%xmm0, %xmm0
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	cvtsi2sdq	%rcx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L237
	.p2align 4,,10
	.p2align 3
.L231:
	movq	%rcx, %r15
	pxor	%xmm1, %xmm1
	shrq	%r15
	andl	$1, %ecx
	orq	%rcx, %r15
	cvtsi2sdq	%r15, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L232
	.p2align 4,,10
	.p2align 3
.L227:
	movq	%rax, %rcx
	movq	%rax, %r15
	pxor	%xmm1, %xmm1
	shrq	%rcx
	andl	$1, %r15d
	orq	%r15, %rcx
	cvtsi2sdq	%rcx, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L228
	.p2align 4,,10
	.p2align 3
.L248:
	movq	%rcx, %r15
	pxor	%xmm1, %xmm1
	shrq	%r15
	andl	$1, %ecx
	orq	%rcx, %r15
	cvtsi2sdq	%r15, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L249
	.p2align 4,,10
	.p2align 3
.L244:
	movq	%rcx, %r15
	pxor	%xmm0, %xmm0
	shrq	%r15
	andl	$1, %ecx
	orq	%rcx, %r15
	cvtsi2sdq	%r15, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L245
	.p2align 4,,10
	.p2align 3
.L223:
	movq	%rcx, %r15
	pxor	%xmm0, %xmm0
	shrq	%r15
	andl	$1, %ecx
	orq	%rcx, %r15
	cvtsi2sdq	%r15, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L224
	.p2align 4,,10
	.p2align 3
.L219:
	movq	%rdx, %rcx
	pxor	%xmm0, %xmm0
	shrq	%rcx
	andl	$1, %edx
	orq	%rdx, %rcx
	cvtsi2sdq	%rcx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L261:
	movq	48(%rsp), %rdx
	movq	24(%rsp), %rsi
	addq	%rdx, 16(%rsp)
	cmpq	%rsi, 40(%rsp)
	movq	%rax, %rdx
	jne	.L253
.L254:
	leaq	80(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	56(%rsp), %rax
	movq	72(%rbx), %rsi
	movq	80(%rsp), %r12
	movq	64(%rsp), %r14
	movq	88(%rsp), %rbp
	movq	72(%rsp), %r13
	cmpq	%rsi, (%rax)
	je	.L263
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L263:
	.cfi_restore_state
	movl	$41, %edx
	movl	$.LC16, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%r12, %rax
	pxor	%xmm0, %xmm0
	subq	%r14, %rax
	movl	$_ZSt4cout, %edi
	imulq	$1000000, %rax, %rax
	addq	%rbp, %rax
	subq	%r13, %rax
	cvtsi2sdq	%rax, %xmm0
	mulsd	.LC8(%rip), %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$9, %edx
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L260:
	.cfi_restore_state
	movl	$_ZZN15MultiGridSolver15computeResidualERKmE19__PRETTY_FUNCTION__, %ecx
	movl	$384, %edx
	movl	$.LC5, %esi
	movl	$.LC14, %edi
	call	__assert_fail
	.cfi_endproc
.LFE5539:
	.size	_ZN15MultiGridSolver15computeResidualERKm, .-_ZN15MultiGridSolver15computeResidualERKm
	.section	.text.unlikely
.LCOLDE17:
	.text
.LHOTE17:
	.section	.text.unlikely
	.align 2
.LCOLDB18:
	.text
.LHOTB18:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver9getRedVecEv
	.type	_ZN15MultiGridSolver9getRedVecEv, @function
_ZN15MultiGridSolver9getRedVecEv:
.LFB5540:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rax), %rax
	addq	$112, %rax
	ret
	.cfi_endproc
.LFE5540:
	.size	_ZN15MultiGridSolver9getRedVecEv, .-_ZN15MultiGridSolver9getRedVecEv
	.section	.text.unlikely
.LCOLDE18:
	.text
.LHOTE18:
	.section	.text.unlikely
	.align 2
.LCOLDB19:
	.text
.LHOTB19:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver11getBlackVecEv
	.type	_ZN15MultiGridSolver11getBlackVecEv, @function
_ZN15MultiGridSolver11getBlackVecEv:
.LFB5541:
	.cfi_startproc
	movq	(%rdi), %rax
	movq	(%rax), %rax
	addq	$136, %rax
	ret
	.cfi_endproc
.LFE5541:
	.size	_ZN15MultiGridSolver11getBlackVecEv, .-_ZN15MultiGridSolver11getBlackVecEv
	.section	.text.unlikely
.LCOLDE19:
	.text
.LHOTE19:
	.section	.rodata.str1.1
.LC20:
	.string	"\nDisplay of "
.LC21:
	.string	"_ at level "
.LC22:
	.string	" during "
.LC23:
	.string	" v cycles\n"
.LC24:
	.string	"\n\n\n"
.LC25:
	.string	"res"
.LC26:
	.string	"f"
.LC27:
	.string	"u"
	.section	.rodata.str1.8
	.align 8
.LC28:
	.string	"Please enter the correct string literal in the display function\n"
	.section	.rodata.str1.1
.LC29:
	.string	"\t\t"
.LC30:
	.string	"\n"
.LC31:
	.string	"\n\n"
	.section	.text.unlikely
	.align 2
.LCOLDB32:
	.text
.LHOTB32:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver11displayGridERKmS1_RKSs
	.type	_ZN15MultiGridSolver11displayGridERKmS1_RKSs, @function
_ZN15MultiGridSolver11displayGridERKmS1_RKSs:
.LFB5543:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	(%rsi), %rbp
	movl	72(%rdi), %ebx
	subl	%ebp, %ebx
	js	.L297
	movq	%rcx, %r14
	movq	(%rdx), %r12
	movl	$.LC20, %esi
	movl	$12, %edx
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	(%r14), %rsi
	movl	$_ZSt4cout, %edi
	movq	-24(%rsi), %rdx
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$11, %edx
	movq	%rax, %r15
	movl	$.LC21, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%rbp, %rsi
	movq	%r15, %rdi
	call	_ZNSo9_M_insertImEERSoT_
	movl	$8, %edx
	movq	%rax, %rbp
	movl	$.LC22, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertImEERSoT_
	movl	$10, %edx
	movl	$.LC23, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$3, %edx
	movl	$.LC24, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	120(%r13), %rax
	movl	%eax, %ecx
	subl	$1, %ecx
	movl	%ecx, 12(%rsp)
	js	.L268
	movslq	%ebx, %rbx
	movslq	%ecx, %r12
	leaq	0(,%rbx,8), %r15
	.p2align 4,,10
	.p2align 3
.L269:
	xorl	%ebp, %ebp
	testq	%rax, %rax
	jne	.L293
	jmp	.L289
	.p2align 4,,10
	.p2align 3
.L298:
	subq	$1, %rax
	js	.L271
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L272:
	mulsd	.LC1(%rip), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jnb	.L273
	cvttsd2siq	%xmm0, %rbx
.L274:
	movl	$.LC25, %esi
	movq	%r14, %rdi
	movq	$8, _ZSt4cout+24(%rip)
	call	_ZNKSs7compareEPKc
	testl	%eax, %eax
	jne	.L275
	movq	0(%r13), %rax
	movq	(%rax,%r15), %rax
	movq	88(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm1
	movsd	%xmm1, (%rsp)
	movapd	%xmm1, %xmm0
.L285:
	movq	_ZSt4cout(%rip), %rax
	movl	$_ZSt4cout, %edi
	addq	$1, %rbp
	movq	-24(%rax), %rdx
	movl	_ZSt4cout+24(%rdx), %eax
	andb	$79, %al
	orl	$32, %eax
	movl	%eax, _ZSt4cout+24(%rdx)
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$2, %edx
	movl	$.LC29, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movq	120(%r13), %rax
	cmpq	%rbp, %rax
	jbe	.L289
.L293:
	imulq	%r12, %rax
	leaq	0(%rbp,%r12), %rdx
	addq	%rbp, %rax
	andl	$1, %edx
	jne	.L298
	testq	%rax, %rax
	js	.L280
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L281:
	mulsd	.LC1(%rip), %xmm0
	ucomisd	.LC2(%rip), %xmm0
	jnb	.L282
	cvttsd2siq	%xmm0, %rbx
.L283:
	movl	$.LC25, %esi
	movq	%r14, %rdi
	movq	$8, _ZSt4cout+24(%rip)
	call	_ZNKSs7compareEPKc
	testl	%eax, %eax
	jne	.L284
	movq	0(%r13), %rax
	movq	(%rax,%r15), %rax
	movq	64(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm2
	movsd	%xmm2, (%rsp)
	movapd	%xmm2, %xmm0
	jmp	.L285
	.p2align 4,,10
	.p2align 3
.L273:
	subsd	.LC2(%rip), %xmm0
	movabsq	$-9223372036854775808, %rax
	cvttsd2siq	%xmm0, %rbx
	xorq	%rax, %rbx
	jmp	.L274
	.p2align 4,,10
	.p2align 3
.L282:
	subsd	.LC2(%rip), %xmm0
	movabsq	$-9223372036854775808, %rax
	cvttsd2siq	%xmm0, %rbx
	xorq	%rax, %rbx
	jmp	.L283
	.p2align 4,,10
	.p2align 3
.L275:
	movl	$.LC26, %esi
	movq	%r14, %rdi
	call	_ZNKSs7compareEPKc
	testl	%eax, %eax
	jne	.L277
	movq	0(%r13), %rax
	movq	(%rax,%r15), %rax
	movq	40(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm3
	movsd	%xmm3, (%rsp)
	movapd	%xmm3, %xmm0
	jmp	.L285
	.p2align 4,,10
	.p2align 3
.L284:
	movl	$.LC26, %esi
	movq	%r14, %rdi
	call	_ZNKSs7compareEPKc
	testl	%eax, %eax
	jne	.L286
	movq	0(%r13), %rax
	movq	(%rax,%r15), %rax
	movq	16(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm4
	movsd	%xmm4, (%rsp)
	movapd	%xmm4, %xmm0
	jmp	.L285
	.p2align 4,,10
	.p2align 3
.L280:
	movq	%rax, %rdx
	pxor	%xmm0, %xmm0
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L281
	.p2align 4,,10
	.p2align 3
.L271:
	movq	%rax, %rdx
	pxor	%xmm0, %xmm0
	shrq	%rdx
	andl	$1, %eax
	orq	%rax, %rdx
	cvtsi2sdq	%rdx, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L272
	.p2align 4,,10
	.p2align 3
.L289:
	movl	$1, %edx
	movl	$.LC30, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	subl	$1, 12(%rsp)
	subq	$1, %r12
	movl	12(%rsp), %eax
	cmpl	$-1, %eax
	je	.L268
	movq	120(%r13), %rax
	jmp	.L269
	.p2align 4,,10
	.p2align 3
.L286:
	movl	$.LC27, %esi
	movq	%r14, %rdi
	call	_ZNKSs7compareEPKc
	testl	%eax, %eax
	jne	.L287
	movq	0(%r13), %rax
	movq	(%rax,%r15), %rax
	movq	112(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm6
	movsd	%xmm6, (%rsp)
	movapd	%xmm6, %xmm0
	jmp	.L285
	.p2align 4,,10
	.p2align 3
.L277:
	movl	$.LC27, %esi
	movq	%r14, %rdi
	call	_ZNKSs7compareEPKc
	testl	%eax, %eax
	jne	.L287
	movq	0(%r13), %rax
	movq	(%rax,%r15), %rax
	movq	136(%rax), %rax
	movsd	(%rax,%rbx,8), %xmm5
	movsd	%xmm5, (%rsp)
	movapd	%xmm5, %xmm0
	jmp	.L285
	.p2align 4,,10
	.p2align 3
.L287:
	movl	$64, %edx
	movl	$.LC28, %esi
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movsd	(%rsp), %xmm0
	jmp	.L285
.L268:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$2, %edx
	movl	$.LC31, %esi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	movl	$_ZSt4cout, %edi
	jmp	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
.L297:
	.cfi_restore_state
	movl	$_ZZN15MultiGridSolver11displayGridERKmS1_RKSsE19__PRETTY_FUNCTION__, %ecx
	movl	$489, %edx
	movl	$.LC5, %esi
	movl	$.LC14, %edi
	call	__assert_fail
	.cfi_endproc
.LFE5543:
	.size	_ZN15MultiGridSolver11displayGridERKmS1_RKSs, .-_ZN15MultiGridSolver11displayGridERKmS1_RKSs
	.section	.text.unlikely
.LCOLDE32:
	.text
.LHOTE32:
	.section	.text.unlikely
	.align 2
.LCOLDB34:
	.text
.LHOTB34:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver13applyRedSweepERKmRKi
	.type	_ZN15MultiGridSolver13applyRedSweepERKmRKi, @function
_ZN15MultiGridSolver13applyRedSweepERKmRKi:
.LFB5544:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	72(%rdi), %rcx
	subl	(%rsi), %ecx
	movq	(%rdi), %rax
	movslq	%ecx, %rsi
	movq	(%rax,%rsi,8), %r15
	movq	8(%r15), %rax
	movsd	(%r15), %xmm5
	mulsd	%xmm5, %xmm5
	movq	%rax, %rbp
	movq	%rax, 24(%rsp)
	subq	$1, %rbp
	js	.L300
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rbp, %xmm0
.L301:
	movsd	.LC1(%rip), %xmm3
	movsd	.LC2(%rip), %xmm2
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jnb	.L302
	cvttsd2siq	%xmm0, %rax
	movq	%rax, 16(%rsp)
.L303:
	testl	%ecx, %ecx
	js	.L336
	movl	(%rdx), %eax
	testl	%eax, %eax
	jne	.L305
	movq	16(%rsp), %rax
	movq	%rax, %rbp
	movq	%rax, %r8
	addq	$1, %rax
	movq	%rax, 16(%rsp)
.L306:
	cmpq	16(%rsp), %r8
	jnb	.L299
	leaq	1(%r8), %r14
	movsd	.LC33(%rip), %xmm6
	imulq	24(%rsp), %r8
	movapd	%xmm2, %xmm4
	movabsq	$-9223372036854775808, %rbx
	.p2align 4,,10
	.p2align 3
.L327:
	leaq	-1(%r14), %rax
	andl	$1, %eax
	negq	%rax
	addq	$2, %rax
	cmpq	%rax, %rbp
	jbe	.L337
	movq	24(%rsp), %rdi
	movq	%r8, %rdx
	movq	112(%r15), %r13
	movq	16(%r15), %r12
	movq	136(%r15), %rcx
	leaq	-2(%r8), %r9
	subq	%rdi, %rdx
	addq	%r8, %rdi
	movq	%rdi, 8(%rsp)
	leaq	-1(%rdx), %r10
	subq	$1, %rdi
	jmp	.L326
	.p2align 4,,10
	.p2align 3
.L338:
	cvttsd2siq	%xmm0, %rdx
.L313:
	movsd	(%r12,%rdx,8), %xmm0
	leaq	0(,%rdx,8), %rsi
	movq	%r10, %rdx
	addq	%rax, %rdx
	mulsd	%xmm5, %xmm0
	js	.L314
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
.L315:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L316
	cvttsd2siq	%xmm1, %rdx
	addsd	(%rcx,%rdx,8), %xmm0
	movq	%r9, %rdx
	addq	%rax, %rdx
	js	.L318
.L339:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
.L319:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L320
	cvttsd2siq	%xmm1, %rdx
.L321:
	addsd	(%rcx,%rdx,8), %xmm0
	movq	%rdi, %rdx
	addq	%rax, %rdx
	addsd	(%rcx,%rsi), %xmm0
	js	.L322
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rdx, %xmm1
.L323:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L324
	cvttsd2siq	%xmm1, %rdx
.L325:
	addsd	(%rcx,%rdx,8), %xmm0
	addq	$2, %rax
	cmpq	%rax, %rbp
	mulsd	%xmm6, %xmm0
	movsd	%xmm0, 0(%r13,%rsi)
	jbe	.L309
.L326:
	movq	%rax, %rdx
	addq	%r8, %rdx
	js	.L310
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rdx, %xmm0
.L311:
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jb	.L338
	subsd	%xmm4, %xmm0
	cvttsd2siq	%xmm0, %rdx
	xorq	%rbx, %rdx
	jmp	.L313
	.p2align 4,,10
	.p2align 3
.L324:
	subsd	%xmm4, %xmm1
	cvttsd2siq	%xmm1, %rdx
	xorq	%rbx, %rdx
	jmp	.L325
	.p2align 4,,10
	.p2align 3
.L320:
	subsd	%xmm4, %xmm1
	cvttsd2siq	%xmm1, %rdx
	xorq	%rbx, %rdx
	jmp	.L321
	.p2align 4,,10
	.p2align 3
.L316:
	subsd	%xmm4, %xmm1
	cvttsd2siq	%xmm1, %rdx
	xorq	%rbx, %rdx
	addsd	(%rcx,%rdx,8), %xmm0
	movq	%r9, %rdx
	addq	%rax, %rdx
	jns	.L339
.L318:
	movq	%rdx, %r11
	pxor	%xmm1, %xmm1
	shrq	%r11
	andl	$1, %edx
	orq	%rdx, %r11
	cvtsi2sdq	%r11, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L319
	.p2align 4,,10
	.p2align 3
.L314:
	movq	%rdx, %r11
	pxor	%xmm1, %xmm1
	shrq	%r11
	andl	$1, %edx
	orq	%rdx, %r11
	cvtsi2sdq	%r11, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L315
	.p2align 4,,10
	.p2align 3
.L322:
	movq	%rdx, %r11
	pxor	%xmm1, %xmm1
	shrq	%r11
	andl	$1, %edx
	orq	%rdx, %r11
	cvtsi2sdq	%r11, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L323
	.p2align 4,,10
	.p2align 3
.L310:
	movq	%rdx, %rsi
	pxor	%xmm0, %xmm0
	shrq	%rsi
	andl	$1, %edx
	orq	%rdx, %rsi
	cvtsi2sdq	%rsi, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L311
.L337:
	movq	24(%rsp), %rax
	addq	%r8, %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L309:
	cmpq	%r14, 16(%rsp)
	leaq	1(%r14), %rax
	movq	8(%rsp), %r8
	jbe	.L299
	movq	%rax, %r14
	jmp	.L327
.L299:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L305:
	.cfi_restore_state
	cmpl	$1, %eax
	movl	$1, %r8d
	jne	.L306
	movq	16(%rsp), %r8
	movq	%rbp, 16(%rsp)
	addq	$1, %r8
	jmp	.L306
.L302:
	subsd	%xmm2, %xmm0
	cvttsd2siq	%xmm0, %rax
	movq	%rax, %rbx
	movabsq	$-9223372036854775808, %rax
	xorq	%rax, %rbx
	movq	%rbx, 16(%rsp)
	jmp	.L303
.L300:
	movq	%rbp, %rax
	movq	%rbp, %rsi
	pxor	%xmm0, %xmm0
	shrq	%rax
	andl	$1, %esi
	orq	%rsi, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L301
.L336:
	movl	$_ZZN15MultiGridSolver13applyRedSweepERKmRKiE19__PRETTY_FUNCTION__, %ecx
	movl	$573, %edx
	movl	$.LC5, %esi
	movl	$.LC14, %edi
	call	__assert_fail
	.cfi_endproc
.LFE5544:
	.size	_ZN15MultiGridSolver13applyRedSweepERKmRKi, .-_ZN15MultiGridSolver13applyRedSweepERKmRKi
	.section	.text.unlikely
.LCOLDE34:
	.text
.LHOTE34:
	.section	.text.unlikely
	.align 2
.LCOLDB35:
	.text
.LHOTB35:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver15applyBlackSweepERKmRKi
	.type	_ZN15MultiGridSolver15applyBlackSweepERKmRKi, @function
_ZN15MultiGridSolver15applyBlackSweepERKmRKi:
.LFB5545:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	72(%rdi), %rcx
	subl	(%rsi), %ecx
	movq	(%rdi), %rax
	movslq	%ecx, %rsi
	movq	(%rax,%rsi,8), %r15
	movq	8(%r15), %rax
	movsd	(%r15), %xmm5
	mulsd	%xmm5, %xmm5
	movq	%rax, %rbp
	movq	%rax, 8(%rsp)
	subq	$1, %rbp
	js	.L341
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rbp, %xmm0
.L342:
	movsd	.LC1(%rip), %xmm3
	movsd	.LC2(%rip), %xmm2
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jnb	.L343
	cvttsd2siq	%xmm0, %rax
	movq	%rax, (%rsp)
.L344:
	testl	%ecx, %ecx
	js	.L377
	movl	(%rdx), %edx
	testl	%edx, %edx
	jne	.L346
	movq	(%rsp), %rbx
	movq	%rbx, %rbp
	movq	%rbx, %rax
	addq	$1, %rbx
	movq	%rbx, (%rsp)
.L347:
	cmpq	(%rsp), %rax
	jnb	.L340
	leaq	1(%rax), %r14
	movsd	.LC33(%rip), %xmm6
	imulq	8(%rsp), %rax
	movapd	%xmm2, %xmm4
	movabsq	$-9223372036854775808, %rbx
	.p2align 4,,10
	.p2align 3
.L368:
	leaq	-1(%r14), %rdx
	movq	8(%rsp), %rdi
	andl	$1, %edx
	cmpq	$1, %rdx
	sbbq	%rdx, %rdx
	addq	%rax, %rdi
	addq	$2, %rdx
	cmpq	%rdx, %rbp
	jbe	.L350
	movq	8(%rsp), %rdi
	movq	%rax, %r10
	movq	136(%r15), %r13
	movq	40(%r15), %r12
	movq	112(%r15), %rcx
	leaq	-1(%rax), %r9
	leaq	1(%rax), %r8
	subq	%rdi, %r10
	addq	%rax, %rdi
	jmp	.L367
	.p2align 4,,10
	.p2align 3
.L378:
	cvttsd2siq	%xmm0, %rax
.L354:
	movsd	(%r12,%rax,8), %xmm0
	leaq	0(,%rax,8), %rsi
	movq	%rdx, %rax
	addq	%r10, %rax
	mulsd	%xmm5, %xmm0
	js	.L355
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L356:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L357
	cvttsd2siq	%xmm1, %rax
.L358:
	addsd	(%rcx,%rax,8), %xmm0
	movq	%r8, %rax
	addq	%rdx, %rax
	addsd	(%rcx,%rsi), %xmm0
	js	.L359
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L360:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L361
	cvttsd2siq	%xmm1, %rax
	addsd	(%rcx,%rax,8), %xmm0
	movq	%rdx, %rax
	addq	%rdi, %rax
	js	.L363
.L379:
	pxor	%xmm1, %xmm1
	cvtsi2sdq	%rax, %xmm1
.L364:
	mulsd	%xmm3, %xmm1
	ucomisd	%xmm2, %xmm1
	jnb	.L365
	cvttsd2siq	%xmm1, %rax
.L366:
	addsd	(%rcx,%rax,8), %xmm0
	addq	$2, %rdx
	cmpq	%rdx, %rbp
	mulsd	%xmm6, %xmm0
	movsd	%xmm0, 0(%r13,%rsi)
	jbe	.L350
.L367:
	movq	%r9, %rax
	addq	%rdx, %rax
	js	.L351
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
.L352:
	mulsd	%xmm3, %xmm0
	ucomisd	%xmm2, %xmm0
	jb	.L378
	subsd	%xmm4, %xmm0
	cvttsd2siq	%xmm0, %rax
	xorq	%rbx, %rax
	jmp	.L354
	.p2align 4,,10
	.p2align 3
.L365:
	subsd	%xmm4, %xmm1
	cvttsd2siq	%xmm1, %rax
	xorq	%rbx, %rax
	jmp	.L366
	.p2align 4,,10
	.p2align 3
.L361:
	subsd	%xmm4, %xmm1
	cvttsd2siq	%xmm1, %rax
	xorq	%rbx, %rax
	addsd	(%rcx,%rax,8), %xmm0
	movq	%rdx, %rax
	addq	%rdi, %rax
	jns	.L379
.L363:
	movq	%rax, %r11
	pxor	%xmm1, %xmm1
	shrq	%r11
	andl	$1, %eax
	orq	%rax, %r11
	cvtsi2sdq	%r11, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L364
	.p2align 4,,10
	.p2align 3
.L357:
	subsd	%xmm4, %xmm1
	cvttsd2siq	%xmm1, %rax
	xorq	%rbx, %rax
	jmp	.L358
	.p2align 4,,10
	.p2align 3
.L359:
	movq	%rax, %r11
	pxor	%xmm1, %xmm1
	shrq	%r11
	andl	$1, %eax
	orq	%rax, %r11
	cvtsi2sdq	%r11, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L360
	.p2align 4,,10
	.p2align 3
.L355:
	movq	%rax, %r11
	pxor	%xmm1, %xmm1
	shrq	%r11
	andl	$1, %eax
	orq	%rax, %r11
	cvtsi2sdq	%r11, %xmm1
	addsd	%xmm1, %xmm1
	jmp	.L356
	.p2align 4,,10
	.p2align 3
.L351:
	movq	%rax, %rsi
	pxor	%xmm0, %xmm0
	shrq	%rsi
	andl	$1, %eax
	orq	%rax, %rsi
	cvtsi2sdq	%rsi, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L352
	.p2align 4,,10
	.p2align 3
.L350:
	cmpq	%r14, (%rsp)
	leaq	1(%r14), %rdx
	movq	%rdi, %rax
	jbe	.L340
	movq	%rdx, %r14
	jmp	.L368
.L340:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L346:
	.cfi_restore_state
	cmpl	$1, %edx
	movl	$1, %eax
	jne	.L347
	movq	(%rsp), %rax
	movq	%rbp, (%rsp)
	addq	$1, %rax
	jmp	.L347
.L343:
	subsd	%xmm2, %xmm0
	cvttsd2siq	%xmm0, %rax
	movq	%rax, %rbx
	movabsq	$-9223372036854775808, %rax
	xorq	%rax, %rbx
	movq	%rbx, (%rsp)
	jmp	.L344
.L341:
	movq	%rbp, %rax
	movq	%rbp, %rsi
	pxor	%xmm0, %xmm0
	shrq	%rax
	andl	$1, %esi
	orq	%rsi, %rax
	cvtsi2sdq	%rax, %xmm0
	addsd	%xmm0, %xmm0
	jmp	.L342
.L377:
	movl	$_ZZN15MultiGridSolver15applyBlackSweepERKmRKiE19__PRETTY_FUNCTION__, %ecx
	movl	$629, %edx
	movl	$.LC5, %esi
	movl	$.LC14, %edi
	call	__assert_fail
	.cfi_endproc
.LFE5545:
	.size	_ZN15MultiGridSolver15applyBlackSweepERKmRKi, .-_ZN15MultiGridSolver15applyBlackSweepERKmRKi
	.section	.text.unlikely
.LCOLDE35:
	.text
.LHOTE35:
	.section	.rodata.str1.8
	.align 8
.LC36:
	.string	"Wall clock time of applyRBGS_Iter() in "
	.section	.text.unlikely
	.align 2
.LCOLDB37:
	.text
.LHOTB37:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver14applyRBGS_IterERKm
	.type	_ZN15MultiGridSolver14applyRBGS_IterERKm, @function
_ZN15MultiGridSolver14applyRBGS_IterERKm:
.LFB5546:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	xorl	%esi, %esi
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rsp, %rdi
	call	gettimeofday
	leaq	16(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	$-1, 16(%rsp)
	call	_ZN15MultiGridSolver13applyRedSweepERKmRKi
	leaq	16(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	$0, 16(%rsp)
	call	_ZN15MultiGridSolver13applyRedSweepERKmRKi
	leaq	16(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	$1, 16(%rsp)
	call	_ZN15MultiGridSolver13applyRedSweepERKmRKi
	leaq	16(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	$-1, 16(%rsp)
	call	_ZN15MultiGridSolver15applyBlackSweepERKmRKi
	leaq	16(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	$0, 16(%rsp)
	call	_ZN15MultiGridSolver15applyBlackSweepERKmRKi
	leaq	16(%rsp), %rdx
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movl	$1, 16(%rsp)
	call	_ZN15MultiGridSolver15applyBlackSweepERKmRKi
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	72(%rbx), %rax
	cmpq	%rax, 0(%rbp)
	movq	16(%rsp), %r13
	movq	(%rsp), %r15
	movq	24(%rsp), %r12
	movq	8(%rsp), %r14
	je	.L383
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L383:
	.cfi_restore_state
	subq	%r15, %r13
	movl	$39, %edx
	movl	$.LC36, %esi
	imulq	$1000000, %r13, %r13
	movl	$_ZSt4cout, %edi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	pxor	%xmm0, %xmm0
	movl	$_ZSt4cout, %edi
	addq	%r13, %r12
	subq	%r14, %r12
	cvtsi2sdq	%r12, %xmm0
	mulsd	.LC8(%rip), %xmm0
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$9, %edx
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5546:
	.size	_ZN15MultiGridSolver14applyRBGS_IterERKm, .-_ZN15MultiGridSolver14applyRBGS_IterERKm
	.section	.text.unlikely
.LCOLDE37:
	.text
.LHOTE37:
	.section	.text.unlikely
	.align 2
.LCOLDB38:
	.text
.LHOTB38:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver17applyPreSmoothingERKm
	.type	_ZN15MultiGridSolver17applyPreSmoothingERKm, @function
_ZN15MultiGridSolver17applyPreSmoothingERKm:
.LFB5533:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	cmpq	$0, 88(%rdi)
	movq	%rdi, %rbp
	je	.L384
	.p2align 4,,10
	.p2align 3
.L388:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	_ZN15MultiGridSolver14applyRBGS_IterERKm
	cmpq	%rbx, 88(%rbp)
	ja	.L388
.L384:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5533:
	.size	_ZN15MultiGridSolver17applyPreSmoothingERKm, .-_ZN15MultiGridSolver17applyPreSmoothingERKm
	.section	.text.unlikely
.LCOLDE38:
	.text
.LHOTE38:
	.section	.text.unlikely
	.align 2
.LCOLDB39:
	.text
.LHOTB39:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver18applyPostSmoothingERKm
	.type	_ZN15MultiGridSolver18applyPostSmoothingERKm, @function
_ZN15MultiGridSolver18applyPostSmoothingERKm:
.LFB5534:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	xorl	%ebx, %ebx
	cmpq	$0, 96(%rdi)
	movq	%rdi, %rbp
	je	.L391
	.p2align 4,,10
	.p2align 3
.L395:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	addq	$1, %rbx
	call	_ZN15MultiGridSolver14applyRBGS_IterERKm
	cmpq	%rbx, 96(%rbp)
	ja	.L395
.L391:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5534:
	.size	_ZN15MultiGridSolver18applyPostSmoothingERKm, .-_ZN15MultiGridSolver18applyPostSmoothingERKm
	.section	.text.unlikely
.LCOLDE39:
	.text
.LHOTE39:
	.section	.rodata.str1.8
	.align 8
.LC40:
	.string	"level >0 && level <= numLevel_"
	.section	.text.unlikely
	.align 2
.LCOLDB41:
	.text
.LHOTB41:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver8mgmSolveERKm
	.type	_ZN15MultiGridSolver8mgmSolveERKm, @function
_ZN15MultiGridSolver8mgmSolveERKm:
.LFB5542:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %r12
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$16, %rsp
	.cfi_def_cfa_offset 48
	movq	(%rsi), %rax
	testq	%rax, %rax
	je	.L399
	cmpq	72(%rdi), %rax
	movq	%rdi, %rbx
	ja	.L399
	xorl	%ebp, %ebp
	cmpq	$0, 88(%rdi)
	je	.L403
	.p2align 4,,10
	.p2align 3
.L414:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	addq	$1, %rbp
	call	_ZN15MultiGridSolver14applyRBGS_IterERKm
	cmpq	88(%rbx), %rbp
	jb	.L414
.L403:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	_ZN15MultiGridSolver15computeResidualERKm
	cmpq	$1, (%r12)
	je	.L402
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	_ZN15MultiGridSolver16applyRestrictionERKm
	movq	(%r12), %rax
	cmpq	$1, %rax
	je	.L402
	leaq	8(%rsp), %rsi
	subq	$1, %rax
	movq	%rbx, %rdi
	movq	%rax, 8(%rsp)
	call	_ZN15MultiGridSolver8mgmSolveERKm
	movq	(%r12), %rax
	leaq	8(%rsp), %rsi
	movq	%rbx, %rdi
	subq	$1, %rax
	movq	%rax, 8(%rsp)
	call	_ZN15MultiGridSolver18applyInterpolationERKm
.L404:
	xorl	%ebp, %ebp
	cmpq	$0, 96(%rbx)
	je	.L398
	.p2align 4,,10
	.p2align 3
.L413:
	movq	%r12, %rsi
	movq	%rbx, %rdi
	addq	$1, %rbp
	call	_ZN15MultiGridSolver14applyRBGS_IterERKm
	cmpq	96(%rbx), %rbp
	jb	.L413
.L398:
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L402:
	.cfi_restore_state
	movq	%r12, %rsi
	movq	%rbx, %rdi
	call	_ZN15MultiGridSolver14applyRBGS_IterERKm
	jmp	.L404
.L399:
	movl	$_ZZN15MultiGridSolver8mgmSolveERKmE19__PRETTY_FUNCTION__, %ecx
	movl	$453, %edx
	movl	$.LC5, %esi
	movl	$.LC40, %edi
	call	__assert_fail
	.cfi_endproc
.LFE5542:
	.size	_ZN15MultiGridSolver8mgmSolveERKm, .-_ZN15MultiGridSolver8mgmSolveERKm
	.section	.text.unlikely
.LCOLDE41:
	.text
.LHOTE41:
	.section	.rodata.str1.8
	.align 8
.LC42:
	.string	"Wall clock time of MGMSolve() in "
	.section	.text.unlikely
	.align 2
.LCOLDB43:
	.text
.LHOTB43:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolver15computeSolutionEv
	.type	_ZN15MultiGridSolver15computeSolutionEv, @function
_ZN15MultiGridSolver15computeSolutionEv:
.LFB5529:
	.cfi_startproc
	cmpq	$1, 72(%rdi)
	je	.L437
	cmpq	$0, 80(%rdi)
	je	.L437
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	72(%rdi), %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%r14d, %r14d
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L425:
	leaq	16(%rsp), %rdi
	xorl	%esi, %esi
	call	gettimeofday
	movq	8(%rsp), %rsi
	movq	%r13, %rdi
	call	_ZN15MultiGridSolver8mgmSolveERKm
	movq	72(%r13), %rbp
	cmpq	$1, %rbp
	jbe	.L432
	movq	0(%r13), %r12
	movl	$1, %ebx
	.p2align 4,,10
	.p2align 3
.L431:
	movq	(%r12,%rbx,8), %r15
	movq	120(%r15), %rax
	movq	112(%r15), %rdi
	cmpq	%rdi, %rax
	je	.L430
	leaq	8(%rdi), %rdx
	xorl	%esi, %esi
	subq	%rdx, %rax
	shrq	$3, %rax
	leaq	8(,%rax,8), %rdx
	call	memset
.L430:
	movq	144(%r15), %rax
	movq	136(%r15), %rdi
	cmpq	%rdi, %rax
	je	.L429
	leaq	8(%rdi), %rdx
	xorl	%esi, %esi
	subq	%rdx, %rax
	shrq	$3, %rax
	leaq	8(,%rax,8), %rdx
	call	memset
.L429:
	addq	$1, %rbx
	cmpq	%rbp, %rbx
	jne	.L431
.L432:
	leaq	32(%rsp), %rdi
	xorl	%esi, %esi
	addq	$1, %r14
	call	gettimeofday
	movq	32(%rsp), %rax
	subq	16(%rsp), %rax
	movl	$33, %edx
	pxor	%xmm0, %xmm0
	movl	$.LC42, %esi
	movl	$_ZSt4cout, %edi
	imulq	$1000000, %rax, %rax
	addq	40(%rsp), %rax
	subq	24(%rsp), %rax
	cvtsi2sdq	%rax, %xmm0
	mulsd	.LC8(%rip), %xmm0
	movsd	%xmm0, (%rsp)
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movsd	(%rsp), %xmm0
	movl	$_ZSt4cout, %edi
	call	_ZNSo9_M_insertIdEERSoT_
	movl	$9, %edx
	movl	$.LC9, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	addq	$1, 104(%r13)
	cmpq	%r14, 80(%r13)
	ja	.L425
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
.L437:
	rep ret
	.cfi_endproc
.LFE5529:
	.size	_ZN15MultiGridSolver15computeSolutionEv, .-_ZN15MultiGridSolver15computeSolutionEv
	.section	.text.unlikely
.LCOLDE43:
	.text
.LHOTE43:
	.section	.text.unlikely._ZNSt6vectorIdSaIdEEaSERKS1_,"axG",@progbits,_ZNSt6vectorIdSaIdEEaSERKS1_,comdat
	.align 2
.LCOLDB44:
	.section	.text._ZNSt6vectorIdSaIdEEaSERKS1_,"axG",@progbits,_ZNSt6vectorIdSaIdEEaSERKS1_,comdat
.LHOTB44:
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIdSaIdEEaSERKS1_
	.type	_ZNSt6vectorIdSaIdEEaSERKS1_, @function
_ZNSt6vectorIdSaIdEEaSERKS1_:
.LFB5624:
	.cfi_startproc
	cmpq	%rdi, %rsi
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	je	.L440
	movq	8(%rsi), %r13
	movq	(%rsi), %rbx
	movq	(%rdi), %rdi
	movq	16(%rbp), %rdx
	movq	%r13, %r12
	subq	%rbx, %r12
	subq	%rdi, %rdx
	movq	%r12, %rax
	sarq	$3, %rdx
	sarq	$3, %rax
	cmpq	%rdx, %rax
	ja	.L472
	movq	8(%rbp), %rcx
	movq	%rcx, %rdx
	subq	%rdi, %rdx
	movq	%rdx, %r8
	sarq	$3, %r8
	cmpq	%r8, %rax
	jbe	.L473
	testq	%r8, %r8
	movq	%rbx, %rsi
	jne	.L474
.L454:
	addq	%rdx, %rsi
	cmpq	%r13, %rsi
	je	.L471
	.p2align 4,,10
	.p2align 3
.L464:
	testq	%rcx, %rcx
	movsd	(%rsi), %xmm0
	je	.L456
	movsd	%xmm0, (%rcx)
.L456:
	addq	$8, %rsi
	addq	$8, %rcx
	cmpq	%rsi, %r13
	jne	.L464
	jmp	.L471
	.p2align 4,,10
	.p2align 3
.L473:
	testq	%rax, %rax
	jne	.L475
.L471:
	addq	%rdi, %r12
.L451:
	movq	%r12, 8(%rbp)
.L440:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movq	%rbp, %rax
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L472:
	.cfi_restore_state
	xorl	%r14d, %r14d
	testq	%rax, %rax
	je	.L443
	movabsq	$2305843009213693951, %rdx
	cmpq	%rdx, %rax
	ja	.L476
	movq	%r12, %rdi
	call	_Znwm
	movq	0(%rbp), %rdi
	movq	%rax, %r14
.L443:
	cmpq	%r13, %rbx
	movq	%rbx, %rsi
	movq	%r14, %rcx
	je	.L450
	.p2align 4,,10
	.p2align 3
.L463:
	testq	%rcx, %rcx
	movsd	(%rsi), %xmm0
	je	.L448
	movsd	%xmm0, (%rcx)
.L448:
	addq	$8, %rsi
	addq	$8, %rcx
	cmpq	%rsi, %r13
	jne	.L463
.L450:
	testq	%rdi, %rdi
	je	.L447
	call	_ZdlPv
.L447:
	addq	%r14, %r12
	movq	%r14, 0(%rbp)
	movq	%r12, 16(%rbp)
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L475:
	movq	%r12, %rdx
	movq	%rbx, %rsi
	call	memmove
	addq	0(%rbp), %r12
	jmp	.L451
	.p2align 4,,10
	.p2align 3
.L474:
	call	memmove
	movq	8(%rbp), %rcx
	movq	0(%rbp), %rdi
	movq	8(%r14), %r13
	movq	(%r14), %rsi
	movq	%rcx, %rdx
	subq	%rdi, %rdx
	jmp	.L454
.L476:
	call	_ZSt17__throw_bad_allocv
	.cfi_endproc
.LFE5624:
	.size	_ZNSt6vectorIdSaIdEEaSERKS1_, .-_ZNSt6vectorIdSaIdEEaSERKS1_
	.section	.text.unlikely._ZNSt6vectorIdSaIdEEaSERKS1_,"axG",@progbits,_ZNSt6vectorIdSaIdEEaSERKS1_,comdat
.LCOLDE44:
	.section	.text._ZNSt6vectorIdSaIdEEaSERKS1_,"axG",@progbits,_ZNSt6vectorIdSaIdEEaSERKS1_,comdat
.LHOTE44:
	.section	.text.unlikely._ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_,"axG",@progbits,_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_,comdat
	.align 2
.LCOLDB45:
	.section	.text._ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_,"axG",@progbits,_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_,comdat
.LHOTB45:
	.align 2
	.p2align 4,,15
	.weak	_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_
	.type	_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_, @function
_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_:
.LFB5714:
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
	movq	%rdi, %rbp
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	8(%rdi), %rdx
	movq	(%rdi), %r9
	movq	%rdx, %rax
	subq	%r9, %rax
	movq	%rax, %rbx
	sarq	$3, %rbx
	testq	%rbx, %rbx
	je	.L485
	leaq	(%rbx,%rbx), %rcx
	cmpq	%rcx, %rbx
	jbe	.L498
.L487:
	movq	$-8, %rbx
.L478:
	movq	%rbx, %rdi
	movq	%rsi, 8(%rsp)
	call	_Znwm
	movq	8(%rbp), %rdx
	movq	0(%rbp), %r9
	movq	%rax, %r12
	movq	8(%rsp), %rsi
	leaq	8(%r12), %r13
	movq	%rdx, %rax
	subq	%r9, %rax
.L479:
	addq	%r12, %rax
	movq	(%rsi), %rcx
	je	.L489
	movq	%rcx, (%rax)
	movq	8(%rbp), %rsi
	movq	0(%rbp), %rdi
.L480:
	cmpq	%rdi, %rsi
	je	.L481
	movq	%rdi, %rdx
	movq	%r12, %rcx
	.p2align 4,,10
	.p2align 3
.L483:
	testq	%rcx, %rcx
	movq	(%rdx), %r8
	je	.L482
	movq	%r8, (%rcx)
.L482:
	addq	$8, %rdx
	addq	$8, %rcx
	cmpq	%rdx, %rsi
	jne	.L483
	leaq	8(%rdi), %r9
	movq	0(%rbp), %rdi
	subq	%r9, %rsi
	andq	$-8, %rsi
	leaq	16(%rsi,%r12), %r13
.L481:
	testq	%rdi, %rdi
	je	.L484
	call	_ZdlPv
.L484:
	addq	%r12, %rbx
	movq	%r12, 0(%rbp)
	movq	%r13, 8(%rbp)
	movq	%rbx, 16(%rbp)
	addq	$24, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L485:
	.cfi_restore_state
	movl	$8, %ebx
	jmp	.L478
	.p2align 4,,10
	.p2align 3
.L489:
	movq	%r9, %rdi
	movq	%rdx, %rsi
	jmp	.L480
.L498:
	movabsq	$2305843009213693951, %rdi
	cmpq	%rdi, %rcx
	ja	.L487
	salq	$4, %rbx
	testq	%rcx, %rcx
	jne	.L478
	movl	$8, %r13d
	xorl	%r12d, %r12d
	jmp	.L479
	.cfi_endproc
.LFE5714:
	.size	_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_, .-_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_
	.section	.text.unlikely._ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_,"axG",@progbits,_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_,comdat
.LCOLDE45:
	.section	.text._ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_,"axG",@progbits,_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_,comdat
.LHOTE45:
	.weak	_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIJRKS1_EEEvDpOT_
	.set	_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIJRKS1_EEEvDpOT_,_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_
	.section	.text.unlikely
	.align 2
.LCOLDB52:
	.text
.LHOTB52:
	.align 2
	.p2align 4,,15
	.globl	_ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_
	.type	_ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_, @function
_ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_:
.LFB5527:
	.cfi_startproc
	.cfi_personality 0x3,__gxx_personality_v0
	.cfi_lsda 0x3,.LLSDA5527
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%r8, %rbp
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	movq	(%rsi), %rax
	movq	$0, (%rdi)
	movsd	.LC46(%rip), %xmm0
	movq	$0, 8(%rdi)
	movq	$0, 16(%rdi)
	movq	$0, 24(%rdi)
	movq	%rax, 72(%rdi)
	movq	(%rdx), %rdx
	testq	%rax, %rax
	movq	$0, 32(%rdi)
	movq	$0, 40(%rdi)
	movsd	%xmm0, 112(%rdi)
	movq	$0, 48(%rdi)
	movq	$0, 56(%rdi)
	movq	$0, 64(%rdi)
	movq	%rdx, 80(%rdi)
	movq	$1, 88(%rdi)
	movq	$1, 96(%rdi)
	movq	$1, 104(%rdi)
	movq	%rax, 16(%rsp)
	jne	.L521
	jmp	.L510
	.p2align 4,,10
	.p2align 3
.L531:
	testq	%rdx, %rdx
	je	.L502
	movq	%r13, (%rdx)
	movq	8(%rbx), %rdx
.L502:
	addq	$8, %rdx
	subq	$1, 16(%rsp)
	movq	%rdx, 8(%rbx)
	je	.L530
.L521:
	movl	$160, %edi
.LEHB0:
	call	_Znwm
.LEHE0:
	leaq	16(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, %r13
.LEHB1:
	call	_ZN4GridC1ERKm
.LEHE1:
	movq	8(%rbx), %rdx
	cmpq	16(%rbx), %rdx
	movq	%r13, 24(%rsp)
	jne	.L531
	leaq	24(%rsp), %rsi
	movq	%rbx, %rdi
.LEHB2:
	call	_ZNSt6vectorIP4GridSaIS1_EE19_M_emplace_back_auxIIRKS1_EEEvDpOT_
	subq	$1, 16(%rsp)
	jne	.L521
	.p2align 4,,10
	.p2align 3
.L530:
	movq	(%rbx), %rax
.L500:
	movq	(%rax), %rdi
	movq	%r12, %rsi
	addq	$112, %rdi
	call	_ZNSt6vectorIdSaIdEEaSERKS1_
	movq	(%rbx), %rax
	movq	%rbp, %rsi
	movq	(%rax), %rdi
	addq	$136, %rdi
	call	_ZNSt6vectorIdSaIdEEaSERKS1_
	movsd	.LC48(%rip), %xmm2
	leaq	136(%rbx), %rdi
	movsd	.LC47(%rip), %xmm1
	leaq	24(%rsp), %r8
	movsd	.LC33(%rip), %xmm4
	leaq	16(%rsp), %rcx
	leaq	8(%rsp), %rdx
	movq	%rsp, %rsi
	movsd	%xmm1, 24(%rsp)
	movsd	%xmm2, 16(%rsp)
	movsd	%xmm2, 8(%rsp)
	movsd	%xmm4, (%rsp)
	call	_ZN7Stencil16setStencilParamsERKdS1_S1_S1_
	movsd	.LC50(%rip), %xmm5
	leaq	208(%rbx), %rdi
	movsd	.LC51(%rip), %xmm7
	leaq	24(%rsp), %r8
	leaq	16(%rsp), %rcx
	leaq	8(%rsp), %rdx
	movq	%rsp, %rsi
	movq	$0, 24(%rsp)
	movsd	%xmm5, 16(%rsp)
	movsd	%xmm5, 8(%rsp)
	movsd	%xmm7, (%rsp)
	call	_ZN7Stencil16setStencilParamsERKdS1_S1_S1_
	movsd	.LC1(%rip), %xmm1
	leaq	280(%rbx), %rdi
	movsd	.LC33(%rip), %xmm0
	leaq	24(%rsp), %r8
	movsd	.LC15(%rip), %xmm3
	leaq	16(%rsp), %rcx
	leaq	8(%rsp), %rdx
	movq	%rsp, %rsi
	movsd	%xmm0, 24(%rsp)
	movsd	%xmm1, 16(%rsp)
	movsd	%xmm1, 8(%rsp)
	movsd	%xmm3, (%rsp)
	call	_ZN7Stencil16setStencilParamsERKdS1_S1_S1_
.LEHE2:
	addq	$40, %rsp
	.cfi_remember_state
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
.L510:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L500
.L511:
	movq	%r13, %rdi
	movq	%rax, %rbp
	call	_ZdlPv
.L506:
	movq	48(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L507
	call	_ZdlPv
.L507:
	movq	24(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L508
	call	_ZdlPv
.L508:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L509
	call	_ZdlPv
.L509:
	movq	%rbp, %rdi
.LEHB3:
	call	_Unwind_Resume
.LEHE3:
.L512:
	movq	%rax, %rbp
	jmp	.L506
	.cfi_endproc
.LFE5527:
	.globl	__gxx_personality_v0
	.section	.gcc_except_table,"a",@progbits
.LLSDA5527:
	.byte	0xff
	.byte	0xff
	.byte	0x1
	.uleb128 .LLSDACSE5527-.LLSDACSB5527
.LLSDACSB5527:
	.uleb128 .LEHB0-.LFB5527
	.uleb128 .LEHE0-.LEHB0
	.uleb128 .L512-.LFB5527
	.uleb128 0
	.uleb128 .LEHB1-.LFB5527
	.uleb128 .LEHE1-.LEHB1
	.uleb128 .L511-.LFB5527
	.uleb128 0
	.uleb128 .LEHB2-.LFB5527
	.uleb128 .LEHE2-.LEHB2
	.uleb128 .L512-.LFB5527
	.uleb128 0
	.uleb128 .LEHB3-.LFB5527
	.uleb128 .LEHE3-.LEHB3
	.uleb128 0
	.uleb128 0
.LLSDACSE5527:
	.text
	.size	_ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_, .-_ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_
	.section	.text.unlikely
.LCOLDE52:
	.text
.LHOTE52:
	.globl	_ZN15MultiGridSolverC1ERKmS1_RKSt6vectorIdSaIdEES6_
	.set	_ZN15MultiGridSolverC1ERKmS1_RKSt6vectorIdSaIdEES6_,_ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_
	.section	.text.unlikely
.LCOLDB53:
	.section	.text.startup,"ax",@progbits
.LHOTB53:
	.p2align 4,,15
	.type	_GLOBAL__sub_I__ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_, @function
_GLOBAL__sub_I__ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_:
.LFB5920:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit
	.cfi_endproc
.LFE5920:
	.size	_GLOBAL__sub_I__ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_, .-_GLOBAL__sub_I__ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_
	.section	.text.unlikely
.LCOLDE53:
	.section	.text.startup
.LHOTE53:
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__ZN15MultiGridSolverC2ERKmS1_RKSt6vectorIdSaIdEES6_
	.section	.rodata
	.align 64
	.type	_ZZN15MultiGridSolver15applyBlackSweepERKmRKiE19__PRETTY_FUNCTION__, @object
	.size	_ZZN15MultiGridSolver15applyBlackSweepERKmRKiE19__PRETTY_FUNCTION__, 65
_ZZN15MultiGridSolver15applyBlackSweepERKmRKiE19__PRETTY_FUNCTION__:
	.string	"void MultiGridSolver::applyBlackSweep(const size_t&, const int&)"
	.align 32
	.type	_ZZN15MultiGridSolver13applyRedSweepERKmRKiE19__PRETTY_FUNCTION__, @object
	.size	_ZZN15MultiGridSolver13applyRedSweepERKmRKiE19__PRETTY_FUNCTION__, 63
_ZZN15MultiGridSolver13applyRedSweepERKmRKiE19__PRETTY_FUNCTION__:
	.string	"void MultiGridSolver::applyRedSweep(const size_t&, const int&)"
	.align 64
	.type	_ZZN15MultiGridSolver11displayGridERKmS1_RKSsE19__PRETTY_FUNCTION__, @object
	.size	_ZZN15MultiGridSolver11displayGridERKmS1_RKSsE19__PRETTY_FUNCTION__, 79
_ZZN15MultiGridSolver11displayGridERKmS1_RKSsE19__PRETTY_FUNCTION__:
	.string	"void MultiGridSolver::displayGrid(const size_t&, const size_t&, const string&)"
	.align 32
	.type	_ZZN15MultiGridSolver8mgmSolveERKmE19__PRETTY_FUNCTION__, @object
	.size	_ZZN15MultiGridSolver8mgmSolveERKmE19__PRETTY_FUNCTION__, 46
_ZZN15MultiGridSolver8mgmSolveERKmE19__PRETTY_FUNCTION__:
	.string	"void MultiGridSolver::mgmSolve(const size_t&)"
	.align 32
	.type	_ZZN15MultiGridSolver15computeResidualERKmE19__PRETTY_FUNCTION__, @object
	.size	_ZZN15MultiGridSolver15computeResidualERKmE19__PRETTY_FUNCTION__, 53
_ZZN15MultiGridSolver15computeResidualERKmE19__PRETTY_FUNCTION__:
	.string	"void MultiGridSolver::computeResidual(const size_t&)"
	.align 32
	.type	_ZZN15MultiGridSolver18applyInterpolationERKmE19__PRETTY_FUNCTION__, @object
	.size	_ZZN15MultiGridSolver18applyInterpolationERKmE19__PRETTY_FUNCTION__, 56
_ZZN15MultiGridSolver18applyInterpolationERKmE19__PRETTY_FUNCTION__:
	.string	"void MultiGridSolver::applyInterpolation(const size_t&)"
	.align 32
	.type	_ZZN15MultiGridSolver16applyRestrictionERKmE19__PRETTY_FUNCTION__, @object
	.size	_ZZN15MultiGridSolver16applyRestrictionERKmE19__PRETTY_FUNCTION__, 54
_ZZN15MultiGridSolver16applyRestrictionERKmE19__PRETTY_FUNCTION__:
	.string	"void MultiGridSolver::applyRestriction(const size_t&)"
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC2:
	.long	0
	.long	1138753536
	.align 8
.LC8:
	.long	3539053052
	.long	1062232653
	.align 8
.LC15:
	.long	0
	.long	1072693248
	.align 8
.LC33:
	.long	0
	.long	1070596096
	.align 8
.LC46:
	.long	4256704291
	.long	1058541719
	.align 8
.LC47:
	.long	0
	.long	1068498944
	.align 8
.LC48:
	.long	0
	.long	1069547520
	.align 8
.LC50:
	.long	0
	.long	-1074790400
	.align 8
.LC51:
	.long	0
	.long	1074790400
	.hidden	__dso_handle
	.ident	"GCC: (Debian 4.9.2-10) 4.9.2"
	.section	.note.GNU-stack,"",@progbits
