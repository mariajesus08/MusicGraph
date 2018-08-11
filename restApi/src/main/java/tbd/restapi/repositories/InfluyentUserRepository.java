package tbd.restapi.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Influyent_User;

import java.util.List;

public interface InfluyentUserRepository extends JpaRepository<Influyent_User,Integer> {
    Influyent_User save(Influyent_User commonUser);
    Influyent_User findInfluyent_UserById(Integer id);
    Influyent_User findFirstInfluyent_UserByName(String name);
    void deleteInfluyent_UserByName (String name);
    Influyent_User findFirstInfluyent_UserById (int id);

}