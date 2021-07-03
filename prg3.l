
/* 
    Progam : Program to find longest word .
    Author : Lalit
*/
%{
#include<stdio.h>
#include<strings.h>
// initialising length
int length=0;
// char array for storing longest word
char longestword[50];
%}

%%
[A-Za-z0-9]+ { if (yyleng > length) {

		length=yyleng;
        // strcpy function to copy current word in yytxt in longest
		strcpy(longestword,yytext);
		}
	}
"." return 1;
%%
int main()
{
printf("Enter the text. You can enter text in multiple line also.\n\nEnter dot ie '.' to exit and see result.\n");
yylex();
printf("Longest word : %s\n",longestword);
//printf("Length of Longest word : %s\n",length);

return 0;
}
int yywrap(){
    return 1;
}