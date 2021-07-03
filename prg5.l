/* 
    Progam : Program to print no. of identifiers.
    Author : Lalit
*/
%{
#include <stdio.h>
int count=0;
%}

%% 
[int|float|double]\s[a-zA-Z]*{0,30} {printf("Identifier\n");count++;}
,\s*[a-zA-Z0-9]+|,\s*=\s*[a-zA-Z0-9]+ {printf("Identifier\n");count++;}

. 
%%
int main()
{
yyin=fopen("code.c","r");
yylex();
printf("No of identifiers : %d\n",count);
return 0;
}
int yywrap(){
return 1;
}