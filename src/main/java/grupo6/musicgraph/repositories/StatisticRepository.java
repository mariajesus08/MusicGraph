package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.Statistic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface StatisticRepository extends JpaRepository<Statistic,Integer> {
    public Statistic findStatisticById(Integer id);
}
