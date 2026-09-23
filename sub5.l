%{
#include "y.tab.h"
%}

%%
[0-9]+                  { return DIGIT; }
[a-zA-Z][_a-zA-Z0-9]*   { return ALPHA; }
\n                      { return 0; }
.                       { return yytext[0]; }
%%