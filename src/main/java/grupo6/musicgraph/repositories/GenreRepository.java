package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.Genre;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface GenreRepository extends JpaRepository<Genre,Integer> {
    public Genre findGenreById(Integer id);
}