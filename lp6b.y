%{
    #include<stdio.h>
    #include<stdlib.h>
    int id=0,key=0,op=0;
%}
%token ID KEY OP PRE
%%
input: ID input {id++;}
        |KEY input {id++;}
        |OP input {id++;}
        |ID {id++;}
        |KEY {id++;}
        |OP {id++;}
;
%%
#include<stdio.h>
extern FILE* yyin;
main(int argc,char** argv){
    FILE* myFile = fopen(argv[1],"r");
    if(!myFile){
        printf("File Not found\n");
        exit(0);
    }
    yyin = myFile;
    yyparse();
    printf("Keywords=%d\n Identifiers=%d\n Operators=%d\n",key,id,op);
}
void yyerror(){
    printf("Not valid\n");
    exit(0);
}