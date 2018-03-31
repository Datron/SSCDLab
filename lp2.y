%{
    #include<stdio.h>
    int count = 0,n;
%}
%token A
%token B
%%
S: T B {
    if (count !=n){
        yyerror();
    }
}
Aa: A {count++;}
T: Aa | T Aa ;
%%
int main(){
    printf("Enter the value of n\n");
    scanf("%d",&n);
    printf("Enter the string:");
    yyparse();
    printf("valid String\n");
}
void yyerror(){
    printf("Invalid String\n");
    exit(0);
}