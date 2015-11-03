
%start S
%token a b c d

%%

S : A a ;
S : b A c ;
S : B c ;
S : b B a ;
A : d ;
B : d ;

%%

