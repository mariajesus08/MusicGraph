package tbd.restapi.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Common_User;

import java.util.List;

public interface CommonUserRepository extends JpaRepository<Common_User,Integer> {
    Common_User save(Common_User commonUser);
    Common_User findCommon_UserById(Integer id);
    Common_User findFirstCommon_UserByName(String name);
    void deleteCommon_UserByName (String name);
    Common_User findFirstCommon_UserById (int id);

}