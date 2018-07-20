package tbd.restapi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Genre;

public interface GenreRepository extends JpaRepository<Genre,Integer> {
    Genre findGenreById(Integer id);
    Genre findGenreByName(String name);
}