/* 1º Trabalho de compiladores */
/* Aluno: Leonardo Santos Paulucio */
/* Scanner para Linguagem C-Minus */

/* Opcoes flex */
%option outfile="scanner.c"
%option noyywrap
%option nounput
%option noinput

%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "token.h"

	void process_error();
%}

/*Palavras Reservadas*/
ELSE "else"
IF "if"
INPUT "input"
INT "int"
OUTPUT "output"
RETURN "return"
VOID "void"
WHILE "while"
WRITE "write"
/*Operadores Aritmeticos e de comparacao*/
PLUS "+"
MINUS "-"
TIMES "*"
OVER "/"
LT "<"
LE "<="
GT ">"
GE ">="
EQ "=="
NEQ "!="
ASSIGN "="
/*Tokens*/
SEMI ";"
COMMA ","
LPAREN "("
RPAREN ")"
LBRACK "["
RBRACK "]"
LBRACE "{"
RBRACE "}"

ID [a-zA-Z]+[a-zA-Z0-9]*
NUM [0-9]+
STRING \".*\"

/* Comments are handled in the rules section. First we need to define a start condition. */
%x          L_COMMENT ML_COMMENT

%%
{ELSE} {return ELSE;}
{IF} {return IF;}
{INPUT} {return INPUT;}
{INT} {return INT;}
{OUTPUT} {return OUTPUT;}
{RETURN} {return RETURN;}
{VOID} {return VOID;}
{WHILE} {return WHILE;}
{WRITE} {return WRITE;}

{PLUS} {return PLUS;}
{MINUS} {return MINUS;}
{TIMES} {return TIMES;}
{OVER} {return OVER;}
{LT} {return LT;}
{LE} {return LE;}
{GT} {return GT;}
{GE} {return GE;}
{EQ} {return EQ;}
{NEQ} {return NEQ;}
{ASSIGN} {return ASSIGN;}

{SEMI} {return SEMI;}
{COMMA} {return COMMA;}
{LPAREN} {return LPAREN;}
{RPAREN} {return RPAREN;}
{LBRACK} {return LBRACK;}
{RBRACK} {return RBRACK;}
{LBRACE} {return LBRACE;}
{RBRACE} {return RBRACE;}
{NUM} {return NUM;}
{ID} {return ID;}
{STRING} { return STRING;}

[ \t]+          /* eat up whitespace */
"\n"            yylineno++; /* eat up a single line */

"//"                 BEGIN(L_COMMENT); /* line comments */
<L_COMMENT>[^\n]* /* eat anything that’s not a \n */
<L_COMMENT>"\n"    yylineno++; BEGIN(INITIAL);

"/*"                 BEGIN(ML_COMMENT); /* multi-line comments */
<ML_COMMENT>[^\n] /* eat anything that’s not a \n */
<ML_COMMENT>"\n"    yylineno++;
<ML_COMMENT>"*/"    BEGIN(INITIAL);

. {process_error();}

%%

void process_error()
{
    printf("SCANNING ERROR (%d): Unknown symbol %c\n", yylineno, yytext[0]);
    exit(1);
}
