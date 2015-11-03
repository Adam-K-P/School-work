	.file	"operfns.c"
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
	.global add
	.type	 add,#function
	.proc	04
add:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	retl
	add	%o0, %o1, %o0
.LLfe1:
	.size	 add,.LLfe1-add
	.align 4
	.global sub
	.type	 sub,#function
	.proc	04
sub:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	retl
	sub	%o0, %o1, %o0
.LLfe2:
	.size	 sub,.LLfe2-sub
	.align 4
	.global mul
	.type	 mul,#function
	.proc	04
mul:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	retl
	smul	%o0, %o1, %o0
.LLfe3:
	.size	 mul,.LLfe3-mul
	.align 4
	.global div
	.type	 div,#function
	.proc	04
div:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	sra	%o0, 31, %g2
	wr	%g0, %g2, %y
	sdiv	%o0, %o1, %o0
	retl
	nop
.LLfe4:
	.size	 div,.LLfe4-div
	.align 4
	.global rem
	.type	 rem,#function
	.proc	04
rem:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	sra	%o0, 31, %g3
	wr	%g0, %g3, %y
	sdiv	%o0, %o1, %g2
	smul	%g2, %o1, %g2
	retl
	sub	%o0, %g2, %o0
.LLfe5:
	.size	 rem,.LLfe5-rem
	.align 4
	.global uadd
	.type	 uadd,#function
	.proc	016
uadd:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	retl
	add	%o0, %o1, %o0
.LLfe6:
	.size	 uadd,.LLfe6-uadd
	.align 4
	.global usub
	.type	 usub,#function
	.proc	016
usub:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	retl
	sub	%o0, %o1, %o0
.LLfe7:
	.size	 usub,.LLfe7-usub
	.align 4
	.global umul
	.type	 umul,#function
	.proc	016
umul:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	retl
	smul	%o0, %o1, %o0
.LLfe8:
	.size	 umul,.LLfe8-umul
	.align 4
	.global udiv
	.type	 udiv,#function
	.proc	016
udiv:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	wr	%g0, %g0, %y
	udiv	%o0, %o1, %o0
	retl
	nop
.LLfe9:
	.size	 udiv,.LLfe9-udiv
	.align 4
	.global urem
	.type	 urem,#function
	.proc	016
urem:
	!#PROLOGUE# 0
	!#PROLOGUE# 1
	wr	%g0, %g0, %y
	udiv	%o0, %o1, %g2
	smul	%g2, %o1, %g2
	retl
	sub	%o0, %g2, %o0
.LLfe10:
	.size	 urem,.LLfe10-urem
	.ident	"GCC: (GNU) 2.95.2 19991024 (release)"
