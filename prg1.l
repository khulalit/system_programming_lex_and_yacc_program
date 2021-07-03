/* 
    Progam : Write a Lex program to count the number of vowels and consonants in a given string
    Author : Lalit 
*/
%{
#include<stdio.h>
int vcount=0,ccount=0;
%}
%%
[a|i|e|o|u|E|A|I|O|U] {vcount++; }
[a-zA-Z(^a|i|e|o|u|E|A|I|O|U)] {ccount++;}
\n {printf("No. of Vowels :%d\n",vcount);vcount=0;printf("No. of Consonants :%d\n",ccount);ccount =0;return 0;}

%%
int main()
{
    yylex();
    
    printf("Bye ...\n"); 
    return 0;
}
int yywrap(){
    return 1;
}


