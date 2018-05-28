package grupo6.musicgraph.models;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

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

    public List<Statistic> getStatistic() {
        return statistic;
    }

    public void setStatistic(List<Statistic> statistic) {
        this.statistic = statistic;
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
