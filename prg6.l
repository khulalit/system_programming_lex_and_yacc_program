/* 
    Progam : Program to identify integer, float, Keyword, Operator, Single_line_comment, Multi_line_comment. .
    Author : Lalit
*/
%{
// header file 
#include<stdio.h>

// initializing the variables
int c=0, w=0, s=0, l=0;

%}

WORD  [^   t\n,\.:]+

EOL  [\n]

BLANK  [" "]

%%

{WORD} {w++; c=c+yyleng;}

{BLANK} {s++;}

{EOL} {l++;}

.  {c++;}

%%
// yywrap function 
int yywrap()

{
return 1; // returning 1 so that after the analysis of the file stop analysis

}
// main function with cmd line argument for source code file
int main(int argc, char *argv[])

{

if(argc!=2) // checking if valid argument is passed or not , argc gives argument count

{

printf("Usage: <./a.out> <sourcefile>\n"); // message printing if wrong argument is passed

exit(0);

}

yyin=fopen(argv[1],"r"); // opening the file which is passed as argument

yylex();// yylex function doing lexical analysis 

printf("No of characters=%d\nNo of words=%d\nNo of spaces=%d\n No of lines=%d\n",c+s,w,s,l);// printing output 

}
/*
  --------------------------------------------------
  | Note: program is not treating space as character .Provide file name in cla|
  --------------------------------------------------
*/
