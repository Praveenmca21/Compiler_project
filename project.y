/* Definition section */

%{
#include <stdio.h>  // used for standard input output
#include <stdlib.h> //header file provides declarations for several functions that are used for memory allocation
#include <string.h> // header file provides declarations for several functions 
extern int yylex(); // including this would eliminate the warnings about yylex
void yyerror(char *); //discussed below
%}

//defining tokens

%token IDENTIFIER EQUAL COMMA SEMICOLON LBRACES RBRACES LSQBRACKET RSQBRACKET COLON LITERAL EOL

//grammar productions and the actions for each production

%%
stmt :  listdict EOL { printf("Valid statement\n"); return 0; }
    |  listdict SEMICOLON EOL { printf("Valid statement\n"); return 0; }
    ;

listdict  : IDENTIFIER EQUAL LSQBRACKET dict RSQBRACKET
          ;

dict : single_dict | single_dict COMMA dict
     ;

single_dict:  LBRACES values RBRACES
    ;

values      : value_pair 
             | value_pair COMMA values
             | /*empty*/;

list : LSQBRACKET mul_val RSQBRACKET

mul_val : LITERAL
        | LITERAL COMMA mul_val
        ;

value_pair : LITERAL COLON LITERAL
            | LITERAL COLON list
           ;

%%

//yyerror() function is called when all productions in the grammar in second section doesn't match to the input statement.

void yyerror(char *msg){
    printf("%s\n", msg);
}

int main(){

//call yyparse() to initiate the parsing process.
    yyparse();
    return 0;
}
