package grupo6.musicgraph;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import com.fasterxml.jackson.annotation.JsonAutoDetect;

@SpringBootApplication
@JsonAutoDetect
@EnableAutoConfiguration
public class MusicgraphApplication {

    public static void main(String[] args) {
        SpringApplication.run(MusicgraphApplication.class, args);
        AnalisisArtista analisisArtista = new AnalisisArtista();
        analisisArtista.analizarTodos();
    }
}
