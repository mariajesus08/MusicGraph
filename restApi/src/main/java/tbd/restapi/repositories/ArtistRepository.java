package tbd.restapi.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Artist;

import java.util.List;

public interface ArtistRepository extends JpaRepository<Artist,Integer> {
     Artist findArtistById(Integer id);
     Artist findArtistByName(String name);
     Artist findFirstArtistByName(String name);
     void deleteArtistsByName (String name);
     List<Artist> getAllByOrderByNameAsc();
     boolean existsByName(String name);
}