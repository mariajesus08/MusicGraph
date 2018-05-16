package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.Statistic;
import org.springframework.data.repository.CrudRepository;

public interface StatisticRepository extends CrudRepository<Statistic,Integer> {
    Statistic findByName(String name);
    boolean existsByName(String name);
}
