package tbd.restapi.models;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "genres")

public class Genre {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    @OneToMany(mappedBy = "genre")
    private List<Artist> artists;


    @OneToMany(mappedBy = "genre")
    
    private List<Statistic> statistic;
    
    @OneToMany(mappedBy = "genre")
    private List<Geostatistic> geostatistic;

    public List<Statistic> getStatistic() {
        return statistic;
    }

    public void setStatistic(List<Statistic> statistic) {
        this.statistic = statistic;
    }
    public List<Geostatistic> getGeoStatistic() {
        return geostatistic;
    }

    public void setGeoStatistic(List<Geostatistic> geostatistic) {
        this.geostatistic = geostatistic;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
