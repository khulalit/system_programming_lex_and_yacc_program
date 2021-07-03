/*
    Program 10 : Write a Program in YACC to evaluate an expression (simple calculator program for addition and subtraction, multiplication, division).
    Author : Lalit
*/
%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'
%{
#include <stdio.h>
 void yyerror(char *);
 int yylex(void);
 int sym[26];
%}
%%
program:
 program statement '\n'
 |
 ;
statement:
 expr { printf("Expresssion is Valid and result is : %d\n", $1); }
 ;
expr:
 INTEGER
 | expr '+' expr { $$ = $1 + $3; }
 | expr '-' expr { $$ = $1 - $3; }
 | expr '*' expr { $$ = $1 * $3; }
 | expr '/' expr { $$ = $1 / $3; }
 | '(' expr ')' { $$ = $2; }
 ;
%%
void yyerror(char *s) {
 printf( "Invalid Expresssion : %s\n", s);
}
int main(void) {
printf("Enter the Expresssion: \n");
printf("Press Enter to see result.\nPress $ to end.\n");
 yyparse();
 return 0;
}