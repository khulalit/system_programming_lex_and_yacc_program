%{
#include "y.tab.h"
%}
alpha [a]{10,}
beta [b]
newline [\n]
%%
{alpha} { return alpha ;}
{beta} {return beta;}
{newline} { return newline ;}
. { printf("Invalid Expression\n");exit(0); }
%%

int yywrap(){
    return -1;
}