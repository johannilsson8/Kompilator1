%top{
#include "parser.tab.hh"
#define YY_DECL yy::parser::symbol_type yylex()
#include "Node.h"
int lexical_errors = 0;
}
%option yylineno noyywrap nounput batch noinput stack 
%%

"+"                     {return yy::parser::make_PLUSOP(yytext);}
"MainClass"             {return yy::parser::make_MAINCLASS(yytext);}
"ClassDeclaration"      {return yy::parser::make_CLASSDEC(yytext);}
"EOF"                   {return yy::parser::make_EOF(yytext);}
" "                     {printf(" ");}
"?"                     {printf("?");}
"!"                     {printf("!");}
""                      {printf("_");}
"-"                     {printf("-");}
"*"                     {return yy::parser::make_MULTOP(yytext);}
"("                     {return yy::parser::make_LP(yytext);}
")"                     {return yy::parser::make_RP(yytext);}
"&"                     {printf("&");}
"|"                     {printf("|");}
"<"                     {printf("<");}
">"                     {printf(">");}
"="                     {printf("=");}
"/"                     {printf("/");}
"["                     {printf("[");}
"]"                     {printf("]");}
"."                     {printf(".");}
","                     {printf(",");}
":"                     {printf(":");}
";"                     {printf(";");}
"{"                     {printf("{");}
"}"                     {printf("}");}
"else"                  {return yy::parser::make_ELSE(yytext);}
"class"                 {return yy::parser::make_CLASS(yytext);}
"public"                {return yy::parser::make_PUBLIC(yytext);}
"static"                {return yy::parser::make_STATIC(yytext);}
"void"                  {return yy::parser::make_VOID(yytext);}
"main"                  {return yy::parser::make_MAIN(yytext);}
"String"                {return yy::parser::make_STRING(yytext);}
"return"                {return yy::parser::make_RETURN(yytext);}
"int"                   {return yy::parser::make_INT(yytext);}
"boolean"               {return yy::parser::make_BOOLEAN(yytext);}
"if"                    {return yy::parser::make_IF(yytext);}
"while"                 {return yy::parser::make_WHILE(yytext);}
"System.out.println"    {return yy::parser::make_SYSTEMOUT(yytext);}
"length"                {return yy::parser::make_LENGTH(yytext);}
"true"                  {return yy::parser::make_TRUE(yytext);}
"false"                 {return yy::parser::make_FALSE(yytext);}
"this"                  {return yy::parser::make_THIS(yytext);}
"new"                   {return yy::parser::make_NEW(yytext);}
["]                     {printf("'");}
[A-Za-z]*               {return yy::parser::make_LETTER(yytext);}
0|[1-9][0-9]            {return yy::parser::make_INT(yytext);}
[0-9]                   {return yy::parser::make_INT(yytext);}


[ \t\n]+                  {}
.                      { if(!lexical_errors) fprintf(stderr, "Lexical errors found! See the logs below: \n"); printf("Character %s is not recognized\n", yytext); lexical_errors = 1;}
<<EOF>>                 return 0;
%%