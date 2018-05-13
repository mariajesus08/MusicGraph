package grupo6.musicgraph.repositories;

import grupo6.musicgraph.models.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User,Integer> {
    User findByEmail(String email);
    boolean existsByEmail(String email);
}