# Analisador Léxico para a linguagem JAVA

# Descrição
Este projeto implementa um analisador léxico para a linguagem JAVA−−, utilizando o gerador JFlex. O objetivo é identificar e classificar tokens do código-fonte, convertendo-os em unidades para uso posterior pelo analisador sintático. O scanner reconhece palavras reservadas, identificadores, constantes, operadores, delimitadores e trata erros léxicos.

# Funcionamento do Analisador Léxico
O funcionamento segue o fluxo:

Leitura do arquivo de entrada (.jmm) com código-fonte JAVA−−.

Análise caractere por caractere para identificação dos tokens.

Classificação dos tokens conforme as regras definidas em expressões regulares.

Retorno dos tokens com seus valores internos.

Tratamento de erros léxicos, reportando caracteres inválidos.

# Etapas do Desenvolvimento
Estudo da gramática da linguagem JAVA−− para identificar tokens.

Definição das expressões regulares para cada token.

Implementação do arquivo de especificação para o JFlex (scanner.flex).

Geração do código Java do analisador usando JFlex.

Implementação do programa principal (Main.java) para testar o analisador.

Testes com diferentes construções da linguagem.

# Estrutura do Projeto
src/scanner.flex - Arquivo fonte do analisador léxico em JFlex.

src/Main.java - Programa principal que executa o analisador sobre arquivos de teste .jmm e grava os resultados em arquivos .txt.

libs/jflex-1.9.1.jar - Biblioteca do JFlex (versão usada).

target/ - Diretório onde são gerados os arquivos compilados e o scanner Java.

# Diagrama de Interdependência
+------------------+        +-------------------+        +------------------+
|  scanner.flex    | -----> |   Scanner.java    | <----- |    Main.java     |
+------------------+        +-------------------+        +------------------+
         |                                                     |
         +-------------------+---------------------------------+
                             |
                    Arquivos de teste (.jmm)


| Token       | Lexema/Símbolo      | Expressão Regular           | Valor Interno | Exemplo de Lexema | Observação          |
|-------------|---------------------|----------------------------|---------------|-------------------|---------------------|
| PROGRAM     | program             | program                    | 1             | program           | Palavra reservada    |
| FINAL       | final               | final                      | 2             | final             | Palavra reservada    |
| CLASS       | class               | class                      | 3             | class             | Palavra reservada    |
| VOID        | void                | void                       | 4             | void              | Palavra reservada    |
| IF          | if                  | if                         | 5             | if                | Palavra reservada    |
| ELSE        | else                | else                       | 6             | else              | Palavra reservada    |
| WHILE       | while               | while                      | 7             | while             | Palavra reservada    |
| RETURN      | return              | return                     | 8             | return            | Palavra reservada    |
| READ        | read                | read                       | 9             | read              | Palavra reservada    |
| PRINT       | print               | print                      | 10            | print             | Palavra reservada    |
| NEW         | new                 | new                        | 11            | new               | Palavra reservada    |
| IDENT       | identificador       | `[a-zA-Z_][a-zA-Z0-9_]*`  | 12            | soma, x, _temp    | Identificador        |
| NUMBER      | número              | `[0-9]+`                   | 13            | 42, 123           | Número inteiro       |
| CHARCONST   | constante caractere  | `([^'\n\r]|\\[nrt\\'])`    | 14            | 'a', '\n'         | Constante caractere  |
| PLUS        | +                   | +                          | 15            | +                 | Operador aritmético  |
| MINUS       | -                   | -                          | 16            | -                 | Operador aritmético  |
| TIMES       | *                   | *                          | 17            | *                 | Operador aritmético  |
| DIV         | /                   | /                          | 18            | /                 | Operador aritmético  |
| MOD         | %                   | %                          | 19            | %                 | Operador aritmético  |
| EQ          | ==                  | ==                         | 20            | ==                | Operador relacional  |
| NE          | !=                  | !=                         | 21            | !=                | Operador relacional  |
| GT          | >                   | >                          | 22            | >                 | Operador relacional  |
| GE          | >=                  | >=                         | 23            | >=                | Operador relacional  |
| LT          | <                   | <                          | 24            | <                 | Operador relacional  |
| LE          | <=                  | <=                         | 25            | <=                | Operador relacional  |
| ASSIGN      | =                   | =                          | 26            | =                 | Atribuição           |
| LBRACE      | {                   | {                          | 27            | {                 | Delimitador          |
| RBRACE      | }                   | }                          | 28            | }                 | Delimitador          |
| LPAREN      | (                   | (                          | 29            | (                 | Delimitador          |
| RPAREN      | )                   | )                          | 30            | )                 | Delimitador          |
| LBRACKET    | [                   | [                          | 31            | [                 | Delimitador          |
| RBRACKET    | ]                   | ]                          | 32            | ]                 | Delimitador          |
| SEMICOLON   | ;                   | ;                          | 33            | ;                 | Delimitador          |
| COMMA       | ,                   | ,                          | 34            | ,                 | Delimitador          |
| DOT         | .                   | .                          | 35            | .                 | Delimitador          |
| EOF         |                     |                            | -1            |                   | Fim de arquivo       |

