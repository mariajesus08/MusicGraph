package tbd.restapi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.UserStatistic;

public interface UserStatisticRepository extends JpaRepository<UserStatistic,Integer>{
    UserStatistic findUserStatisticById(Integer id);
    UserStatistic findUserStatisticByName(String name);
}