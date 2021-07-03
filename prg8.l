/* 
    Progam : Lex program to recognize a valid arithmetic expression. (Lab 7-8)
    Author : Lalit
    Note   : Anybody can use this progarm for any perpose, feel free to do what ever you want with this progarm.
*/
%{
    // header file 
#include<stdio.h>
 
/*--------------------------------------------------------
----------------------------------------
Last updated on 10-10-2020
Three issue are solved.
Now this program is not maintained anymore.
If you want to you can fork it and maintain it.
-----------------------------------------
1) opeartorcount for counting operator
2) intcout for counting integer(operand)
3) bcheck for checking brackets 
4) flag1 for explicietly validating Unary operation ie -6 , -7 etc
5) flag2 for explicietly validating the operations like 6--7 etc
Logic : here for checking brackets if opening ( found then bcheck set to 0 and if close ) foung the bcheck set to 1

For operator : operator should be one greator than the operand 
For -6 : we giving regex for that 
For too many operator between operand : we given regex and checking it in the if statment
---------------------------------------------------------|*/
// variables
int operatorcount=0,intcount=0,bcheck=1;
int flag1  = 0;
int flag2 = 0;
int flag3 = 0;
int flag4 = 0;
int flag5 = 0;
int countb = 0;
%}
%%
['('] {bcheck=0; countb=countb+1;}
[')'] {bcheck=1; countb=countb+1;}
[+|*|/|-] {operatorcount++;}
[0-9a-zA-Z]+ {intcount++;}
"-"[0-9a-zA-Z] {flag1 = 1;}
[-]{2} {flag2 = 1;printf("flag is now 1\n");}
[+]{2} {flag2 = 1;printf("flag is now 1\n");}
[*]{2} {flag2 = 1;printf("flag is now 1\n");}
[/]{2} {flag2 = 1;printf("flag is now 1\n");}
[(]\s*[)] {flag3 = 1;printf("encounterd empty brackets\n");}
[(][*|/][0-9a-zA-Z]+[)] {flag4 = 1;}
[)][0-9a-zA-Z]+[+|*|/|-][0-9a-zA-Z]+[)] {flag5=1;}
"\n" {return 0;}
. {printf("Invalid Input(only digits and +|-|*|/ is valid\n");}
%%
int isOdd(int number){
    if(number%2==0){
        return 1;
    }
    else{
        return 0;
    }
}
int main()
{
printf("Enter expression : \n"); // prompting to get expression
// yyin = fopen("expression.txt", "r");
yylex(); // starting lex analysis
// int vcount = opcount+1;
if(intcount==operatorcount+1 || flag1 == 1) // checking if operator is one greator than operand or flag1 ie -int case is true
{
 if(bcheck==1) // checking for ()
 {
    if(flag2==1){
        printf("Expression is INCORRECT!\n"); // checking for if there are too many operator in operand
    }
    else{
        if(isOdd(countb)==0|| flag3==1||flag4==1 || flag5 ==1){
            printf("Expression is INCORRECT!\n");
        }
        else{
            printf("Expression is CORRECT!\n");
        }
        
        
    }
    
 }
 else{
    printf("INCORRECT ')' bracket missing from expression\n");
 }
} 
else{
   printf("Expression is INCORRECT!\n");
}
return 0;// just return statment
}
int yywrap(){
    return 1;
}