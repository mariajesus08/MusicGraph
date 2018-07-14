package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "artists")
public class Artist {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_genre", nullable = false)
    @JsonIgnore
    private Genre genre;




    @OneToMany(mappedBy = "artist")
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

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}

