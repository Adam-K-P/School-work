.lf 1 stdin
.lf 1 ./Tmac.mm-etc
.\" $Id: cmps112-2008q1-exam3.mm,v 8.49 2008-05-02 13:16:37-07 - - $
.\"
.\"----------------------------------------------------------------
.\" special font handling
.\"
.ftr CW CR                          |Const width is Courier.
.if t \{ .\"                        |if troff mode
.   ftr X BI                        |   map defaults
.   nr Hy 1\"                       |   yes hyphenation
.\}\"                               |fi troff
.if n \{ .\"                        |if nroff mode
.   SA 0\"                          |   set adjust off
.   nr Hy 0\"                       |   no hyphenation
.   ftr X R\"                       |
.   ftr CR R\"                      |   map Courier to Roman
.   ftr CB R\"                      |   map Courier to Roman
.   ftr CI R\"                      |   map Courier to Roman
.   ftr CBI R\"                     |   map Courier to Roman
.   ftr B I\"                       |   map Bold to Italic
.   ftr BI I\"                      |   map Bold Italic to Italic
.   ftr HR R\"                      |   map Helvetica to Roman
.   ftr HB R\"                      |   map Helvetica to Roman
.   ftr HBI R\"                     |   map Helvetica to Roman
.   ftr HI R\"                      |   map Helvetica to Roman
.   ftr ZCMI R\"                    |   map ZapfChancery to Roman
.   ftr ZCMXI R\"                   |   map ZapfChancery to Roman
.   ftr UZCMI R\"                   |   map ZapfChancery to Roman
.   ftr UZCMXI R\"                  |   map ZapfChancery to Roman
.   ftr FOLIO R\"                   |   map ZapfChancery to Roman
.   ftr FOLIOX R\"                  |   map ZapfChancery to Roman
.\}\"                               |fi nroff
.de Courier-Elite
.   if t \{ .\"                     |if troff mode [0.833333333]
.      ftr CR CER\"                 |   map Courier to Courier-Elite
.      ftr CB CEB\"                 |   map Courier to Courier-Elite
.      ftr CBI CEBI\"               |   map Courier to Courier-Elite
.      ftr CI CEI\"                 |   map Courier to Courier-Elite
.   \}\"                            |fi troff
..
.de Courier-Narrow
.   if t \{ .\"                     |if troff mode [0.75]
.      ftr CR CNR\"                 |   map Courier to Courier-Narrow
.      ftr CB CNB\"                 |   map Courier to Courier-Narrow
.      ftr CBI CNBI\"               |   map Courier to Courier-Narrow
.      ftr CI CNI\"                 |   map Courier to Courier-Narrow
.   \}\"                            |fi troff
..
.de Courier-Squeezed
.   if t \{ .\"                     |if troff mode [0.666666667]
.      ftr CR CQR\"                 |   map Courier to Courier-Squeezed
.      ftr CB CQB\"                 |   map Courier to Courier-Squeezed
.      ftr CBI CQBI\"               |   map Courier to Courier-Squeezed
.      ftr CI CQI\"                 |   map Courier to Courier-Squeezed
.   \}\"                            |fi troff
..
.de NewCenturySchlbk
.   if t \{ .\"                     |if troff mode
.      ftr R NR\"                   |   map Times to NewCenturySchlbk
.      ftr B NB\"                   |   map Times to NewCenturySchlbk
.      ftr BI NBI\"                 |   map Times to NewCenturySchlbk
.      ftr I NI\"                   |   map Times to NewCenturySchlbk
.   \}\"                            |fi troff
..
.de Times-fonts
.   Courier-Narrow
..
.de Newcentury-fonts
.   ds FONT-FAMILY N\"              |NewCentury-Schlbk.
.   fam \\*[FONT-FAMILY]\"          |
.   Courier-Elite
.   NewCenturySchlbk
.   ft R
..
.if t .Times-fonts
.\"
.\"----------------------------------------------------------------
.\" Fix older groff screwups.  Use only ISO-Latin-1 character set.
.\" Fix a few bugs in tmac.psnew as well.
.\"
.\".mso tmac.psnew
.warn\"                             |warn about everything
.char \(de \[char176]
.char \(+- \[char177]
.char \(/u \[char181]
.char \(md \[char183]
.char \(mu \[char215]
.char \(di \[char247]
.char \(|| \s+2\v'1p'|\v'-1p'\s-2
.char \(^^ \s+2\v'1p'\[ha]\v'-1p'\s-2
.char \(!! \|!
.char \(:: \|:
.char \(;; \|;
.char \(?? \|?
.char \(!) \|!\|
.char \(:) \|:\|
.char \(;) \|;\|
.char \(?) \|?\|
.char \(() (\|)
.char \(<> <\|>
.char \([] [\|]
.char \({} {\|}
.char \(<< «\|
.char \(>> \|»
.cflags 2 &        \"               |split before
.cflags 4 -:@/=\(en_ \"             |split after
.cflags 5 .?!:;    \"               |end sentence, split after
.cflags 5 \(!!\(::\(;;\(??
.\"
.\"----------------------------------------------------------------
.\" constant width display (escapes allowed) begin and end
.\"
.de C(\"
.   DS\"
.   ft CR\"
..\"
.de C)\"
.   ft P\"
.   DE\"
..\"
.\"
.\"----------------------------------------------------------------
.\" verbatim begin and end
.\" Usage: .V( arg1 arg2
.\" arg1 = 1 means enable escape character
.\" arg2 = 1 means suppress .DS/.DE pair
.\" arg3 = non-null is the VERBON argument
.\"        1 = disable esc, 2 = line before, 4 = line after
.\"        8 = line numbers, 16 = indent Verbin
.\"
.de V(\"
.   nr Verbatim-indent \\n[.i]u\"
.   ie '\\$[3]'' .nr Verbatim-arg 7
.   el .nr Verbatim-arg \\$[3]
.   if !\\$[2] .DS\"
.   \" VERBON arg: 7 = (1 no esc) + (2 line before) + (4 line after)
.   VERBON \\n[Verbatim-arg]
.   ec\"
.   in \\n[Verbatim-indent]u\"
.   if !\\$[1] .eo\"
..\"
.de V)\"
.   VERBOFF\"
.   if !\\$[2] .DE\"
..\"
.\"
.\"----------------------------------------------------------------
.\" Continuation macros for inline functions
.\"
.if !r DEBUG .nr DEBUG 0
.de *Continuation \" print words or execute commands
.   if \\n[DEBUG]>3 .tm *Continuation \\$*
.   shift \\$1+1
.   if \\n[.$]>0 \{.\"
.      ie d \\$1 \{.\"
.         \\$*
.      \}
.      el \{.\"
.         RB "\\$1"
.         *Continuation 1 \\$@
.      \}
.   \}
..
.de *=LI \" List commands to be executed by `*Continuation'
.   if \\n[DEBUG]>2 .tm *=LI \\$*
.   if \\n[DEBUG]>3 .tm li*tind=\n[li*tind], li*mind=\n[li*mind]
.   if \\n[li*lvl]<1 .@error "LI:no lists active"
.   if \\n[li*li-spc]&(\\n[Ls]>=\\n[li*lvl]) \{.\"
.      SP (u;\\n[li*li-spc]*\\n[Lsp])
.   \}
.   ne 2v
.   if \\n[.$]<1 .@error *=LI: missing argument(s): \\$*
.   ti -\\n[li*tind]u
.   nr li*in \\n[li*mind]u-\w' '
.   nop \h'\\n[li*in]u'
.   *Continuation 0 \\$@
..
.de * \" start up continuations
.   *Continuation 0 \\$@
..
.de *R \" next word is roman
.   RB "\\$1"
.   *Continuation 1 \\$@
..
.de *I \" next word is italic
.   IR "\\$1"
.   *Continuation 1 \\$@
..
.de *B \" next word is bold
.   BR "\\$1"
.   *Continuation 1 \\$@
..
.de *E \" next word is bold italic
.   E= "\\$1"
.   *Continuation 1 \\$@
..
.de *V \" next word is bold verbatim
.   V= "\\$1"
.   *Continuation 1 \\$@
..
.de *; \" break to next line
.   br
.   *Continuation 0 \\$@
..
.de *' \" quote-display an entity.
.   RB ` "\\$1" '
.   *Continuation 1 \\$@
..
.de *'V \" quote-display an entity in bold verbatim
.   =V ` "\\$1" '
.   *Continuation 1 \\$@
..
.\"
.\"----------------------------------------------------------------
.\" alternating font and list font macros
.\"
.de SH=VL
.   VL \n[Pi] "\\$[1]" \\$[2]
..
.de SH=BVL
.   BVL \n[Pi] "\\$[1]" \\$[2]
..
.de B=LI
.   LI "\f[B]\\$[1]\f[R]" \\$[2]
..
.de T=LI
.   LI "\f[CR]\\$[1]\f[R]" \\$[2]
..
.de V=LI
.   LI "\f[CB]\\$[1]\f[R]" \\$[2]
..
.de E=LI
.   LI "\f[BI]\\$[1]\f[R]" \\$[2]
..
.de MANPAGE=LI
.   nr li*type 0-1
.   LI "\f[B]\\$[1]\f[R]" \\$[2]
..
.de Folio=\"
.   if \\n[.$] .fnt@switch \f[FOLIO] \f[\\n[.f]] \\$@
..\"
.de =Folio\"
.   if \\n[.$] .fnt@switch \f[\\n[.f]] \f[FOLIO] \\$@
..\"
.de T=\"
.   if \\n[.$] .fnt@switch \f[CR] \f[\\n[.f]] \\$@
..\"
.de =T\"
.   if \\n[.$] .fnt@switch \f[\\n[.f]] \f[CR] \\$@
..\"
.de V=\"
.   if \\n[.$] .fnt@switch \f[CB] \f[\\n[.f]] \\$@
..\"
.de =V\"
.   if \\n[.$] .fnt@switch \f[\\n[.f]] \f[CB] \\$@
..\"
.de VB\"
.   if \\n[.$] .fnt@switch \f[CB] \f[B] \\$@
..\"
.de BV\"
.   if \\n[.$] .fnt@switch \f[B] \f[CB] \\$@
..\"
.de VI\"
.   if \\n[.$] .fnt@switch \f[CB] \f[I] \\$@
..\"
.de IV\"
.   if \\n[.$] .fnt@switch \f[I] \f[CB] \\$@
..\"
.de E=\" Emphasized text is Bold Italic
.   if \\n[.$] .fnt@switch \f[BI] \f[\\n[.f]] \\$@
..
.de =E\" Emphasized text is Bold Italic
.   if \\n[.$] .fnt@switch \f[\\n[.f]] \f[BI] \\$@
..
.de TV
.   if \\n[.$] .fnt@switch \f[CR] \f[CB] \\$@
..
.de VT
.   if \\n[.$] .fnt@switch \f[CB] \f[CR] \\$@
..
.de brTV
.   br
.   if \\n[.$] .fnt@switch \f[CR] \f[CB] \\$@
..
.de brVT
.   br
.   if \\n[.$] .fnt@switch \f[CB] \f[CR] \\$@
..
.de brBI
.   br
.   if \\n[.$] .fnt@switch \f[B] \f[I] \\$@
..
.de brIB
.   br
.   if \\n[.$] .fnt@switch \f[I] \f[B] \\$@
..
.de brBR
.   br
.   if \\n[.$] .fnt@switch \f[B] \f[R] \\$@
..
.de brRB
.   br
.   if \\n[.$] .fnt@switch \f[R] \f[B] \\$@
..
.de UL \" Underline
.   if t \\$[*]\l'|0\[ul]'
.   if n \\$[*]
..
.if t .nr VCODENWIDTH \w'\f[CB]\0\0\0\fR'
.if n .nr VCODENWIDTH \w'\0\0\0'
.de VCODE
.   nr VCODEN \\n[VCODENWIDTH]u*\\$[1]
.   br
.   V= "\h'\\n[VCODEN]u'\\$2" "\\$3" "\\$4" "\\$5" "\\$6" "\\$7" "\\$8"
..
.de TVCODE
.   nr VCODEN \\n[VCODENWIDTH]u*\\$[1]
.   br
.   TV "\h'\\n[VCODEN]u'\\$2" "\\$3" "\\$4" "\\$5" "\\$6" "\\$7" "\\$8"
..
.de VTCODE
.   nr VCODEN \\n[VCODENWIDTH]u*\\$[1]
.   br
.   VT "\h'\\n[VCODEN]u'\\$2" "\\$3" "\\$4" "\\$5" "\\$6" "\\$7" "\\$8"
..
.de VICODE
.   nr VCODEN \\n[VCODENWIDTH]u*\\$[1]
.   br
.   VI "\h'\\n[VCODEN]u'\\$2" "\\$3" "\\$4" "\\$5" "\\$6" "\\$7" "\\$8"
..
.de VCODE*
.   VCODE \\$@
.   br
..
.de TVCODE*
.   TVCODE \\$@
.   br
..
.de VTCODE*
.   VTCODE \\$@
.   br
..
.de VICODE*
.   VICODE \\$@
.   br
..
.de VINDENT*
.   TVCODE* 0 \h'\n[Pi]n' \\$@
..
.nr BCODENWIDTH \w'\fB\0\0\0\fR'
.de BCODE
.   nr BCODEN \\n[BCODENWIDTH]u*\\$[1]
.   br
.   BR "\h'\\n[BCODEN]u'\\$2" "\\$3" "\\$4" "\\$5" "\\$6" "\\$7" "\\$8"
..
.de ICODE
.   nr ICODEN \\n[BCODENWIDTH]u*\\$[1]
.   br
.   IR "\h'\\n[ICODEN]u'\\$2" "\\$3" "\\$4" "\\$5" "\\$6" "\\$7" "\\$8"
..
.de RBCODE
.   nr RCODEN \\n[BCODENWIDTH]u*\\$[1]
.   br
.   RB "\h'\\n[RCODEN]u'\\$2" "\\$3" "\\$4" "\\$5" "\\$6" "\\$7" "\\$8"
..
.de BCODE*
.   BCODE \\$@
.   br
..
.de ICODE*
.   ICODE \\$@
.   br
..
.de RBCODE*
.   RBCODE \\$@
.   br
..
.\"
.\"----------------------------------------------------------------
.\" general mode settings for all runs
.\"
.HM 1 1 1 1 1 1 1\"                 |heading formats
.ds HP 10 10 10 10 10 10 10\"       |heading point sizes
.ds HF B B B B B B B\"              |heading fonts
.nr Ej 0\"                          |dont eject any headings
.nr Hb 7\"                          |heading break for all
.nr Hps 1\"                         |heading pre-space level
.nr Hps1 0.5v\"                     |lines preceding level>Hps
.nr Hps2 1v\"                       |lines preceding level<=Hps
.\".lg 0\"                          |don't use ligatures
.\"
.\"----------------------------------------------------------------
.\" date facilities for displaying in yyyy-mm-dd format
.\"
.ds OLDDATE \\*[MO\n[mo]] \n[dy], \n[year]
.af yr 0001\"                       |year format 4 digits
.af mo 01\"                         |month format 2 digits
.af dy 01\"                         |day format 2 digits
.nr yr 1900+\n[yr]\"                |year number in 1900's
.nr mo \n[mo]\"                     |month number
.nr dy \n[dy]\"                     |day number
.ds DATE \n[yr]\-\n[mo]\-\n[dy]\"   |date format yyyy-mm-dd
.ND \*[DATE]\"                      |replace default date
.\"
.\"----------------------------------------------------------------
.\" Dingbats, and other special characters
.\"
.de char-nt \" charname nroffdef troffdef
.   if !'\\$2'' .if n .char \[\\$1] \\$2
.   if !'\\$3'' .if t .char \[\\$1] \\$3
..
.de ds-nt \" stringname nroffdef troffdef
.   if !'\\$2'' .if n .ds \\$1 \\$2
.   if !'\\$3'' .if t .ds \\$1 \\$3
..
.de ds-nt2 \" stringname=nroffdef troffdef
.   if n .ds \\$1 \\$1
.   if t .ds \\$1 \\$2
..
.de char-nt-ZD \" charname nroffdef ZDtroffdef
.   if !'\\$2'' .if n .char \[\\$1] \\$2
.   if !'\\$3'' .if t .char \[\\$1] \f[ZD]\N'\\$3'
..
.de highacc@over-def \" name accent
.   ds \\$1 \Z'\v'(u;\w'x'*0+\En[rst]-\En[.cht]*2)'\
\h'(u;-\En[skw]+(-\En[.w]-\w'\\$2'/2)+\En[.csk])'\\$2'
..
.char \(Dq ""\"                     |double quote for string args
.char \(de \[char176]\"             |degree sign
.char \(+- \[char177]\"             |plus or minus
.char \(/u \[char181]\"             |text mu
.char \(md \[char183]\"             |middle dot
.char \(mu \[char215]\"             |times multiplication sign
.char \(di \[char247]\"             |division sign
.ds Verbatim.Space \h'.1m'\D'l 0 .25m'\D'l .4m 0'\D'l 0 -.25m'\h'.1m'
.char-nt VS         _     "\*[Verbatim.Space]"
.char-nt _EOF       \[Do] "\[sc]"
.char-nt _          ""    "\[a-]"  \" macron accent
.char-nt-ZD envelope   *   41
.char-nt-ZD handwrite  *   45
.char-nt-ZD peace      *   44
.char-nt-ZD pen        *   49
.char-nt-ZD phone      *   37
.char-nt-ZD snowflake  *  101
.char-nt-ZD tape       *   39
.char-nt-ZD tick       *   52
.if n \{ .\"                        |if nroff mode
.   char \[bu] *\"
.   char \['e] e'
.   char \[`e] e`
.   char \[sd] ''
.   char \[/L] L
.\}\"                               |fi troff
.\"
.\"----------------------------------------------------------------
.\" Greek and Latin alphabet assistance
.\"
.if n \{ .\"                        |if nroff mode
.   char \[*A] \[rs]Alpha
.   char \[*B] \[rs]Beta
.   char \[*G] \[rs]Gamma
.   char \[*D] \[rs]Delta
.   char \[*E] \[rs]Epsilon
.   char \[*Z] \[rs]Zeta
.   char \[*Y] \[rs]Eta
.   char \[*H] \[rs]Theta
.   char \[*I] \[rs]Iota
.   char \[*K] \[rs]Kappa
.   char \[*L] \[rs]Lambda
.   char \[*M] \[rs]Mu
.   char \[*N] \[rs]Nu
.   char \[*C] \[rs]Xi
.   char \[*O] \[rs]Omicron
.   char \[*P] \[rs]Pi
.   char \[*R] \[rs]Rho
.   char \[*S] \[rs]Sigma
.   char \[tS] \[rs]Sigma
.   char \[*T] \[rs]Tau
.   char \[*U] \[rs]Upsilon
.   char \[*F] \[rs]Phi
.   char \[*X] \[rs]Chi
.   char \[*Q] \[rs]Psi
.   char \[*W] \[rs]Omega
.   char \[*a] \[rs]alpha
.   char \[*b] \[rs]beta
.   char \[*g] \[rs]gamma
.   char \[*d] \[rs]delta
.   char \[*e] \[rs]epsilon
.   char \[*z] \[rs]zeta
.   char \[*y] \[rs]eta
.   char \[*h] \[rs]theta
.   char \[+h] \[rs]theta
.   char \[*i] \[rs]iota
.   char \[*k] \[rs]kappa
.   char \[*l] \[rs]lambda
.   char \[*m] \[rs]mu
.   char \[*n] \[rs]nu
.   char \[*c] \[rs]xi
.   char \[*o] \[rs]omicron
.   char \[*p] \[rs]pi
.   char \[+p] \[rs]pi
.   char \[*r] \[rs]rho
.   char \[*s] \[rs]sigma
.   char \[ts] \[rs]sigma
.   char \[*t] \[rs]tau
.   char \[*u] \[rs]upsilon
.   char \[*f] \[rs]phi
.   char \[+f] \[rs]phi
.   char \[*x] \[rs]chi
.   char \[*q] \[rs]psi
.   char \[*w] \[rs]omega
.\}\"                               |fi nroff
.\"
.\"----------------------------------------------------------------
.\" miscellaneous other stuff
.\"
.nr D 1\"                           |enable debugging information
.if \n[.g] .as ROFF-CMD g\"         |is this Gnu troff?
.if t .as ROFF-CMD t\"              |is this troff?
.if n .as ROFF-CMD n\"              |is this nroff?
.as ROFF-CMD roff
.if r .x .as ROFF-CMD \-\n[.x]
.if r .y .as ROFF-CMD .\n[.y]
.if r .Y .as ROFF-CMD .\n[.Y]
.if \n[.mgm] .as ROFF-CMD \~\-mgm\"
.as ROFF-CMD \~\-T\*[.T]\~\\n[.F]\"
.de ALX \" .ALX [mark [type [text-indent [LI-space]]]]
.   \" mark: 1 A a I i
.   \" type: . ) () [] <> {}
.   \" LB text-indent mark-indent pad type [mark [LI-space [LB-space]]]
.   ie '\\$1''   .ds ALX*mark 1
.   el           .ds ALX*mark \\$1
.   nr ALX*type 1
.   if '\\$2'.'  .nr ALX*type 1
.   if '\\$2')'  .nr ALX*type 2
.   if '\\$2'()' .nr ALX*type 3
.   if '\\$2'[]' .nr ALX*type 4
.   if '\\$2'<>' .nr ALX*type 5
.   if '\\$2'{}' .nr ALX*type 6
.   ie '\\$3''   .nr ALX*Li \\n[Li]-1
.   el           .nr ALX*Li \\$3
.   LB \\n[ALX*Li] 0 1 \\n[ALX*type] \\*[ALX*mark] \\$4
..
.de ALX_CHOOSE
.   ALX A () 4 0
..
.\"
.\"----------------------------------------------------------------
.\" show score macro
.\"
.nr SHOWSCORE 0
.de SHOWSCORE
.   B \f[HB][\\$1\[tick]]\f[P]
.   nr SHOWSCORE \\n[SHOWSCORE]+\\$1
..
.de ENDSCORE
.FS \&
Total\(::
\\n[SHOWSCORE] \[tick]
.FE
..
.\"
.\"----------------------------------------------------------------
.\" exam question score indicator and exam answer space allocation
.\"
.de SCORE_INC\"
.   ie t .ds pts \[tick]
.   el .ds pts pt
.   ds SCORE \f[HB][\\$1\\*[pts]]\f[P]
.   if !r SCORE_TOTAL .nr SCORE_TOTAL 0
.   nr SCORE_TOTAL \\n[SCORE_TOTAL]+\\$1
..\"
.de SCORE_HERE\"
.   SCORE_INC \\$[1]
\\*[SCORE]
..\"
.de SCORE_LMAR\"
.   SCORE_INC \\$[1]
.\"\Z'\h'-\\n[.k]u-\w'\\*[SCORE]\0'u'\\*[SCORE]'
.\"\Z'\h'|-\w'\\*[SCORE]\0'u'\\*[SCORE]'
\\k_\h'-\\n[.k]u-\w'\\*[SCORE]\0''\\*[SCORE]\h'|\\n[_]u'
..\"
.de SCORE_RMAR\"
.   SCORE_INC \\$[1]
\\k_\h'\\n[.l]u-\\n[.k]u'\0\\*[SCORE]\h'|\\n[_]u'
.\"\Z'\\h'|\\n[.l]u'\0\\*[SCORE]'
..\"
.de SCORE_END
.FS \&
.   if !r SCORE_TOTAL .nr SCORE_TOTAL 0
Total\(::
\\n[SCORE_TOTAL] \[tick]
.FE
..
.de SPACE\"
.   if r SPACE_FOR_ANSWERS .SP \\$[1]\"
..\"
.\"
.\"----------------------------------------------------------------
.\" Definitions for eqn.  The following defines the precedence
.\" relations =. <. and >. that the Dragonbook uses.  Sorta.
.\"
.if t \{ .\"
.EQ
delim off
tdefine <.char  |"<\h'-.23m'\z\[md]\h'.23m'"|
tdefine =.char  |"=\h'-.42m'\v'-.3m'\z\[md]\v'.3m'\h'.42m'"|
tdefine >.char  |"\z\[md]>"|
tdefine subset  |{type "relation" "\f[S]\[sb]\f[P]"}|
tdefine supset  |{type "relation" "\f[S]\[sp]\f[P]"}|
tdefine <.      |{type "relation" <.char}|
tdefine =.      |{type "relation" =.char}|
tdefine >.      |{type "relation" >.char}|
tdefine elem    |{type "relation" \[mo]}|
tdefine forall  |{type "relation" \[fa]}|
tdefine mul     |{type "binary" "\[mu]"}|
tdefine div     |{type "binary" "\[di]"}|
tdefine rem     |{type "binary" "\f[CR]%\f[P]"}|
tdefine union   |{type "binary" "\[cu]"}|
tdefine inter   |{type "binary" "\[ca]"}|
.EN
.\}\"
.\"
.\"----------------------------------------------------------------
.\" PIC macro to build the score and name boxes at the top of
.\" the first page of an exam.
.\" Usage:  examboxes( _NR_BOXES, _MAX_SCORE )
.\"
.if t \{ .\"
.PS
exam_boxwid     = 2.5
exam_boxht      = 0.3
exam_circlerad  = exam_boxht
exam_ellipsewid = exam_boxht * 2.4
exam_ellipseht  = exam_circlerad * 2
define examboxes {
   for pgnr = 1 to $1 do {
      circle rad exam_circlerad fill .1
      sprintf( "\f[R]page %g\f[P]", pgnr ) \
            at last circle.n above
      move to last circle.e
   }
   box wid exam_boxwid ht exam_boxht with .se at (6.5,0)
   "\f[B]\0Please PRINT using keyboard letters\(::\f[P]" \
         at last box.nw ljust above
   "\f[B]\0Name\(::\f[P]" at last box.sw ljust above
   box wid exam_boxwid ht exam_boxht with .ne at (6.5,0)
   "\f[B]\0Login\(::\f[P]" at last box.sw ljust above
   "\f[CR]@ucsc.edu\0\f[P]" at last box.se rjust above
   ellipse fill .1 thick 2 wid exam_ellipsewid+0.2 ht exam_ellipseht \
         at 1/2 between last circle.e and last box.nw
   sprintf( "\f[R]Total\|/\|%g\f[P]", $2 ) \
         at last ellipse.n above
   reset
}
.PE
.\}\"
.\"
.\"----------------------------------------------------------------
.\" PIC and EQN macros to pass these specs directory through to
.\" output verbatim in nroff mode.
.\"
.if n \{ .\"
.de PS
.   VERBON 6
\&.PS \\$[*]
.   eo
..
.de EQ
.   VERBON 6
\&.EQ \\$[*]
.   eo
..
.de PE
.   ec
\&.PE \\$[*]
.   VERBOFF
..
.de EN
.   ec
\&.EN \\$[*]
.   VERBOFF
..
.\}\"
.\"
.\"----------------------------------------------------------------
.\" macros for multiple choice test questions
.\"
.de CHOICEQUESTION
.   DS "" F
.   LI
.   af CHOICE_COUNT A
.   nr CHOICE_COUNT 0
..
.de CHOICE_END
.   DE
..
.de CHOICE
.   nr CHOICE_COUNT +1
\f[B][\\n[CHOICE_COUNT]]\f[P]\~\\$1.
..
.de CHOICEBR
.   br
.   nr CHOICE_COUNT +1
\f[B][\\n[CHOICE_COUNT]]\0\f[P]\~\\$1
..
.de OLDDS
.   br
.   nr ds*lvl +1
.   ds@set-format \\$@
.   \"
.   nr ds*old-ll \\n[.l]
.   misc@push ds-ll \\n[.l]
.   misc@push ds-form \\n[ds*format]
.   nr ds*i \\n[.i]
.   nr ds*ftmp \\n[.f]
.   misc@ev-keep ds*ev!\\n+[ds*snr]
.   ft \\n[ds*ftmp]
.   \"
.   init@reset
'   in \\n[ds*i]u
.   di ds*div!\\n[ds*snr]
.   \"
.   ds@set-new-ev \\n[ds*old-ll]
.   nr df*float 0
..
.de CHOOSE_BEGIN
.   nr CHOOSE_Ds \\n[Ds]
.   nr Ds 0
.   nr CHOOSE 0
.   OLDDS L F
.   LI
..
.de CHOOSE_END
.   if \\n[CHOOSE]=1 .LE
.   nr CHOOSE 0
.   DE
.   nr Ds \\n[CHOOSE_Ds]
..
.de CHOOSE
.   if \\n[CHOOSE]=0 .ALX_CHOOSE
.   nr CHOOSE 1
.   LI
..
.de CHOOSE4
.   while \\n[.$]>0 \{ .\"
.      CHOOSE
\\$[1]
.      shift
.   \}
..
.de CHOOSE4FT
.   if \\n[CHOOSE]=0 .ALX_CHOOSE
.   nr CHOOSE 1
.   ds CHOOSE_FONT \\$[1]
.   while \\n[.$]>1 \{ .\"
.      shift
.      LI
.      ft \\*[CHOOSE_FONT]
\\$[1]
.      ft R
.   \}
..
.de CHOOSE8V=
.   if \\n[CHOOSE]=0 .ALX_CHOOSE
.   nr CHOOSE 1
.   while \\n[.$]>1 \{ .\"
.      LI
.      V= \\$[1] \\$[2]
.      shift 2
.   \}
..
.\"
.\"----------------------------------------------------------------
.\" page titling and RCS identification macros
.\"
.\" PGFORM should be done in the Makefile.
.\" .if t .PGFORM 6.5i 11.2i 1.0i 1 \" linelen pagelen pageoffset nobrk
.de TITLE
.   \" .TITLE course quarter object "title"
.   ds TITLE-LEFT \\$[1]
.   nr TITLE-INDEX 1 1
.   while \\n+[TITLE-INDEX]<=\\n[.$] \{ .\"
.      as TITLE-LEFT " \[bu] \\$[\\n[TITLE-INDEX]]
.   \}
..
.de EXAM
.   if t .PGFORM 6.5i 11.2i 1.0i 1 \" linelen pagelen pageoffset nobrk
.   if n .PGFORM 72m 1000i 0m 1 \" linelen pagelen pageoffset nobrk
.   ds TITLE-RIGHT page % of \\$[1]
.   shift
.   TITLE \\$[@]
..
.ds HRULE-D \D'l \\n[.l]u 0'\h'-\\n[.l]u'
.ds HRULE-v3 \v'.3v'\\*[HRULE-D]\v'-.3v'
.ds HRULE-v4 \v'.4v'\\*[HRULE-D]\v'-.4v'
.ie t .ds HRULE-T \\*[HRULE-v3]\\*[HRULE-v4]
.el .ds HRULE-T "
.de TP
.   if !d TITLE-LEFT  .ds TITLE-LEFT \f[CR]\\*[ROFF-CMD]\f[P]
.   if !d TITLE-RIGHT .ds TITLE-RIGHT page %
.   if !d RCS-TITLE   .ds RCS-TITLE \*[DATE]
.   if d TITLE-LAST-PAGE \{ .\"
.      as TITLE-RIGHT " of \\*[TITLE-LAST-PAGE]
.      rm TITLE-LAST-PAGE
.   \}
.   sp 0.5i
.   tl '\\*[HRULE-T]\f[B]\\*[TITLE-LEFT]\f[R]''\\*[TITLE-RIGHT]'
.   sp .2v
.   if \\n[%]=1 .RCS
.   sp 0.2i
..
.de RCS
.   if !'\\$[*]'' .ds RCS-TITLE \\$[*]
.   if \\n[%]>0 \s-1\f[CR]\\*[RCS-TITLE]\f[R]\s+1
..
.de Carthaginem
.   IR "\[<<]Praeterea, censeo Microflaccidem esse delendam.\[>>]"
..
.de Cato.maior
.   RI "With apologies to Marcus Porcius Cato Maior"
.   RI "(\s[-2]DXX\[en]DCV\s[+2]\~auc)\(::"
.   Carthaginem
..
.\"
.\"----------------------------------------------------------------
.\"
.\".de BOX
.\".nr par*bxw \w'\\$1'+.4m
.\"\Z'\v'.25m'\D'l 0 -1m'\D'l \\n[par*bxw]u 0'\D'l 0 1m'\D'l -\\n[par*bxw]u 0''\
.\"\Z'\h'.2m'\\$1'\h'\\n[par*bxw]u'
.\"..
.\"
.\"----------------------------------------------------------------
.\" Hyphenation.
.hw Ar-ray-In-dex-Out-Of-Bounds-Ex-cep-tion
.hw Null-Point-er-Ex-cep-tion
.hw ex-treme-ly
.hw ma-nip-u-lex-i-ty
.hw par-a-digm
.hw par-a-digms
.hw pre-req-ui-site
.hw pre-req-ui-sites
.hw syl-la-bus
.hw whip-up-ti-tude
.hw with-out
.\"
.\"----------------------------------------------------------------
.\" Fix bugs in new groff version re: INITR and GETST
.de INITR*
.   ds QRF-FILE-BASENAME \\$1
.   substring QRF-FILE-BASENAME 1 -3
.   sy touch \\*[QRF-FILE-BASENAME].qrf
.   INITR \\*[QRF-FILE-BASENAME]
.   GETPN LAST-PAGE TITLE-LAST-PAGE
..
.de GETST*
.   if \\n[.$]>1 .if !d\\$2 .ds \\$2 ****\\$2****
.   GETST \\$1 \\$2
..
.de FIGURE_BEGIN
.   DF L
.   B1
.   SP
.   ft CR
.   nf
.   eo
..
.de FIGURE_END
.   ec
.   fi
.   ft R
.   SP
.   B2
.   FG "\\$[1]" "" 0 \\$[2]
.   DE
..
.de FINISH
.   SETR LAST-PAGE
..
.lf 2 stdin
.RCS "$Id: cmps112-2008q1-exam3.mm,v 8.49 2008-05-02 13:16:37-07 - - $"
.ds COURSE Comparative Programming Languages
.EXAM 5 CMPS-112 "\*[COURSE]" Winter\~2008 Final\~Exam
.nr SPACE_FOR_ANSWERS 1
.DS
.PS
examboxes(5,50)
.PE
.DE
.P
.ft BI
No books\(;;
No calculator\(;;
No computer\(;;
No email\(;;
No internet\(;;
No notes\(;;
No phone.
Neatness counts\(!!
Do your scratch work elsewhere and enter only your final
answer into the spaces provided.
.ft R
.EQ
delim $$
.EN
.ALX 1 . 4
.LI
Enter the names of the following languages in the appropriate places
in the table\(::
.SCORE_HERE 2
.br
C, C++, Java, Ocaml, Perl, Prolog, Scheme.
.DS
.TS
tab(|); l l l, l |cew(180p) |ce |, |l |c |c |.
|_|_
|static types|dynamic types
_
.SP
strong types
_
.SP
weak types
_
.TE
.DE
.LI
Define the function
.V= zipwith
in Ocaml.
It takes a binary function and applies it pairwise to its two
argument lists.
If the lists are not of the same length,
raise the
.V= Invalid_argument
exception.
.SCORE_HERE 2
.TVCODE* 0 "# " "zipwith;;"
.TVCODE* 0 "- : ('a -> 'b -> 'c) -> 'a list -> 'b list -> 'c list"
.TVCODE* 0 "# " "zipwith (+) [1;2;3] [4;5;6];;"
.TVCODE* 0 "- : int list = [5; 7; 9]"
.SPACE .5i
.LI
Write some facts in Prolog to describe the following directed
graph.
Call the predicate
.V= link ,
with the first parameter pointing at the second parameter.
.SCORE_HERE 2
.DS
.PS .75i
arrowht = .2
arrowwid = arrowht/2
A: circle "a"
B: circle "b" at A+(4*circlerad,0)
C: circle "c" at B+(4*circlerad,0)
D: circle "d" at B-(0,4*circlerad)
E: circle "e" at A-(0,4*circlerad)
arrow from A to B chop
arrow from B to C chop
arrow from B to D chop
arrow from D to E chop
arrow from A to E chop
Z: circle invis at B+(0,4*circlerad)
spline-> from C to Z then to A chop
.PE
.DE
.LI
What is normal order evaluation\(??
What is applicative order evaluation\(??
.SCORE_HERE 2
.SPACE 1i
.LI
Fill in the blanks with an appropriate expression which will
generate the results shown.
Do not write a definition.
A
.V= fun
or \[*l]-expression, respectively, is required.
.SCORE_HERE 2
.ALX a ()
.LI
Ocaml\(::
.TVCODE* 0 "# " "List.map (\l'2.5i') [1;2;3;4];;"
.TVCODE* 0 "- : int list = [2; 4; 6; 8]"
.LI
Scheme\(::
.TVCODE* 0 "> " "(map (\l'2.5i') '(1 2 3 4))"
.TVCODE* 0 "(2 4 6 8)"
.LE
.SPACE 10i
.LI
Define a function 
.V= split
in Ocaml which takes a single list as an argument and returns a tuple
of two lists of the same type each containing half of the elements
of the original.
If the list has an odd number of elements,
one of the output lists will be one element longer than the other.
It does not matter which elements go in which output lists.
.SCORE_HERE 2
.DS
.TVCODE* 0 "# " "split;;"
.TVCODE* 0 "- : 'a list -> 'a list * 'a list = <fun>"
.TVCODE* 0 "# " "split [1;2;3;4;5;6];;"
.TVCODE* 0 "- : int list * int list = ([1; 3; 5], [2; 4; 6])"
.DE
.SPACE .75i
.LI
Define a Scheme function
.V= split
which takes a single list as an argument and returns a list of
length two,
of which the
.V= car
is a list of half of the elements and the
.V= cadr
is a list of the other half.
The actual selection of elements for each output list is arbitrary.
.SCORE_HERE 2
.DS
.TVCODE* 0 "> " "(split '(1 2 3 4 5 6 7 8))"
.TVCODE* 0 "((1 3 5 7) (2 4 6 8))"
.DE
.SPACE .75i
.LI
In either Ocaml or Scheme,
using the higher-order functions
.V= map
and
.V= foldl ,
and without defining any functions (use 
.V= fun
or
.V= lambda ),
write two expressions\(::
.SCORE_HERE 2
.ALX a ()
.LI
compute the sum of a list of integers.
.SPACE .5i
.LI
add one to each element of a list of integers and return it as a new
list.
.SPACE .5i
.LE
.LI
Define the predicate
.V= mem
in Prolog,
which succeeds if its first argument can unify with one of the
elements of its second argument, which is a list.
.SCORE_HERE 2
.TVCODE* 0 "?- " "mem(3,[1,2,3,4])."
.TVCODE* 0 "Yes"
.TVCODE* 0 "?- " "mem(9,[1,2,3,4])."
.TVCODE* 0 "No"
.SPACE .75i
.LI
Define the predicate 
.V= sum
in Prolog, which sets its first argument to the sum of the integers
in the list of its second argument.
.SCORE_HERE 2
.TVCODE* 0 "?- " "sum(X,[])."
.TVCODE* 0 "X = 0"
.TVCODE* 0 "?- " "sum(X,[1,2,3,4])."
.TVCODE* 0 "X = 10"
.SPACE 10i
.LI
In C++, provide the definition of class
.V= box
compatible with the usage shown in 
.V= main .
Define the ctor of one parameter,
.V= put ,
which deposits a thing in the box, and
.V= get
which copies it out.
It must be a template class.
Since the functions are trivial,
code them all as inline functions.
.SCORE_HERE 2
.DS
.ft CR
int main () {
   box <int> bi (3);
   bi.put (6);
   cout << bi.get () << endl;
   box <string> bs ("foo");
   bs.put ("bar");
   cout << bs.get () << endl;
   return 0;
}
.DE
.LI
Write a program in Perl which uses
.V= <>
to read lines of input.
Each line is split on white space.
Each word thus found is added to the total and at final EOF,
the sum of all the words is printed.
All words are guaranteed to look to Perl like numbers.
.SCORE_HERE 2
.SPACE 1.25i
.LI
Write a function in Perl called
.V= search
which takes another function
as its first argument,
and a pointer to an array as its second argument.
It searches the array for the earliest element for which the
function returns true and returns that element.
If none are found, it returns
.V= undef .
.SCORE_HERE 2
.TVCODE* 0 "% " "tail -2 search.perl"
.TVCODE* 0 "\[Do]a = search sub{\[Do]_[0]<0}, [1, 2, -3, -4, 5];"
.TVCODE* 0 "print \[Dq]\[Do]a\[rs]n\[Dq];"
.TVCODE* 0 "% " "search.perl"
.TVCODE* 0 "-3"
.SPACE 0.5i
.LI
Write a function in Scheme called
.V= grep
whose first argument is a function and whose second argument is a list.
The result is a sublist of the argument, in the same order,
for which the list elements accepted by the function.
Do not use a higher-order function.
Use a 
.V= let
to avoid calling
.V= car
or
.V= cdr
more than once.
.SCORE_HERE 2
.TVCODE* 0 "> " "(grep (lambda (x) (> x 0)) '(1 2 -3 -4 5))"
.TVCODE* 0 "(1 2 5)"
.SPACE 1i
.LI
Draw a picture of the following Scheme list.
For each cons cell, draw a box divided into two parts.
For any half of such a box\(::
If it is null, write the Greek letter \[*f] in it.
If it contains an atom, write that atom inside the half box.
Otherwise draw an arrow from the half box to the cell that it points
at.
.SCORE_HERE 2
.VTCODE* 0 "((a b c) (d ((e))) (f . g) h)"
.LE
.SPACE 10i
.if t .2C
.\".nr Ds 0
Multiple choice.
To the
.E= left
of each question,
write the letter that indicates your answer.
Write
.=E ` Z '
if you don't want to risk a wrong answer.
Wrong answers are worth negative points.
.nr MULTCHOICE_MAX 11
.SCORE_HERE \n[MULTCHOICE_MAX]
.P
.DS
.TS
tab(|); |l |r2w(.4i) |l1 r1 l |rw(.2i) l |.
_
number of||×|1|\&=||$= a$
correct answers
_
number of||×|\[12]|\&=||$= b$
wrong answers
_
number of|\0\0\0|×|0|\&=|0
missing answers
_
column total|\n[MULTCHOICE_MAX]|||||$= c$
$ c = max ( a - b , 0 ) $
_
.TE
.DE
.P
.ALX 1 . 4
.CHOOSE_BEGIN
The Scheme function
.V= map
and the Ocaml function
.V= List.map
take how much time on a list of length $n$\(??
.CHOOSE
$ O ( 1 ) $
.CHOOSE
$ O ( log sub 2 n ) $
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( n log sub 2 n ) $
.CHOOSE_END
.CHOOSE_BEGIN
Which statement will cause Ocaml to print
.VCODE* 0 "val f : int -> int -> int = <fun>"
.CHOOSE4FT CB "let f (x, y) = x + y;;" "let f = 3, 4, 5;;" \
"let f x = x, x, x;;" "let f x y = x + y;;"
.CHOOSE_END
.CHOOSE_BEGIN
What is the type of the Ocaml expression
.VCODE* 0 "List.map (fun x -> x+x) [1;2;3]"
.CHOOSE4FT CB "('a -> 'b) -> 'a list -> 'b list" "int -> int" \
"int list" "int list -> int list"
.CHOOSE_END
.CHOOSE_BEGIN
Allowing partial parameterization of a function is called
.CHOOSE4 currying lambda\~lifting tupling unification
.CHOOSE_END
.CHOOSE_BEGIN
What is the time efficiency of
.VCODE* 0 "let rec f n = match n with"
.VCODE* 0 "    | 0 -> 0 | 1 -> 1"
.VCODE* 0 "    | n -> f (n - 1) + f (n - 2)"
.CHOOSE
$ O ( n ) $
.CHOOSE
$ O ( n log sub 2 n ) $
.CHOOSE
$ O ( n sup 2 ) $
.CHOOSE
$ O ( 2 sup n ) $
.CHOOSE_END
.CHOOSE_BEGIN
The language PL/I allowed a non-local
.V= goto ,
that is a 
.V= goto
that transferred control from one function into another by allowing
statement labels to be passed as parameters.
A structured form of non-local 
.V= goto
is accomplished in C++ and Java with what statement\(??
.CHOOSE4FT CB break catch continue throw
.CHOOSE_END
.CHOOSE_BEGIN
What kind of polymorphism does ANSI C support\(??
.CHOOSE4 coercion inclusion overloading parametric
.CHOOSE_END
.CHOOSE_BEGIN
What kind of polymorphism is provided by an object-oriented
language\(??
.CHOOSE4 coercion inclusion overloading parametric
.CHOOSE_END
.CHOOSE_BEGIN
Algol 60's parameter passing mechanism by name uses a parameterless
procedure called a
.CHOOSE4 closure curry horn thunk
.CHOOSE_END
.CHOOSE_BEGIN
Which of the following higher order functions would be useful
in returning a list containing the squares of all the integers
in a list passed to it as an argument\(??
.CHOOSE4FT CB compose foldl foldr map
.CHOOSE_END
.CHOOSE_BEGIN
The Norwegian lives in the first house.
.TVCODE* 0 "% " "einstein.pl"
.TVCODE* 0 "The \l'.5i' owns the fish."
.CHOOSE4FT CR brit dane german swede
.CHOOSE_END
.LE
.SPACE 10i
.\".nr Ds 0
Multiple choice.
To the
.E= left
of each question,
write the letter that indicates your answer.
Write
.=E ` Z '
if you don't want to risk a wrong answer.
Wrong answers are worth negative points.
.nr MULTCHOICE_MAX 11
.SCORE_HERE \n[MULTCHOICE_MAX]
.P
.DS
.TS
tab(|); |l |r2w(.4i) |l1 r1 l |rw(.2i) l |.
_
number of||×|1|\&=||$= a$
correct answers
_
number of||×|\[12]|\&=||$= b$
wrong answers
_
number of|\0\0\0|×|0|\&=|0
missing answers
_
column total|\n[MULTCHOICE_MAX]|||||$= c$
$ c = max ( a - b , 0 ) $
_
.TE
.DE
.P
.ALX 1 . 4
.CHOOSE_BEGIN
Unification is used as part of the static type checking algorithm
used in
.CHOOSE4 C++ Ocaml Prolog Scheme
.CHOOSE_END
.CHOOSE_BEGIN
In C++, in order to make a member of a class available only
to other members of the same class and also to any derived class,
but not to any other classes, what keyword is used\(??
.CHOOSE4FT CB friend private protected public
.CHOOSE_END
.CHOOSE_BEGIN
In order to suppress a C++ constructor with one parameter being
used in automatic type conversion,
one precedes the definition of that constructor with what keyword\(??
.CHOOSE4FT CB automatic explicit implicit static
.CHOOSE_END
.CHOOSE_BEGIN
What is the type of
.VCODE* 0 "let f x y = y x;;"
.CHOOSE4FT CB "\&'a * 'b -> 'b * 'a" "\&'a -> 'b -> 'c -> 'a" \
"\&'a -> ('a -> 'b) -> 'b" "('a -> 'b) -> 'a -> 'b"
.CHOOSE_END
.CHOOSE_BEGIN
Which of these memory management mechanisms is most friendly to
the page tables\(??
.CHOOSE
copying collector with semispaces
.CHOOSE
explicit use of free
.CHOOSE
mark and sweep in-place collection
.CHOOSE
reference counting
.CHOOSE_END
.CHOOSE_BEGIN
The Ocaml function
.V= List.filter
is of type
.VCODE* 0 "('a -> bool) -> 'a list -> 'a list"
A function to extract positive integers from a list can
be defined as
.CHOOSE4FT CB "let pos = List.filter ((<)0)" \
"let pos = List.filter ((>)0)" "let pos = List.filter (0(<))" \
"let pos = List.filter (0(>))"
.CHOOSE_END
.CHOOSE_BEGIN
When an Ocaml function has a type like the following,
what kind of polymorphism is thus illustrated\(??
.VCODE* 0 "('a -> 'b) -> 'a list -> 'b list"
.CHOOSE4 coercion inclusion overloading parametric
.CHOOSE_END
.CHOOSE_BEGIN
Which of the following C++ functions will compile without
type-checking errors,
but return a dangling pointer when called\|?
.CHOOSE4FT CB \
"int  p() { int  x = 0; return x; }" \
"int &p() { int  x = 0; return x; }" \
"int *p() { int  x = 0; return x; }" \
"int *p() { int *x = 0; return x; }"
.CHOOSE_END
.CHOOSE_BEGIN
Suppose we have a generic associative container in C++ called
.V= hash .
What would be correct syntax for declaring such with keys as
strings and values as integers\(??
.CHOOSE4FT CB "hash <string, int> m;" "hash m <string, int>;" \
"hash m of string and int;" "m: (string * int) hash;"
.CHOOSE_END
.CHOOSE_BEGIN
Given the query
.V= car(L,X) ,
what Prolog statement will properly extract the first element of list
.V= L
and assign it to
.V= X \(??
.CHOOSE4FT CB "car( [Head | Tail], Tail)." "car( [Head | Tail], _)." \
"car( [Head | _], Head)." "car( [Head, Tail], Head)."
.CHOOSE_END
.CHOOSE_BEGIN
.CHOOSE4 2264 2462 4622 6224
.if dPSPIC \{
.   sp -10v
.   PSPIC -I 0.5i jpgs/hieroglyph-4622a.ps 0.6i
.\}
.CHOOSE_END
.LE
.DS
.SCORE_END
.DE
