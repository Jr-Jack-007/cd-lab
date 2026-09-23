%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror();
%}

%token NUMBER ID

%left '+' '-'
%left '*' '/'

%%
exp : exp '+' exp
    | exp '-' exp
    | exp '*' exp
    | exp '/' exp
    | '(' exp ')'
    | '{' exp '}'
    | '[' exp ']'
    | NUMBER
    | ID
    ;
%%

int main(int argc, char *argv[])
{
    printf("enter expression");
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