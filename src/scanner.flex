%%
%class Scanner
%unicode
%public
%line
%column
%type int

%{
    // Variáveis simples para contagem
    java.util.Map contagemTokens = new java.util.HashMap();

    void contaToken(String token) {
        Object val = contagemTokens.get(token);
        if (val == null) {
            contagemTokens.put(token, 1);
        } else {
            contagemTokens.put(token, ((Integer)val) + 1);
        }
    }

    void imprimeResumo() {
        System.out.println("\n=== Resumo dos Tokens ===");
        for (java.util.Iterator it = contagemTokens.keySet().iterator(); it.hasNext();) {
            String key = (String) it.next();
            System.out.printf("%-15s : %d\n", key, (Integer)contagemTokens.get(key));
        }
    }

    final int PROGRAM = 1;
    final int FINAL = 2;
    final int CLASS = 3;
    final int VOID = 4;
    final int IF = 5;
    final int ELSE = 6;
    final int WHILE = 7;
    final int RETURN = 8;
    final int READ = 9;
    final int PRINT = 10;
    final int NEW = 11;
    final int IDENT = 12;
    final int NUMBER = 13;
    final int CHARCONST = 14;
    final int PLUS = 15;
    final int MINUS = 16;
    final int TIMES = 17;
    final int DIV = 18;
    final int MOD = 19;
    final int EQ = 20;
    final int NE = 21;
    final int GT = 22;
    final int GE = 23;
    final int LT = 24;
    final int LE = 25;
    final int ASSIGN = 26;
    final int LBRACE = 27;
    final int RBRACE = 28;
    final int LPAREN = 29;
    final int RPAREN = 30;
    final int LBRACKET = 31;
    final int RBRACKET = 32;
    final int SEMICOLON = 33;
    final int COMMA = 34;
    final int DOT = 35;
    final int EOF = -1;
%}

DIGIT      = [0-9]
LETTER     = [a-zA-Z_]
ID         = {LETTER}({LETTER}|{DIGIT})*
WHITESPACE = [ \t\r\n]+
CHARCONST  = \'([^\\'\n\r]|\\[nrt\\'])\'

%%

"program"       { contaToken("PROGRAM"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "PROGRAM", yytext(), PROGRAM); return PROGRAM; }
"final"         { contaToken("FINAL"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "FINAL", yytext(), FINAL); return FINAL; }
"class"         { contaToken("CLASS"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "CLASS", yytext(), CLASS); return CLASS; }
"void"          { contaToken("VOID"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "VOID", yytext(), VOID); return VOID; }
"if"            { contaToken("IF"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "IF", yytext(), IF); return IF; }
"else"          { contaToken("ELSE"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "ELSE", yytext(), ELSE); return ELSE; }
"while"         { contaToken("WHILE"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "WHILE", yytext(), WHILE); return WHILE; }
"return"        { contaToken("RETURN"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "RETURN", yytext(), RETURN); return RETURN; }
"read"          { contaToken("READ"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "READ", yytext(), READ); return READ; }
"print"         { contaToken("PRINT"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "PRINT", yytext(), PRINT); return PRINT; }
"new"           { contaToken("NEW"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "NEW", yytext(), NEW); return NEW; }

{ID}            { contaToken("IDENT"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "IDENT", yytext(), IDENT); return IDENT; }
{DIGIT}+        { contaToken("NUMBER"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "NUMBER", yytext(), NUMBER); return NUMBER; }
{CHARCONST}     { contaToken("CHARCONST"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "CHARCONST", yytext(), CHARCONST); return CHARCONST; }

"=="            { contaToken("EQ"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "EQ", yytext(), EQ); return EQ; }
"!="            { contaToken("NE"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "NE", yytext(), NE); return NE; }
">="            { contaToken("GE"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "GE", yytext(), GE); return GE; }
"<="            { contaToken("LE"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "LE", yytext(), LE); return LE; }
">"             { contaToken("GT"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "GT", yytext(), GT); return GT; }
"<"             { contaToken("LT"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "LT", yytext(), LT); return LT; }

"+"             { contaToken("PLUS"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "PLUS", yytext(), PLUS); return PLUS; }
"-"             { contaToken("MINUS"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "MINUS", yytext(), MINUS); return MINUS; }
"*"             { contaToken("TIMES"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "TIMES", yytext(), TIMES); return TIMES; }
"/"             { contaToken("DIV"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "DIV", yytext(), DIV); return DIV; }
"%"             { contaToken("MOD"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "MOD", yytext(), MOD); return MOD; }

"="             { contaToken("ASSIGN"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "ASSIGN", yytext(), ASSIGN); return ASSIGN; }

"{"             { contaToken("LBRACE"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "LBRACE", yytext(), LBRACE); return LBRACE; }
"}"             { contaToken("RBRACE"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "RBRACE", yytext(), RBRACE); return RBRACE; }
"("             { contaToken("LPAREN"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "LPAREN", yytext(), LPAREN); return LPAREN; }
")"             { contaToken("RPAREN"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "RPAREN", yytext(), RPAREN); return RPAREN; }
"["             { contaToken("LBRACKET"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "LBRACKET", yytext(), LBRACKET); return LBRACKET; }
"]"             { contaToken("RBRACKET"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "RBRACKET", yytext(), RBRACKET); return RBRACKET; }
";"             { contaToken("SEMICOLON"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "SEMICOLON", yytext(), SEMICOLON); return SEMICOLON; }
","             { contaToken("COMMA"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "COMMA", yytext(), COMMA); return COMMA; }
"."             { contaToken("DOT"); System.out.printf("Linha %d, Col %d | %-10s | %s | Código: %d\n", yyline+1, yycolumn+1, "DOT", yytext(), DOT); return DOT; }

// Ignorar espaços em branco
{WHITESPACE}    { /* ignora */ }

// Caractere inválido
.               { System.err.printf("Linha %d, Col %d | Caractere inválido: %s\n", yyline+1, yycolumn+1, yytext()); }

// Fim de arquivo
<<EOF>>         { imprimeResumo(); return EOF; }
