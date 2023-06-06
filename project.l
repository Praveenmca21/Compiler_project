/* Definition Section*/

%{
// file required by GCC yfile_name.tab.h that  contains the definitions that scanner needs.

#include "y.tab.h"
%}

/* Rules Section*/

identifier  [a-zA-Z_][a-zA-Z0-9_-]*
number      [0-9]+
string      (\"([^"\\]|\\.)*\")
ws          [ \t]+
/* returning specified tokens for matched strings based on rules defined on left side */

%%
{identifier}        { return IDENTIFIER; }
{number}            { return LITERAL; }
"="                 { return EQUAL; }
";"                 { return SEMICOLON; }
","                 { return COMMA; }
"{"                 { return LBRACES; } 
"}"                 { return RBRACES; } 
"["                 { return LSQBRACKET; }
"]"                 { return RSQBRACKET; }
":"                 { return COLON; }
"\n"                { return EOL; }
{string}            { return LITERAL; }
{ws}                { /* ignore whitespace */ }
.                   { /* ignore unknown characters */ }

%%

/* Auxiliary functions*/
//yywrap is called by lex when input is exhausted 
//Return 1 if  done

int yywrap(){
    return 1;
}
