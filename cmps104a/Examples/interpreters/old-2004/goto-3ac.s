	.file	"goto-3ac.c"
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
.section	".data"
	.align 4
	.type	 Switch_mode1.3,#object
Switch_mode1.3:
	.uaword	.LL3
	.uaword	.LL4
	.uaword	.LL5
	.uaword	.LL6
	.uaword	.LL7
	.uaword	.LL8
	.uaword	.LL9
	.uaword	.LL10
	.align 4
	.type	 Switch_mode2.4,#object
Switch_mode2.4:
	.uaword	.LL11
	.uaword	.LL12
	.uaword	.LL13
	.uaword	.LL14
	.uaword	.LL15
	.uaword	.LL16
	.uaword	.LL17
	.uaword	.LL18
	.align 4
	.type	 Switch_mode3.5,#object
Switch_mode3.5:
	.uaword	.LL19
	.uaword	.LL20
	.uaword	.LL21
	.uaword	.LL22
	.uaword	.LL23
	.uaword	.LL24
	.uaword	.LL25
	.uaword	.LL26
	.align 4
	.type	 Switch_op.6,#object
Switch_op.6:
	.skip 12
	.uaword	.LL27
	.skip 48
	.uaword	.LL28
	.uaword	.LL29
	.uaword	.LL30
	.uaword	.LL31
	.uaword	.LL32
	.skip 12
	.uaword	.LL33
	.uaword	.LL34
	.uaword	.LL35
	.uaword	.LL36
	.uaword	.LL37
	.uaword	.LL38
	.skip 8
	.uaword	.LL39
	.uaword	.LL40
	.uaword	.LL41
	.uaword	.LL42
	.uaword	.LL43
	.uaword	.LL44
	.uaword	.LL45
.section	".text"
	.align 4
	.global interp
	.type	 interp,#function
	.proc	020
interp:
	!#PROLOGUE# 0
	save	%sp, -112, %sp
	!#PROLOGUE# 1
	sethi	%hi(Switch_mode1.3), %o0
	ldsh	[%l0], %l1
	or	%o0, %lo(Switch_mode1.3), %l3
	sethi	%hi(Switch_mode2.4), %o1
	sethi	%hi(Switch_op.6), %o0
	srl	%l1, 4, %o2
	or	%o0, %lo(Switch_op.6), %l6
	and	%o2, 28, %o2
	or	%o1, %lo(Switch_mode2.4), %l5
	sethi	%hi(Switch_mode3.5), %o0
	ld	[%l3+%o2], %o1
	jmp	%o1
	or	%o0, %lo(Switch_mode3.5), %l4
.LL3:
	srl	%l1, 1, %o0
	and	%o0, 28, %o0
	ld	[%l5+%o0], %o1
	jmp	%o1
	mov	0, %o4
.LL4:
	srl	%l1, 1, %o0
	ldsh	[%l0], %o4
	and	%o0, 28, %o0
	ld	[%l5+%o0], %o1
	jmp	%o1
	add	%l0, 2, %l0
.LL5:
	ldsh	[%l0], %o1
	srl	%l1, 1, %o0
	lduh	[%l0+2], %o2
	sll	%o1, 16, %o1
	and	%o0, 28, %o0
	or	%o1, %o2, %o4
	ld	[%l5+%o0], %o3
	jmp	%o3
	add	%l0, 4, %l0
.LL6:
	srl	%l1, 1, %o0
	and	%o0, 28, %o0
	ld	[%l5+%o0], %o1
	jmp	%o1
	 nop
.LL7:
	ldsh	[%l0], %o0
	srl	%l1, 1, %o1
	sll	%o0, 2, %o0
	and	%o1, 28, %o1
	ld	[%l7+%o0], %o4
	ld	[%l5+%o1], %o2
	jmp	%o2
	add	%l0, 2, %l0
.LL8:
	ldsh	[%l0], %o0
	ldsh	[%l0+2], %o2
	sll	%o0, 2, %o0
	srl	%l1, 1, %o1
	ld	[%l7+%o0], %o3
	sll	%o2, 2, %o2
	and	%o1, 28, %o1
	ld	[%o3+%o2], %o4
	ld	[%l5+%o1], %o0
	jmp	%o0
	add	%l0, 4, %l0
.LL9:
	srl	%l1, 1, %o0
	and	%o0, 28, %o0
	ld	[%l5+%o0], %o1
	jmp	%o1
	 nop
.LL10:
	srl	%l1, 1, %o0
	and	%o0, 28, %o0
	ld	[%l5+%o0], %o1
	jmp	%o1
	 nop
.LL11:
	srl	%l1, 7, %o0
	and	%o0, 508, %o0
	ld	[%l6+%o0], %o1
	jmp	%o1
	mov	0, %l2
