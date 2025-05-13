import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        String[] arquivosTeste = {
            "teste1.jmm",
            "teste2.jmm",
            "teste3.jmm",
            "teste4.jmm",
            "teste5.jmm"
        };

        for (String nomeArquivo : arquivosTeste) {
            System.out.println("\n=== Testando arquivo: " + nomeArquivo + " ===");
        
            String nomeArquivoSaida = nomeArquivo.replace(".jmm", ".txt");
            PrintStream originalOut = System.out;
        
            try (PrintStream arquivoOut = new PrintStream(new FileOutputStream(nomeArquivoSaida))) {
                System.setOut(arquivoOut);
        
                Scanner scanner = new Scanner(new FileReader(nomeArquivo));
                int EOF = -1;
                int token;
                while ((token = scanner.yylex()) != EOF) {
                    // Os tokens são impressos pelo scanner
                }
        
                System.out.flush(); // Garante que tudo foi escrito
        
            } catch (FileNotFoundException e) {
                System.setOut(originalOut);
                System.out.println("Arquivo não encontrado: " + nomeArquivo);
            } catch (IOException e) {
                System.setOut(originalOut);
                System.out.println("Erro ao criar arquivo de saída para: " + nomeArquivo);
                e.printStackTrace();
            } catch (Exception e) {
                System.setOut(originalOut);
                System.out.println("Erro ao analisar arquivo: " + nomeArquivo);
                e.printStackTrace();
            } finally {
                System.setOut(originalOut);
            }
        
            System.out.println("Saída salva em: " + nomeArquivoSaida);
        }
        
    }
}
