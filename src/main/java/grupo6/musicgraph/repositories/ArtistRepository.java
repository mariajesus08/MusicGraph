package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.Artist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface ArtistRepository extends JpaRepository<Artist,Integer> {
    public Artist findArtistById(Integer id);
}