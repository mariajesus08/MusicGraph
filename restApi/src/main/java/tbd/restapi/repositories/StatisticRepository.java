package tbd.restapi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Genre;
import tbd.restapi.models.Statistic;
import java.util.List;

public interface StatisticRepository extends JpaRepository<Statistic,Integer> {

    Statistic findStatisticById(Integer id);
    List <Statistic> findTop10ByGenreOrderByPositiveTweetsDesc(Genre genre);
    List <Statistic> findTop10ByGenreOrderByNegativeTweetsDesc(Genre genre);

}