# Autômato Finito Determinista (AFD)
O analisador implementa um AFD simplificado para reconhecer identificadores, números, constantes de caractere, operadores e delimitadores. O AFD completo incluiria estados para todos os tokens, mas aqui mostramos os principais para facilitar a compreensão.

# Como Rodar o Projeto
Pré-requisitos
Java JDK 8 ou superior instalado.

JFlex 1.9.1 (arquivo jflex-1.9.1.jar disponível na pasta libs).

Arquivos de teste .jmm prontos para análise (exemplos fornecidos no projeto).

Passo 1: Gerar o scanner
No terminal do gitbash dentro da pasta "analisador-lexico", execute o comando para gerar o scanner Java a partir do arquivo .flex:

bash
java -jar libs/jflex-1.9.1.jar src/scanner.flex -d target/
Isso criará o arquivo Scanner.java dentro da pasta target/.

Passo 2: Compilar o projeto
Compile o scanner gerado e o programa principal com o seguinte comando:

bash
javac -cp libs/jflex-1.9.1.jar target/Scanner.java src/Main.java -d target/
Passo 3: Executar o analisador
Rode o programa principal para analisar os arquivos .jmm listados no código:

bash
java -cp target/ Main
O programa vai gerar arquivos .txt com a saída detalhada da análise para cada arquivo .jmm.

# Resultados Experimentais
Foram realizados testes com diferentes construções da linguagem JAVA−−.

Teste 1: Declaração de constantes e variáveis
Arquivo: teste1.jmm

Reconhece: palavras reservadas (program, final), identificadores, números, constantes de caractere, delimitadores.

Teste 2: Declaração de classe e método
Arquivo: teste2.jmm

Reconhece: class, void, return, delimitadores de bloco e parâmetros.

Teste 3: Estruturas de controle
Arquivo: teste3.jmm

Reconhece: if, else, while, operadores relacionais (>, !=).

Teste 4: Entrada, saída, arrays e operadores
Arquivo: teste4.jmm

Reconhece: read, print, acesso a arrays, operadores aritméticos (*, +, /, %).

Teste 5: Uso de new, chamada de métodos e designadores complexos
Arquivo: teste5.jmm

Reconhece: uso de new, chamadas de métodos, designadores.

# Conclusão
O analisador léxico desenvolvido reconhece corretamente todos os tokens da linguagem JAVA−−, tratando erros léxicos e fornecendo uma saída detalhada e um resumo dos tokens. O uso do JFlex permitiu uma implementação eficiente e fácil de manter.

Destaques:

Tratamento de erros com mensagens específicas.

Estrutura modular e flexível.

Desempenho eficiente.

Possíveis extensões:

Suporte a comentários de linha/bloco.

Tratamento de erros mais sofisticado.

Integração com analisador sintático.

# Referências
AHO, A. V.; LAM, M. S.; SETHI, R.; ULLMAN, J. D. Compiladores: Princípios, Técnicas e Ferramentas. 2ª ed. São Paulo: Pearson Addison Wesley, 2008.

APPEL, A. W. Modern Compiler Implementation in Java. 2ª ed. Cambridge University Press, 2002.

LEVINE, J.; MASON, T.; BROWN, D. Lex & Yacc. 2ª ed. O'Reilly Media, 1992.

Documentação oficial do JFlex: https://jflex.de/manual.html

COOPER, K. D.; TORCZON, L. Engineering a Compiler. 2ª ed. Morgan Kaufmann, 2011.

# Alunos
Thiago Henrique
Fábio Vitor
