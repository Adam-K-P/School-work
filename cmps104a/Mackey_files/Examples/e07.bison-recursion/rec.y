/*
* Left vs Right recursion on the stack.
* grammar recognizes a string of `L's or `R's.
* Usage:  a.out L
*    or:  a.out R
*/

%{
#define YYDEBUG 1
%}

%%

program : left '>'
        | '(' right
        ;

left    : left 'L'
        | '<'
        ;

right   : 'R' right
        | ')'
        ;

%%

char *input = "";
int yylex(){ return *input++; }
int yyerror( char *msg ){ printf( "%s\n", msg ); }

int main( int argc, char **argv ){
   switch( argv[1] ? *argv[1] : 0 ){
      case 'L': input = "<LLLLLLLL>"; break;
      case 'R': input = "(RRRRRRRR)"; break;
   };
   printf( "Parsing ``%s''\n", input );
   yydebug = 1;
   yyparse();
}

