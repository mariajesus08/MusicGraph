package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.Keyword;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

public interface KeywordRepository extends JpaRepository<Keyword,Integer> {
    public Keyword findKeywordById(Integer id);

}
