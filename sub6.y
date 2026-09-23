%{
#include <stdio.h>
int yylex();
int flag = 0;
%}

%token NUMBER

%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%%
ArithmeticExpression : E
{
    printf("\nResult=%d\n", $1);
    return 0;
};

E : E '+' E
    {
        $$ = $1 + $3;
    }
  | E '-' E
    {
        $$ = $1 - $3;
    }
  | E '*' E
    {
        $$ = $1 * $3;
    }
  | E '/' E
    {
        $$ = $1 / $3;
    }
  | E '%' E
    {
        $$ = $1 % $3;
    }
  | '(' E ')'
    {
        $$ = $2;
    }
  | NUMBER
    {
        $$ = $1;
    }
;

%%

void main()
{
    printf("enter expression\n");
    yyparse();

    if(flag == 0)
        printf("valid");
}

void yyerror()
{
    printf("invalid");
    flag = 1;
}