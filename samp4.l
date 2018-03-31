%{
#include<stdio.h>
%}

sign [+-]?
digit [0-9]+
exp ([eE]{sign}{digit})
%%
\+?{digit} printf("positive number");
\-?{digit} printf("negative number");
{sign}{digit}?\.{digit} printf("Decimal number");
{sign}{digit}(\.{digit})?{exp} printf("Exponential number");
%%
