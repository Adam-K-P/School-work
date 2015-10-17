/* $Id: switch-sm.c,v 341.1 2004-03-04 18:31:48-08 - - $ */

typedef unsigned char ubyte;
typedef signed char   sbyte;
typedef unsigned int  uword;
typedef signed int    sword;
typedef void         *ugoto;

enum Opcode{
   NOP , DUP ,
   LDC0, LDCP, LDCN, LDC2, LDC4,
   LDL , LDL2, STL , STL2,
   ADD , SUB , MUL , DIV , REM ,
   AND , OR  , XOR , SLL , SRL , SRA ,
   NEG , POS , COM ,
   EQ  , NE  , LT  , LE  , GT  , GE  ,
   JMP ,
   JEQZ, JNEZ, JLTZ, JLEZ, JGTZ, JGEZ,
   JEQ , JNE , JLT , JLE , JGT , JGE ,
};

void interp(){
   register ubyte *ip;
   register sword *sp;
   register sword *fp;
   register sword tos; /* cache for *sp */

   #define SIP2()   ( (sbyte)ip[0]<<8 | (ubyte)ip[1] )
   #define SIP4()   ( SIMM2()<<16 | (ubyte)ip[2]<<8 | (ubyte)ip[3] )
   #define BREAK(I) { ip += (I); break; }

   for(;;){ switch( *ip++ ){
   default  : crash_and_burn(); return;
   case NOP : break;

   #define LOAD(E,I) { *sp++ = tos; tos = (E); BREAK(I); }
   case DUP : LOAD( tos       , 0 );
   case LDC0: LOAD( 0         , 0 );
   case LDCP: LOAD( *ip       , 1 );
   case LDCN: LOAD( *ip - 256 , 1 );
   case LDC2: LOAD( SIP2()    , 2 );
   case LDC4: LOAD( SIP4()    , 4 );
   case LDL : LOAD( fp[*ip   ], 1 );
   case LDL2: LOAD( fp[SIP2()], 2 );

   #define FILL(F) { sp -= (F); tos = *sp; }
   case STL : fp[*ip   ] = tos; FILL( 1 ); BREAK( 1 );
   case STL2: fp[SIP2()] = tos; FILL( 1 ); BREAK( 2 );

   #define BINOP(L,OP) { tos = (L) OP tos; break; }
   case ADD : BINOP( *--sp, + );
   case SUB : BINOP( *--sp, - );
   case MUL : BINOP( *--sp, * );
   case DIV : BINOP( *--sp, / );
   case REM : BINOP( *--sp, % );

   case AND : BINOP( *--sp, & );
   case OR  : BINOP( *--sp, | );
   case XOR : BINOP( *--sp, ^ );
   case SLL : BINOP( *--sp, << );
   case SRL : BINOP( (uword)(*--sp), >> );
   case SRA : BINOP( *--sp, >> );

   case EQ  : BINOP( *--sp, == );
   case NE  : BINOP( *--sp, != );
   case LT  : BINOP( *--sp, <  );
   case LE  : BINOP( *--sp, <= );
   case GT  : BINOP( *--sp, >  );
   case GE  : BINOP( *--sp, >= );

   #define UNOP(OP) { tos = OP tos; break; }
   case NEG : UNOP( - );
   case POS : UNOP( + );
   case COM : UNOP( ~ );

   #define CJUMP(C,F) { if(C) ip += SIP2(); FILL( F ); BREAK( 2 ); }
   case JMP : CJUMP( 0      == 0  , 0 );

   case JEQZ: CJUMP( tos    == 0  , 1 );
   case JNEZ: CJUMP( tos    != 0  , 1 );
   case JLTZ: CJUMP( tos    <  0  , 1 );
   case JLEZ: CJUMP( tos    <= 0  , 1 );
   case JGTZ: CJUMP( tos    <  0  , 1 );
   case JGEZ: CJUMP( tos    >= 0  , 1 );

   case JEQ : CJUMP( sp[-1] == tos, 2 );
   case JNE : CJUMP( sp[-1] != tos, 2 );
   case JLT : CJUMP( sp[-1] <  tos, 2 );
   case JLE : CJUMP( sp[-1] <= tos, 2 );
   case JGT : CJUMP( sp[-1] <  tos, 2 );
   case JGE : CJUMP( sp[-1] >= tos, 2 );

case 44: tos = 44; break; /* foobar */
case 45: tos = 45; break; /* foobar */
case 46: tos = 46; break; /* foobar */
case 47: tos = 47; break; /* foobar */
case 48: tos = 48; break; /* foobar */
case 49: tos = 49; break; /* foobar */
case 50: tos = 50; break; /* foobar */
case 51: tos = 51; break; /* foobar */
case 52: tos = 52; break; /* foobar */
case 53: tos = 53; break; /* foobar */
case 54: tos = 54; break; /* foobar */
case 55: tos = 55; break; /* foobar */
case 56: tos = 56; break; /* foobar */
case 57: tos = 57; break; /* foobar */
case 58: tos = 58; break; /* foobar */
case 59: tos = 59; break; /* foobar */
case 60: tos = 60; break; /* foobar */
case 61: tos = 61; break; /* foobar */
case 62: tos = 62; break; /* foobar */
case 63: tos = 63; break; /* foobar */
case 64: tos = 64; break; /* foobar */
case 65: tos = 65; break; /* foobar */
case 66: tos = 66; break; /* foobar */
case 67: tos = 67; break; /* foobar */
case 68: tos = 68; break; /* foobar */
case 69: tos = 69; break; /* foobar */
case 70: tos = 70; break; /* foobar */
case 71: tos = 71; break; /* foobar */
case 72: tos = 72; break; /* foobar */
case 73: tos = 73; break; /* foobar */
case 74: tos = 74; break; /* foobar */
case 75: tos = 75; break; /* foobar */
case 76: tos = 76; break; /* foobar */
case 77: tos = 77; break; /* foobar */
case 78: tos = 78; break; /* foobar */
case 79: tos = 79; break; /* foobar */
case 80: tos = 80; break; /* foobar */
case 81: tos = 81; break; /* foobar */
case 82: tos = 82; break; /* foobar */
case 83: tos = 83; break; /* foobar */
case 84: tos = 84; break; /* foobar */
case 85: tos = 85; break; /* foobar */
case 86: tos = 86; break; /* foobar */
case 87: tos = 87; break; /* foobar */
case 88: tos = 88; break; /* foobar */
case 89: tos = 89; break; /* foobar */
case 90: tos = 90; break; /* foobar */
case 91: tos = 91; break; /* foobar */
case 92: tos = 92; break; /* foobar */
case 93: tos = 93; break; /* foobar */
case 94: tos = 94; break; /* foobar */
case 95: tos = 95; break; /* foobar */
case 96: tos = 96; break; /* foobar */
case 97: tos = 97; break; /* foobar */
case 98: tos = 98; break; /* foobar */
case 99: tos = 99; break; /* foobar */
case 100: tos = 100; break; /* foobar */
case 101: tos = 101; break; /* foobar */
case 102: tos = 102; break; /* foobar */
case 103: tos = 103; break; /* foobar */
case 104: tos = 104; break; /* foobar */
case 105: tos = 105; break; /* foobar */
case 106: tos = 106; break; /* foobar */
case 107: tos = 107; break; /* foobar */
case 108: tos = 108; break; /* foobar */
case 109: tos = 109; break; /* foobar */
case 110: tos = 110; break; /* foobar */
case 111: tos = 111; break; /* foobar */
case 112: tos = 112; break; /* foobar */
case 113: tos = 113; break; /* foobar */
case 114: tos = 114; break; /* foobar */
case 115: tos = 115; break; /* foobar */
case 116: tos = 116; break; /* foobar */
case 117: tos = 117; break; /* foobar */
case 118: tos = 118; break; /* foobar */
case 119: tos = 119; break; /* foobar */
case 120: tos = 120; break; /* foobar */
case 121: tos = 121; break; /* foobar */
case 122: tos = 122; break; /* foobar */
case 123: tos = 123; break; /* foobar */
case 124: tos = 124; break; /* foobar */
case 125: tos = 125; break; /* foobar */
case 126: tos = 126; break; /* foobar */
case 127: tos = 127; break; /* foobar */
case 128: tos = 128; break; /* foobar */
case 129: tos = 129; break; /* foobar */
case 130: tos = 130; break; /* foobar */
case 131: tos = 131; break; /* foobar */
case 132: tos = 132; break; /* foobar */
case 133: tos = 133; break; /* foobar */
case 134: tos = 134; break; /* foobar */
case 135: tos = 135; break; /* foobar */
case 136: tos = 136; break; /* foobar */
case 137: tos = 137; break; /* foobar */
case 138: tos = 138; break; /* foobar */
case 139: tos = 139; break; /* foobar */
case 140: tos = 140; break; /* foobar */
case 141: tos = 141; break; /* foobar */
case 142: tos = 142; break; /* foobar */
case 143: tos = 143; break; /* foobar */
case 144: tos = 144; break; /* foobar */
case 145: tos = 145; break; /* foobar */
case 146: tos = 146; break; /* foobar */
case 147: tos = 147; break; /* foobar */
case 148: tos = 148; break; /* foobar */
case 149: tos = 149; break; /* foobar */
case 150: tos = 150; break; /* foobar */
case 151: tos = 151; break; /* foobar */
case 152: tos = 152; break; /* foobar */
case 153: tos = 153; break; /* foobar */
case 154: tos = 154; break; /* foobar */
case 155: tos = 155; break; /* foobar */
case 156: tos = 156; break; /* foobar */
case 157: tos = 157; break; /* foobar */
case 158: tos = 158; break; /* foobar */
case 159: tos = 159; break; /* foobar */
case 160: tos = 160; break; /* foobar */
case 161: tos = 161; break; /* foobar */
case 162: tos = 162; break; /* foobar */
case 163: tos = 163; break; /* foobar */
case 164: tos = 164; break; /* foobar */
case 165: tos = 165; break; /* foobar */
case 166: tos = 166; break; /* foobar */
case 167: tos = 167; break; /* foobar */
case 168: tos = 168; break; /* foobar */
case 169: tos = 169; break; /* foobar */
case 170: tos = 170; break; /* foobar */
case 171: tos = 171; break; /* foobar */
case 172: tos = 172; break; /* foobar */
case 173: tos = 173; break; /* foobar */
case 174: tos = 174; break; /* foobar */
case 175: tos = 175; break; /* foobar */
case 176: tos = 176; break; /* foobar */
case 177: tos = 177; break; /* foobar */
case 178: tos = 178; break; /* foobar */
case 179: tos = 179; break; /* foobar */
case 180: tos = 180; break; /* foobar */
case 181: tos = 181; break; /* foobar */
case 182: tos = 182; break; /* foobar */
case 183: tos = 183; break; /* foobar */
case 184: tos = 184; break; /* foobar */
case 185: tos = 185; break; /* foobar */
case 186: tos = 186; break; /* foobar */
case 187: tos = 187; break; /* foobar */
case 188: tos = 188; break; /* foobar */
case 189: tos = 189; break; /* foobar */
case 190: tos = 190; break; /* foobar */
case 191: tos = 191; break; /* foobar */
case 192: tos = 192; break; /* foobar */
case 193: tos = 193; break; /* foobar */
case 194: tos = 194; break; /* foobar */
case 195: tos = 195; break; /* foobar */
case 196: tos = 196; break; /* foobar */
case 197: tos = 197; break; /* foobar */
case 198: tos = 198; break; /* foobar */
case 199: tos = 199; break; /* foobar */
case 200: tos = 200; break; /* foobar */
case 201: tos = 201; break; /* foobar */
case 202: tos = 202; break; /* foobar */
case 203: tos = 203; break; /* foobar */
case 204: tos = 204; break; /* foobar */
case 205: tos = 205; break; /* foobar */
case 206: tos = 206; break; /* foobar */
case 207: tos = 207; break; /* foobar */
case 208: tos = 208; break; /* foobar */
case 209: tos = 209; break; /* foobar */
case 210: tos = 210; break; /* foobar */
case 211: tos = 211; break; /* foobar */
case 212: tos = 212; break; /* foobar */
case 213: tos = 213; break; /* foobar */
case 214: tos = 214; break; /* foobar */
case 215: tos = 215; break; /* foobar */
case 216: tos = 216; break; /* foobar */
case 217: tos = 217; break; /* foobar */
case 218: tos = 218; break; /* foobar */
case 219: tos = 219; break; /* foobar */
case 220: tos = 220; break; /* foobar */
case 221: tos = 221; break; /* foobar */
case 222: tos = 222; break; /* foobar */
case 223: tos = 223; break; /* foobar */
case 224: tos = 224; break; /* foobar */
case 225: tos = 225; break; /* foobar */
case 226: tos = 226; break; /* foobar */
case 227: tos = 227; break; /* foobar */
case 228: tos = 228; break; /* foobar */
case 229: tos = 229; break; /* foobar */
case 230: tos = 230; break; /* foobar */
case 231: tos = 231; break; /* foobar */
case 232: tos = 232; break; /* foobar */
case 233: tos = 233; break; /* foobar */
case 234: tos = 234; break; /* foobar */
case 235: tos = 235; break; /* foobar */
case 236: tos = 236; break; /* foobar */
case 237: tos = 237; break; /* foobar */
case 238: tos = 238; break; /* foobar */
case 239: tos = 239; break; /* foobar */
case 240: tos = 240; break; /* foobar */
case 241: tos = 241; break; /* foobar */
case 242: tos = 242; break; /* foobar */
case 243: tos = 243; break; /* foobar */
case 244: tos = 244; break; /* foobar */
case 245: tos = 245; break; /* foobar */
case 246: tos = 246; break; /* foobar */
case 247: tos = 247; break; /* foobar */
case 248: tos = 248; break; /* foobar */
case 249: tos = 249; break; /* foobar */
case 250: tos = 250; break; /* foobar */
case 251: tos = 251; break; /* foobar */
case 252: tos = 252; break; /* foobar */
case 253: tos = 253; break; /* foobar */
case 254: tos = 254; break; /* foobar */
case 255: tos = 255; break; /* foobar */

   } }
}
