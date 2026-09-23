%{
#include<stdio.h>

int lines = 0;
int word = 0;
int chars = 0;
%}

%%
\n { lines++; chars++; }
[\t]+ { chars += yyleng; }
[^ \t\n]+ { word++; chars += yyleng; }
%%

int main()
{
    printf("enter the text\n");
    yylex();

    printf("lines:%d\n", lines);
    printf("words:%d\n", word);
    printf("characters:%d\n", chars);

    return 0;
}

int yywrap()
{
    return 1;
}