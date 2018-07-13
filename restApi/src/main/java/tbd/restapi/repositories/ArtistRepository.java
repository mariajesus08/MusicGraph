package tbd.restapi.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Artist;

public interface ArtistRepository extends JpaRepository<Artist,Integer> {
    public Artist findArtistById(Integer id);
}