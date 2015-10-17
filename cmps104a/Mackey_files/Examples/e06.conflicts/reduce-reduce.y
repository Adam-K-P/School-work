// $Id: reduce-reduce.y,v 1.3 2011-10-28 18:41:59-07 - - $

// Example of a reduce/reduce conflict.

%verbose

%token CHAR INT IDENT
%start program

%%

program     : program statement
            |
            ;

statement   : declaration ';'
            | expression ';'
            ;

declaration : basetype '[' ']' IDENT
            | basetype IDENT
            ;

basetype    : CHAR
            | INT
            | IDENT
            ;

expression  : expression '[' expression ']'
            | IDENT
            ;

%%

