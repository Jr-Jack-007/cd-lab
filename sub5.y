%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
%}

%token DIGIT ALPHA

%%
var : ALPHA
    | var ALPHA
    | var DIGIT
    ;
%%

int main(int argc, char *argv[])
{
    printf("enter variable name");
    yyparse();
    printf("valid\n");
    return 0;
}

int yyerror()
{
    printf("invalid");
    exit(1);
}

int yywrap()
{
    return 1;
}