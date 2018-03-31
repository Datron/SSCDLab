%{
	#include<stdio.h>
	#include<string.h>
	int noper = 0, noperand = 0,top = 0,i = 0,j = 0;
	char opnd[10][10],opert[10][10];
%}
%%
"(" {top++;}
")" {top--;}
"+"|"*" {noper++;strcpy(opert[i],yytext);i++;}
[0-9]+ {noperand++;strcpy(opnd[j],yytext);j++;}
%%

void main(){
	int k;
	printf("Enter the expression:\n");
	yylex();
	if(top == 0 && (noperand - noper) == 1) {
		printf("The expression is valid \n");
		printf("The operators are: \n");
		for(k=0;k<i;k++)
			printf("%s\n",opert[k]);
		printf("The identifiers are \n");
		for(k=0;k<j;k++)
			printf("%s\n",opnd[k]);
	}
	else
		printf("expression is invalid\n");
}
