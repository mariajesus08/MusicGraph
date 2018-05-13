package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.Artist;
import org.springframework.data.repository.CrudRepository;

public interface ArtistRepository extends CrudRepository<Artist,Integer> {
    Artist findByName(String name);
    boolean existsByName(String name);
}