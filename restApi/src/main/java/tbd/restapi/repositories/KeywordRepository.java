package tbd.restapi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Keyword;

public interface KeywordRepository extends JpaRepository<Keyword,Integer> {
    public Keyword findKeywordById(Integer id);

}
