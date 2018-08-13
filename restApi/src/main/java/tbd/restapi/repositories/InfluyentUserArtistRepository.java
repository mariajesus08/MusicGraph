package tbd.restapi.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Influyent_User_Artist;

import java.util.List;

public interface InfluyentUserArtistRepository extends JpaRepository<Influyent_User_Artist,Integer> {
    Influyent_User_Artist save(Influyent_User_Artist commonUser);
    Influyent_User_Artist findInfluyent_User_ArtistById(Integer id);
    void deleteInfluyent_User_ArtistById (int id);
    Influyent_User_Artist findFirstInfluyent_User_ArtistById (int id);
}