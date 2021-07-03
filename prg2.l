
/* 
    Progam : Write a Lex program that implements the Caesar cipher.
    
    Author : Lalit
*/
%{
    #include<stdio.h>
    int shift;
%}

%%
[a-z] {char ch = yytext[0];
ch += shift;
if (ch> 'z') ch -= 26;
printf ("%c" ,ch );
}
[A-Z] { char ch = yytext[0] ;
ch += shift;
if (ch> 'Z') ch -= 26;
printf("%c",ch);
}
. {exit(0);}
%%

int main()
{
    printf("Enter an no. of alphabet to shift: \n");  
    
    scanf("%d", &shift);
    printf("Enter the string: \n");
    yylex();
    
    
    return 0;
}
int yywrap(){
    return 1;
}