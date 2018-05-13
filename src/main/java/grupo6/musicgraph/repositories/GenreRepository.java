package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.Genre;
import org.springframework.data.repository.CrudRepository;

public interface GenreRepository extends CrudRepository<Genre,Integer> {
    Genre findByName(String name);
    boolean existsByName(String name);
}