package tbd.restapi.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import tbd.restapi.models.Genre;
import tbd.restapi.models.Geostatistic;
import java.util.List;

public interface GeostatisticRepository extends JpaRepository<Geostatistic,Integer> {

    Geostatistic findGeostatisticById(Integer id);
    List<Geostatistic> findGeostatisticByName(String name);

    
}
