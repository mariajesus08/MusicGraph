package tbd.restapi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Statistic;

public interface StatisticRepository extends JpaRepository<Statistic,Integer> {
    public Statistic findStatisticById(Integer id);
}
