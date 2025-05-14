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


[Uploading Token-LexemaSmbolo-ExpressoRegular-ValorInterno-ExemplodeLexema-Observao.csv…]()

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

# Arquivos de Teste
Os arquivos de teste com extensão .jmm devem estar na raiz do projeto ou no caminho especificado no Main.java. Eles contêm exemplos de código JAVA−− para serem analisados.

# Saída Esperada
Para cada arquivo .jmm, será gerado um arquivo .txt contendo:

Linha e coluna do token.

Nome do token.

Lexema (texto reconhecido).

Código interno do token.

Ao final, um resumo com a contagem de cada tipo de token encontrado.

# Detalhes Técnicos
O scanner utiliza variáveis internas do JFlex (yyline, yycolumn) para capturar posição dos tokens.

A contagem dos tokens é feita via um Map<String, Integer> simples.

O código foi escrito com foco em simplicidade e clareza, evitando modificadores estáticos para facilitar a compreensão.
