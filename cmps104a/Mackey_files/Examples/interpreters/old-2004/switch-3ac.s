	.file	"switch-3ac.c"
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
	.global interp
	.type	 interp,#function
	.proc	020
interp:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
.LL3:
	lduh	[%o1], %g1
.LL53:
	srl	%g1, 6, %g2
	and	%g2, 7, %o0
	cmp	%o0, 7
	bgu,pn	%icc, .LL6
	add	%o1, 2, %o1
	sethi	%hi(.LL15), %g2
	sll	%o0, 2, %o0
	or	%g2, %lo(.LL15), %g2
	ld	[%g2+%o0], %g3
	jmp	%g3
	 nop
.LL7:
	ba,pt	%xcc, .LL6
	mov	0, %o2
.LL8:
	ldsh	[%o1], %o2
	ba,pt	%xcc, .LL6
	add	%o1, 2, %o1
.LL9:
	ldsh	[%o1], %g2
	sll	%g2, 2, %g2
	add	%o1, 2, %o1
	ba,pt	%xcc, .LL6
	ld	[%o4+%g2], %o2
.LL10:
	ldsh	[%o1], %g2
	ldsh	[%o1+2], %g3
	sll	%g2, 2, %g2
	sll	%g3, 2, %g3
	ld	[%o4+%g2], %o0
	add	%o1, 4, %o1
	ld	[%o0+%g3], %o2
.LL6:
	sll	%g1, 16, %g2
	mov	%g2, %o5
	srl	%g2, 19, %g2
	and	%g2, 7, %o0
	cmp	%o0, 7
	bgu,pn	%icc, .LL17
	sethi	%hi(.LL26), %g2
	sll	%o0, 2, %o0
	or	%g2, %lo(.LL26), %g2
	ld	[%g2+%o0], %g3
	jmp	%g3
	 nop
.LL18:
	ba,pt	%xcc, .LL17
	mov	0, %o3
.LL19:
	ldsh	[%o1], %o3
	ba,pt	%xcc, .LL17
	add	%o1, 2, %o1
.LL20:
	ldsh	[%o1], %g2
	sll	%g2, 2, %g2
	add	%o1, 2, %o1
	ba,pt	%xcc, .LL17
	ld	[%o4+%g2], %o3
.LL21:
	ldsh	[%o1], %g2
	ldsh	[%o1+2], %g3
	sll	%g2, 2, %g2
	sll	%g3, 2, %g3
	ld	[%o4+%g2], %o0
	add	%o1, 4, %o1
	ld	[%o0+%g3], %o3
.LL17:
	srl	%o5, 25, %o0
	cmp	%o0, 9
	bgu,pn	%icc, .LL28
	sethi	%hi(.LL39), %g2
	sll	%o0, 2, %o0
	or	%g2, %lo(.LL39), %g2
	ld	[%g2+%o0], %g3
	jmp	%g3
	 nop
.LL29:
	ba,pt	%xcc, .LL28
	add	%o2, %o3, %o2
.LL30:
	ba,pt	%xcc, .LL28
	sub	%o2, %o3, %o2
.LL31:
	ba,pt	%xcc, .LL28
	smul	%o2, %o3, %o2
.LL32:
	sra	%o2, 31, %g2
	wr	%g0, %g2, %y
	sdiv	%o2, %o3, %o2
	ba,pt	%xcc, .LL52
	and	%g1, 7, %o0
.LL33:
	sra	%o2, 31, %g3
	wr	%g0, %g3, %y
	sdiv	%o2, %o3, %g2
	smul	%g2, %o3, %g2
	ba,pt	%xcc, .LL28
	sub	%o2, %g2, %o2
.LL34:
	ba,pt	%xcc, .LL28
	and	%o2, %o3, %o2
.LL35:
	ba,pt	%xcc, .LL28
	or	%o2, %o3, %o2
.LL36:
	ba,pt	%xcc, .LL28
	xor	%o2, %o3, %o2
.LL37:
	ba,pt	%xcc, .LL28
	sll	%o2, %o3, %o2
.LL38:
	srl	%o2, %o3, %o2
.LL28:
	and	%g1, 7, %o0
.LL52:
	cmp	%o0, 7
	bgu,a,pt %icc, .LL53
	lduh	[%o1], %g1
	sethi	%hi(.LL50), %g2
	sll	%o0, 2, %o0
	or	%g2, %lo(.LL50), %g2
	ld	[%g2+%o0], %g3
	jmp	%g3
	 nop
.LL44:
	ldsh	[%o1], %g2
	sll	%g2, 2, %g2
	add	%o1, 2, %o1
	ba,pt	%xcc, .LL3
	st	%o2, [%o4+%g2]
.LL45:
	ldsh	[%o1], %g2
	ldsh	[%o1+2], %g3
	sll	%g2, 2, %g2
	sll	%g3, 2, %g3
	ld	[%o4+%g2], %o0
	add	%o1, 4, %o1
	ba,pt	%xcc, .LL3
	st	%o2, [%o0+%g3]
	.align 4
	.align 4
.LL50:
	.word	.LL3
	.word	.LL3
	.word	.LL44
	.word	.LL45
	.word	.LL3
	.word	.LL3
	.word	.LL3
	.word	.LL3
	.align 4
.LL39:
	.word	.LL29
	.word	.LL30
	.word	.LL31
	.word	.LL32
	.word	.LL33
	.word	.LL34
	.word	.LL35
	.word	.LL36
	.word	.LL37
	.word	.LL38
	.align 4
.LL26:
	.word	.LL18
	.word	.LL19
	.word	.LL20
	.word	.LL21
	.word	.LL17
	.word	.LL17
	.word	.LL17
	.word	.LL17
	.align 4
.LL15:
	.word	.LL7
	.word	.LL8
	.word	.LL9
	.word	.LL10
	.word	.LL6
	.word	.LL6
	.word	.LL6
	.word	.LL6
.LLfe1:
	.size	 interp,.LLfe1-interp
	.ident	"GCC: (GNU) 2.95.2 19991024 (release)"
