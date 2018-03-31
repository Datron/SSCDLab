%{
	#include<stdio.h>
	char* ch;
%}
%%
[a-z] {ch = yytext;
	while(*ch != '\n'){*ch=toupper((unsigned char)*ch);ch++;}
	printf("%s",ch);}
%%

void main() {
	printf("Enter a string");
	yyin = fopen("input.txt","r");
	yylex();
}
