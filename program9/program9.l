%{
#include "y.tab.h"
%}
letter [a-z]
digit [0-9]
newline [\n]
%%
{letter} { return letter ;}
{digit} { return digit ; }
{newline} { return newline ;}
['+'|'*'|'/'] {return operator;}
['\-'] {return minus;}
['('] {return ob;}
[')'] {return cb;}
. { printf("Invalid Variable\n");}
%%
int yywrap(){
    return 1;
}
