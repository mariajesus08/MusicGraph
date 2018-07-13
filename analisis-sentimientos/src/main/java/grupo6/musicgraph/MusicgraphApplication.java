package grupo6.musicgraph;

import org.springframework.boot.SpringApplication;

public class MusicgraphApplication {

    public static void main(String[] args) {
        SpringApplication.run(MusicgraphApplication.class, args);
        AnalisisArtista analisisArtista = new AnalisisArtista();
        analisisArtista.analizarTodos();
    }
}
