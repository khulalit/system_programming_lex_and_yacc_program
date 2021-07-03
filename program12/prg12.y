/*
    Program 12 : for CFG a^nb n>=10
    Author : Lalit

    cfg for this program is
    S -> aaaaaaaaaaaTb
    T -> aT | ^
    
*/


%{
#include<stdio.h>
#include<stdlib.h>
#include<strings.h>
void yyerror(char *);
 int yylex(void);
%}
%token alpha beta newline
%%
line : term beta newline {printf("Expression is Valid\n"); exit(0);};
term: alpha term | ;
%%

void yyerror(char *msg)
{
printf("Invalid Expression\n");
exit(0);
}

int main ()
{
printf("Enter the expresssion for a then b, a should be atlest 10 (a^nb where n>=10e): ");
yyparse();
} 