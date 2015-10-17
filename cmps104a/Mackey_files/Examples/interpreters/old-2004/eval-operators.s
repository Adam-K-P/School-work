	.file	"eval-operators.c"
! GNU C version 2.95.2 19991024 (release) (sparc-sun-solaris2.6) compiled by GNU C version 2.95.2 19991024 (release).
! options passed:  -mcpu=v9 -O3 -fverbose-asm
! options enabled:  -fdefer-pop -fomit-frame-pointer -fcse-follow-jumps
! -fcse-skip-blocks -fexpensive-optimizations -fthread-jumps
! -fstrength-reduce -fpeephole -fforce-mem -ffunction-cse
! -finline-functions -finline -fkeep-static-consts -fcaller-saves
! -fpcc-struct-return -fdelayed-branch -fgcse -frerun-cse-after-loop
! -frerun-loop-opt -fschedule-insns -fschedule-insns2 -fsched-interblock
! -fsched-spec -fcommon -fverbose-asm -fgnu-linker -fregmove
! -foptimize-register-move -fargument-alias -fident -mepilogue -mapp-regs
! -mv8plus -mcpu=v9

gcc2_compiled.:
.section	".text"
	.align 4
	.global eval
	.type	 eval,#function
	.proc	04
eval:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	cmp	%o0, 18
	bgu,pn	%icc, .LL3
	nop
	sethi	%hi(.LL23), %g2
	sll	%o0, 2, %o0
	or	%g2, %lo(.LL23), %g2
	ld	[%g2+%o0], %g3
	jmp	%g3
	 nop
.LL4:
	ba,pt	%xcc, .LL3
	add	%o1, %o2, %g2
.LL5:
	ba,pt	%xcc, .LL3
	sub	%o1, %o2, %g2
.LL6:
	ba,pt	%xcc, .LL3
	smul	%o1, %o2, %g2
.LL7:
	sra	%o1, 31, %g3
	wr	%g0, %g3, %y
	sdiv	%o1, %o2, %g2
	ba,pt	%xcc, .LL3
	 nop
.LL8:
	sra	%o1, 31, %g3
	wr	%g0, %g3, %y
	sdiv	%o1, %o2, %g2
	smul	%g2, %o2, %g2
	ba,pt	%xcc, .LL3
	sub	%o1, %g2, %g2
.LL9:
	ba,pt	%xcc, .LL3
	and	%o1, %o2, %g2
.LL10:
	ba,pt	%xcc, .LL3
	or	%o1, %o2, %g2
.LL11:
	ba,pt	%xcc, .LL3
	xor	%o1, %o2, %g2
.LL12:
	ba,pt	%xcc, .LL3
	sll	%o1, %o2, %g2
.LL13:
	ba,pt	%xcc, .LL3
	srl	%o1, %o2, %g2
.LL14:
	ba,pt	%xcc, .LL3
	sra	%o1, %o2, %g2
.LL15:
	ba,pt	%xcc, .LL3
	sub	%g0, %o2, %g2
.LL16:
	ba,pt	%xcc, .LL3
	xnor	%g0, %o2, %g2
.LL17:
	xor	%o1, %o2, %g2
	subcc	%g0, %g2, %g0
	ba,pt	%xcc, .LL3
	subx	%g0, -1, %g2
.LL18:
	xor	%o1, %o2, %g2
	subcc	%g0, %g2, %g0
	ba,pt	%xcc, .LL3
	addx	%g0, 0, %g2
.LL19:
	cmp	%o1, %o2
	mov	0, %g2
	ba,pt	%xcc, .LL3
	movl	%icc, 1, %g2
.LL20:
	cmp	%o1, %o2
	mov	0, %g2
	ba,pt	%xcc, .LL3
	movle	%icc, 1, %g2
.LL21:
	cmp	%o1, %o2
	mov	0, %g2
	ba,pt	%xcc, .LL3
	movg	%icc, 1, %g2
.LL22:
	cmp	%o1, %o2
	mov	0, %g2
	movge	%icc, 1, %g2
.LL3:
	retl
	mov	%g2, %o0
	.align 4
	.align 4
.LL23:
	.word	.LL4
	.word	.LL5
	.word	.LL6
	.word	.LL7
	.word	.LL8
	.word	.LL9
	.word	.LL10
	.word	.LL11
	.word	.LL12
	.word	.LL13
	.word	.LL14
	.word	.LL15
	.word	.LL16
	.word	.LL17
	.word	.LL18
	.word	.LL19
	.word	.LL20
	.word	.LL21
	.word	.LL22
.LLfe1:
	.size	 eval,.LLfe1-eval
	.ident	"GCC: (GNU) 2.95.2 19991024 (release)"
