typedef unsigned char uchar;
typedef unsigned short ushort;
typedef unsigned int uint;

enum Opcode{ ADD, SUB, MUL, DIV, REM, AND, OR, XOR, SLL, SRL };

void interp(){
   register short *ip;
   register int *fp;
   register int r1, r2;
   register ushort ir;
   for(;;){
      ir = *(ushort*)ip++;

      switch( ir>>6&7 ){
         case 0: r1 = 0; break;
         case 1: r1 = *ip++; break;
         case 2: r1 = fp[*ip++]; break;
         case 3: r1 = ((int*)fp[*ip])[*(ip+1)]; ip+=2; break;
         case 4: break;
         case 5: break;
         case 6: break;
         case 7: break;
      };

      switch( ir>>3&7 ){
         case 0: r2 = 0; break;
         case 1: r2 = *ip++; break;
         case 2: r2 = fp[*ip++]; break;
         case 3: r2 = ((int*)fp[*ip])[*(ip+1)]; ip+=2; break;
         case 4: break;
         case 5: break;
         case 6: break;
         case 7: break;
      };

      switch( ir>>9 ){
         case ADD: r1 = r1 + r2; break;
         case SUB: r1 = r1 - r2; break;
         case MUL: r1 = r1 * r2; break;
         case DIV: r1 = r1 / r2; break;
         case REM: r1 = r1 % r2; break;
         case AND: r1 = r1 & r2; break;
         case OR : r1 = r1 | r2; break;
         case XOR: r1 = r1 ^ r2; break;
         case SLL: r1 = r1 << r2; break;
         case SRL: r1 = (uint)r1 >> r2; break;
      };

      switch( ir&7 ){
         case 0: break;
         case 1: break;
         case 2: fp[*ip++] = r1; break;
         case 3: ((int*)fp[*ip])[*(ip+1)] = r1; ip+=2; break;
         case 4: break;
         case 5: break;
         case 6: break;
         case 7: break;
      };
   };
}
