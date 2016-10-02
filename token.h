
#ifndef TOKEN_H
#define TOKEN_H

typedef enum {
	ELSE,
	IF,
	INPUT,
	INT,
	OUTPUT,
	RETURN,
	VOID,
	WHILE,
	WRITE,
	PLUS,
	MINUS,
	TIMES,
	OVER,
	LT,
	LE,
	GT,
	GE,
	EQ,
	NEQ,
	ASSIGN,
	SEMI,
	COMMA,
	LPAREN,
	RPAREN,
	LBRACK,
	RBRACK,
	LBRACE,
	RBRACE,
	NUM,
	ID,
	STRING
} TokenType;

// const char* STRING_TOKEN[] = {
// 	"IF",
// 	"THEN",
// 	"ELSE",
// 	"END",
// 	"REPEAT",
// 	"UNTIL",
// 	"READ",
// 	"WRITE",
// 	"PLUS",
// 	"MINUS",
// 	"TIMES",
// 	"OVER",
// 	"EQ",
// 	"LT",
// 	"ASSIGN",
// 	"SEMI",
// 	"NUMBER",
// 	"IDENTIFIER",
// 	"COMMENT",
// 	"ERROR",
// 	"LINE",
// 	"LPAREN",
// 	"RPAREN",
// 	"ENTER"
// };

#endif // TOKEN_H
