%%
"rama" {fprintf(yyout,"RAMA",yytext);}
"sita" {fprintf(yyout,"SITA",yytext);}
%%

void main(int argc, char** argv){
	if(argc!=3){
		printf("Error");
		exit(0);
	}
	yyin = fopen("input.txt","r");
	yyout = fopen("out.txt","w");
	yylex();
}
