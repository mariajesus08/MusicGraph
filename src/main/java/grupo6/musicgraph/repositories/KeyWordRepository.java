package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.KeyWord;
import org.springframework.data.repository.CrudRepository;

public interface KeyWordRepository extends CrudRepository<KeyWord,Integer> {
    KeyWord findByWord(String word);
    boolean existsByWord(String word);
}
