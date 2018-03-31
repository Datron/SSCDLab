%{
    #include<stdio.h>
    #include "y.tab.h"
%}

%%
'#' return PRE;
int|char|bool|float|void|for|do|while|if|else|return|void|main {printf("Keyword is %s\n",yytext);return KEY;}
[+|-|*|/|=|<|>] {printf("Operator is %s\n",yytext);return OP;}
[a-zA-Z][a-zA-Z0-9]* {printf("identifier is %s\n",yytext);return ID;}
%%
