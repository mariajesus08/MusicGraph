package tbd.analisistweets;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class AnalisistweetsApplication {

    public static void main(String[] args) throws Exception {
        SpringApplication.run(AnalisistweetsApplication.class, args);
        AnalisisArtista analisisArtista = new AnalisisArtista();
        analisisArtista.analizarTodos();
    }
}
