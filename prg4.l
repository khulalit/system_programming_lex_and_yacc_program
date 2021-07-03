/* 
    Progam : Program to identify integer, float, Keyword, Operator, Single_line_comment, Multi_line_comment. .
    Author : Lalit
*/

%{
 #include<stdio.h>
 #include <iostream>
 using namespace std;
 int Keyword = 0;
 int Single_line_comment, Multi_line_comment, Identifier, Float , Operator = 0;
 int Integer= 0;
%}
%%
[0-9]* {printf("Integer\n");Integer++;}
[0-9]+\.[0-9]+ {printf("Float\n");Float++;}
int|float|if|else|printf|main|exit|switch|#include {printf("Keyword\n");Keyword++;}
[+|*|/|%|&|=] {printf("Operators\n");Operator++;}
"-" {printf("Operators\n"); Operator++;}
\/[\/]+.* {printf("Single line comment\n");Single_line_comment++;}
"/*"([^*]|\*+[^*/])*\*+"/" {printf("Multi line comment\n");Multi_line_comment++;}
[int|float|double]\s[a-zA-Z]*{0,30} {printf("Identifier\n");Identifier++;}
,\s*[a-zA-Z0-9]+|,\s*=\s*[a-zA-Z0-9]+ {printf("Identifier\n");Identifier++;}
[$] {return 0;}
.
%%
int main()
{
yyin = fopen("code.c","r");
yylex();
cout<<"No. of Integer : "<<Integer<<endl;
cout<<"No. of Float : "<<Float<<endl;
cout<<"No. of Keyword : "<<Keyword<<endl;
cout<<"No. of Operator : "<<Operator<<endl;
cout<<"No. of Single_line_comment : "<<Single_line_comment<<endl;
cout<<"No. of Multi_line_comment : "<<Multi_line_comment<<endl;
cout<<"No. of Identifier : "<<Identifier<<endl;

}
int yywrap(){
return 0;
}

/*
Writer's note: This program is using <iostream> so compile it with g++ compiler.
I am using '$' as end of file indicater , there is also a EOF in lex which can be used but that not working fine for me.
*/
