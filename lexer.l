%{
#include "y.tab.h"
#include<stdio.h>
#include<string.h>
struct token{
   char lx[100];
   char tk[100];
  int lineno;
};

struct cons{
	char lx1[100];
	char typ[100];
	int lineno;
};
int yylineno;
int flag=0;
typedef struct token node;
typedef struct cons con;
con ctab[100];
int size1=0;
int size=0;
node tab[100];
int exists(char* tk,char *lx)
{
    for(int i=0;i<size+5;i++)
     if (strcmp(tk, tab[i].tk) == 0 && strcmp(lx, tab[i].lx) == 0)
     return 1;
     return 0;
}
void insert(char *tk,char *lx,int lineno)
{  if(exists(tk,lx))
   return;
   strcpy(tab[size].tk,tk);
   strcpy(tab[size].lx,lx);
   tab[size].lineno=lineno;
   size++;
}
void ins(char *typ,char *lx1,int lineno)
{  
   strcpy(ctab[size1].typ,typ);
   strcpy(ctab[size1].lx1,lx1);
   ctab[size1].lineno=lineno;
   size1++;
}
void print()
{
  printf("SYMBOL TABLE\n\n");
  for(int i=0;i<size;i++)
  printf("%s                                %s                                    %d\n",tab[i].lx,tab[i].tk,tab[i].lineno);

  printf("\n");
  for(int i=0;i<size;i++)
  printf("%s ",tab[i].tk);
  printf("\n");
 }
void cprint()
{
  for(int i=0;i<size1;i++)
  printf("%s          %s            %d\n",ctab[i].lx1,ctab[i].typ,ctab[i].lineno);
 }
%}
%%
","  { insert("COMMA",yytext,yylineno);return COM; }
"-" { insert("HYPHEN",yytext,yylineno);return HYP; }
"."       {  insert("STOP",yytext,yylineno); return STOP;}
[A-Z][^0-9. \t]{2,25} { insert("STARTWORD",yytext,yylineno);return START;}
[^0-9. \t]{3,26}  { insert("WORD",yytext,yylineno);return WORD;}
[ \t] { }
. {printf("Lexical error! Invalid token %s\n",yytext); return 0;}
%%
int yywrap()
{
return 1;
}