.LL12:
	srl	%l1, 7, %o0
	ldsh	[%l0], %l2
	and	%o0, 508, %o0
	ld	[%l6+%o0], %o1
	jmp	%o1
	add	%l0, 2, %l0
.LL13:
	ldsh	[%l0], %o1
	srl	%l1, 7, %o0
	lduh	[%l0+2], %o2
	sll	%o1, 16, %o1
	and	%o0, 508, %o0
	or	%o1, %o2, %l2
	ld	[%l6+%o0], %o3
	jmp	%o3
	add	%l0, 4, %l0
.LL14:
	srl	%l1, 7, %o0
	and	%o0, 508, %o0
	ld	[%l6+%o0], %o1
	jmp	%o1
	 nop
.LL15:
	ldsh	[%l0], %o0
	srl	%l1, 7, %o1
	sll	%o0, 2, %o0
	and	%o1, 508, %o1
	ld	[%l7+%o0], %l2
	ld	[%l6+%o1], %o2
	jmp	%o2
	add	%l0, 2, %l0
.LL16:
	ldsh	[%l0], %o0
	ldsh	[%l0+2], %o2
	sll	%o0, 2, %o0
	srl	%l1, 7, %o1
	ld	[%l7+%o0], %o3
	sll	%o2, 2, %o2
	and	%o1, 508, %o1
	ld	[%o3+%o2], %l2
	ld	[%l6+%o1], %o0
	jmp	%o0
	add	%l0, 4, %l0
.LL17:
	srl	%l1, 7, %o0
	and	%o0, 508, %o0
	ld	[%l6+%o0], %o1
	jmp	%o1
	 nop
.LL18:
	srl	%l1, 7, %o0
	and	%o0, 508, %o0
	ld	[%l6+%o0], %o1
	jmp	%o1
	 nop
.LL27:
	mov	%o4, %o0
	call	syscall, 0
	mov	%l2, %o1
	and	%l1, 7, %o1
	mov	%o0, %o4
	sll	%o1, 2, %o1
	ld	[%l4+%o1], %o0
	jmp	%o0
	 nop
.LL28:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	add	%o4, %l2, %o4
.LL29:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	sub	%o4, %l2, %o4
.LL30:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	smul	%o4, %l2, %o4
.LL31:
	and	%l1, 7, %o0
	sra	%o4, 31, %o1
	wr	%g0, %o1, %y
	sdiv	%o4, %l2, %o4
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	 nop
.LL32:
	sra	%o4, 31, %o2
	wr	%g0, %o2, %y
	sdiv	%o4, %l2, %o1
	and	%l1, 7, %o0
	smul	%o1, %l2, %o1
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o2
	jmp	%o2
	sub	%o4, %o1, %o4
.LL33:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	and	%o4, %l2, %o4
.LL34:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	or	%o4, %l2, %o4
.LL35:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	xor	%o4, %l2, %o4
.LL36:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	sll	%o4, %l2, %o4
.LL37:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	srl	%o4, %l2, %o4
.LL38:
	and	%l1, 7, %o0
	sll	%o0, 2, %o0
	ld	[%l4+%o0], %o1
	jmp	%o1
	sra	%o4, %l2, %o4
.LL39:
	ldsh	[%l0], %o0
.LL53:
	sll	%o0, 1, %o0
	add	%l0, %o0, %l0
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL40:
	cmp	%o4, %l2
	be,a,pn	%icc, .LL53
	ldsh	[%l0], %o0
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL41:
	cmp	%o4, %l2
	bne,a,pt %icc, .LL53
	ldsh	[%l0], %o0
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL42:
	cmp	%o4, %l2
	bl,a,pn	%icc, .LL53
	ldsh	[%l0], %o0
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL43:
	cmp	%o4, %l2
	bge,a,pt %icc, .LL53
	ldsh	[%l0], %o0
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL44:
	cmp	%o4, %l2
	bg,a,pt	%icc, .LL53
	ldsh	[%l0], %o0
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL45:
	cmp	%o4, %l2
	ble,a,pn %icc, .LL53
	ldsh	[%l0], %o0
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL19:
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL20:
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL21:
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL22:
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL23:
	ldsh	[%l0], %o0
	sll	%o0, 2, %o0
	add	%l0, 4, %l0
	st	%o4, [%l7+%o0]
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL24:
	ldsh	[%l0], %o0
	ldsh	[%l0+2], %o1
	sll	%o0, 2, %o0
	sll	%o1, 2, %o1
	ld	[%l7+%o0], %o2
	add	%l0, 6, %l0
	st	%o4, [%o2+%o1]
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL25:
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LL26:
	add	%l0, 2, %l0
	ldsh	[%l0], %l1
	srl	%l1, 4, %o0
	and	%o0, 28, %o0
	ld	[%l3+%o0], %o1
	jmp	%o1
	 nop
.LLfe1:
	.size	 interp,.LLfe1-interp
	.ident	"GCC: (GNU) 2.95.2 19991024 (release)"
