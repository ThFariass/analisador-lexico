%%
%class Scanner
%unicode
%public
%line
%column
%type int

%{
    public static final int PROGRAM = 1;
    public static final int FINAL = 2;
    public static final int CLASS = 3;
    public static final int VOID = 4;
    public static final int IF = 5;
    public static final int ELSE = 6;
    public static final int WHILE = 7;
    public static final int RETURN = 8;
    public static final int READ = 9;
    public static final int PRINT = 10;
    public static final int NEW = 11;
    public static final int IDENT = 12;
    public static final int NUMBER = 13;
    public static final int CHARCONST = 14;
    public static final int PLUS = 15;
    public static final int MINUS = 16;
    public static final int TIMES = 17;
    public static final int DIV = 18;
    public static final int MOD = 19;
    public static final int EQ = 20;
    public static final int NE = 21;
    public static final int GT = 22;
    public static final int GE = 23;
    public static final int LT = 24;
    public static final int LE = 25;
    public static final int ASSIGN = 26;
    public static final int LBRACE = 27;
    public static final int RBRACE = 28;
    public static final int LPAREN = 29;
    public static final int RPAREN = 30;
    public static final int LBRACKET = 31;
    public static final int RBRACKET = 32;
    public static final int SEMICOLON = 33;
    public static final int COMMA = 34;
    public static final int DOT = 35;
    public static final int EOF = -1;
%}

DIGIT      = [0-9]
LETTER     = [a-zA-Z_]
ID         = {LETTER}({LETTER}|{DIGIT})*
WHITESPACE = [ \t\r\n]+
CHARCONST  = \'([^\\'\n\r]|\\[nrt\\'])\'

%%
// Palavras reservadas
"program"       { System.out.println("PROGRAM\t" + yytext()); return PROGRAM; }
"final"         { System.out.println("FINAL\t" + yytext()); return FINAL; }
"class"         { System.out.println("CLASS\t" + yytext()); return CLASS; }
"void"          { System.out.println("VOID\t" + yytext()); return VOID; }
"if"            { System.out.println("IF\t" + yytext()); return IF; }
"else"          { System.out.println("ELSE\t" + yytext()); return ELSE; }
"while"         { System.out.println("WHILE\t" + yytext()); return WHILE; }
"return"        { System.out.println("RETURN\t" + yytext()); return RETURN; }
"read"          { System.out.println("READ\t" + yytext()); return READ; }
"print"         { System.out.println("PRINT\t" + yytext()); return PRINT; }
"new"           { System.out.println("NEW\t" + yytext()); return NEW; }

// Identificadores
{ID}            { System.out.println("IDENT\t" + yytext()); return IDENT; }

// Constantes
{DIGIT}+        { System.out.println("NUMBER\t" + yytext()); return NUMBER; }
{CHARCONST}     { System.out.println("CHARCONST\t" + yytext()); return CHARCONST; }

// Operadores relacionais
"=="            { System.out.println("EQ\t" + yytext()); return EQ; }
"!="            { System.out.println("NE\t" + yytext()); return NE; }
">="            { System.out.println("GE\t" + yytext()); return GE; }
"<="            { System.out.println("LE\t" + yytext()); return LE; }
">"             { System.out.println("GT\t" + yytext()); return GT; }
"<"             { System.out.println("LT\t" + yytext()); return LT; }

// Operadores aritméticos
"+"             { System.out.println("PLUS\t" + yytext()); return PLUS; }
"-"             { System.out.println("MINUS\t" + yytext()); return MINUS; }
"*"             { System.out.println("TIMES\t" + yytext()); return TIMES; }
"/"             { System.out.println("DIV\t" + yytext()); return DIV; }
"%"             { System.out.println("MOD\t" + yytext()); return MOD; }

// Atribuição
"="             { System.out.println("ASSIGN\t" + yytext()); return ASSIGN; }

// Delimitadores e símbolos
"{"             { System.out.println("LBRACE\t" + yytext()); return LBRACE; }
"}"             { System.out.println("RBRACE\t" + yytext()); return RBRACE; }
"("             { System.out.println("LPAREN\t" + yytext()); return LPAREN; }
")"             { System.out.println("RPAREN\t" + yytext()); return RPAREN; }
"["             { System.out.println("LBRACKET\t" + yytext()); return LBRACKET; }
"]"             { System.out.println("RBRACKET\t" + yytext()); return RBRACKET; }
";"             { System.out.println("SEMICOLON\t" + yytext()); return SEMICOLON; }
","             { System.out.println("COMMA\t" + yytext()); return COMMA; }
"."             { System.out.println("DOT\t" + yytext()); return DOT; }

// Espaços em branco (ignorar)
{WHITESPACE}    { /* ignora */ }

// Qualquer outro caractere é erro
.               { System.err.println("Caractere inválido: " + yytext()); }

// Fim de arquivo
<<EOF>>         { return EOF; }
