package tbd.restapi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tbd.restapi.models.User;

@Repository
public interface UserRepository extends JpaRepository<User,Integer> {
    public User findUserById(Integer id);
}