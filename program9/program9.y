/*
    Progam 9 : 	Write a YACC program to find the validity of a given expression( for operator + - * and / ). A program in YACC which recognizes a valid variable which starts with letter followed by a digit. The letter should be in lowercase only.


    Author : Lalit
*/
%{
#include<stdio.h>
#include<stdlib.h>
int yylex(void);
int yyerror(char *);
/*
    E production is to check if enterd identifier is valid or not ie letters then digits (as per question )
    E->letterT
    T->letterT|digit

    Now for vaid expresion S production taking care of it
    S->E (a single variable is also a valid expression means uniary)
        | S operator S and so on .................
    and newline when user press enter then show result
    Here, numberig ie valid Expression 0/1/2 etc are just for debugging purpose ie to check which production is used
*/
%}
//tokens letter digit new line operator openbracket closebracket
%token letter digit newline operator minus ob cb
// for left associativity 
%left '+' '-'                                          
%left '*' '/'
%%
 

S : E { printf("Valid Identifiers 1\n");printf("Final result : valid Expression \n");exit(0);};
    | S operator S newline {printf("Final result :  valid Expression \n");exit(0);}
    | S minus S newline {printf("Final result : valid Expression \n"); exit(0);}
    | minus S newline {printf("Final result : valid Expression \n"); exit(0);}
    | S operator ob minus S cb {printf("Final result : valid Expression \n"); exit(0);}
    | S operator ob S cb {printf("Final result : valid Expression \n"); exit(0);}
    | ob S ob {printf("Final result : valid Expression \n"); exit(0);}
    ;

E : letter T {printf("variable letter\n");};


T: letter T {printf("letter term\n");}| digit {printf("digit\n");};





%%

int yyerror(char *msg)
{
printf("Invalid Expression or identifier\n");
exit(0);
}

int main ()
{
    // main method
printf("Enter the expression: ");
yyparse();
}