import java.io.FileReader;
import java.io.FileNotFoundException;

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
            try {
                Scanner scanner = new Scanner(new FileReader(nomeArquivo));
                while (scanner.yylex() != Scanner.EOF) {
                    // Os tokens já são impressos pelo scanner
                }
            } catch (FileNotFoundException e) {
                System.out.println("Arquivo não encontrado: " + nomeArquivo);
            } catch (Exception e) {
                System.out.println("Erro ao analisar arquivo: " + nomeArquivo);
                e.printStackTrace();
            }
        }
    }
}
