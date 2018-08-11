package tbd.restapi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Genre;
import tbd.restapi.models.Statistic;
import java.util.List;

public interface StatisticRepository extends JpaRepository<Statistic,Integer> {

    Statistic findStatisticById(Integer id);
    Statistic findStatisticByName(String name);
    
    List <Statistic> findByGenreOrderByPositiveTweetsDesc(Genre genre);
    List <Statistic> findByGenreOrderByNegativeTweetsDesc(Genre genre);
    List <Statistic> findStatisticsByNameOrderByDateDesc(String name);
    
}
