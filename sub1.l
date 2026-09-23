%{
#include<stdio.h>
%}

%%
"int"|"float"|"char"|"if"|"else"|"while"|"for"|"return" { printf("keyword:%s\n", yytext); }
[0-9]+ { printf("Numbers:%s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("identifiers:%s\n", yytext); }
"+"|"-"|"*"|"/"|"="|"=="|"<"|">"|"<="|">=" { printf("operator:%s\n", yytext); }
[{}();,] { printf("special symbol:%s\n", yytext); }
[\t\n] { printf("unknown:%s\n", yytext); }
. {}

%%

int yywrap()
{
    return 1;
}

int main()
{
    printf("enter the text\n");
    yylex();
    return 0;
}