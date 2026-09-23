%{
#include<stdio.h>

int vowels = 0;
int consonants = 0;
%}

%%
[AEIOUaeiou] { vowels++; }
[a-zA-Z] { consonants++; }
\n {}
. {}
%%

int main()
{
    printf("enter the text\n");
    yylex();

    printf("vowels:%d\n", vowels);
    printf("consonants:%d\n", consonants);

    return 0;
}

int yywrap()
{
    return 1;
}