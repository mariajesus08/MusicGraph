package tbd.restapi.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Common_User_Artist;

import java.util.List;

public interface CommonUserArtistRepository extends JpaRepository<Common_User_Artist,Integer> {
    Common_User_Artist save(Common_User_Artist commonUser);
    Common_User_Artist findCommon_User_ArtistById(Integer id);
    void deleteCommon_User_ArtistById (int id);
    Common_User_Artist findFirstCommon_User_ArtistById (int id);

}