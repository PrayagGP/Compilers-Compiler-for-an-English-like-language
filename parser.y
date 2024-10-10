%{
#include <stdio.h>
#include <stdlib.h>

extern int yylineno;  // To track line number
extern int flag;
extern char *yytext;  // To track current token text
%}

%token START WORD STOP COM HYP 
%left COM

%%
Acc: St {printf("Valid string\n\n"); return 0; }
St: START STOP
  | START word STOP
  ;

word: COM type word
    | HYP type word
    | type word
    | type
    | COM type
    | HYP type
    ;

type: START
    | WORD
    ;
%%

int yyerror(const char *str)
{
    // Improved error message with line number and unexpected token
    printf("Invalid string. Syntax error in the string: unexpected token '%s'\n",yytext);
    return 1;
}

int main()
{
    printf("Enter string:\n");
    yyparse();
    print();
    cprint();
    return 0;  
}

