/*
    Program 11 : for CFG a^nb^n
    Author : Lalit

    cfg for this program is
    S -> aSb | ^
    
*/

%{
    // header file 
#include<stdio.h>
#include<stdlib.h>
// string 
#include<strings.h>

void yyerror(char *);
int yylex(void);
%}
// token alpha for a 
// token beta for b
%token alpha beta newline
%%
line : term newline {printf("Expression is Valid\n"); exit(0);};
term: alpha term beta | ;
%%

void yyerror(char *msg)
{
printf("Invalid Expression\n");
exit(0);
}

int main ()
{
printf("Enter the expresssion for cfg a^nb^n : ");
yyparse();
}