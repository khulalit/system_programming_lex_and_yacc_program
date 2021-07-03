/* 
    Progam : Write a Lex specification program that generates a C program which takes a string “abcd” and prints the following output:
                abcd
                abc
                ab
                a
    Author : Lalit
*/
%{
    //including header file
    #include <stdio.h>
%}
%%
[A-Za-z ]+ {
        // int lenght=yyleng; //getting the length of the string
        int row=yyleng;    // creating the variable for running loop row
        printf("\n");   // printing new line
        while(row>=0)  // running loop lenght of the string times 
	    {
            int col=0; // col variable printing column of rows 
            while(col<row)  // running loop
            {
                printf("%c",yytext[col]); // printing the text
                col++; // incrementing col for printing the text in char array yytext
            } 
            printf("\n");//  again printing new line
            row--; // decrementing the the row to get to next row
	   }
}
"\n" {return 0;} 
%%
int main()
{
printf("Enter the string : "); // message for the user to print
yylex(); // analysis 

return 0; // return statement of main function
}
int yywrap(){ // yywrap function 
    return 1; //return statement of yywrap function
}