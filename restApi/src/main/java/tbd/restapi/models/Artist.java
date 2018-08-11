package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.neo4j.ogm.annotation.NodeEntity;

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

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_genre", nullable = false)
    @JsonIgnore
    private Genre genre;

    @OneToMany(mappedBy = "artist")
    private List<Statistic> statistic;

    @OneToMany(mappedBy = "artist_influyent_user")
    private List<Influyent_User_Artist> artist_influyent_user;

    @OneToMany(mappedBy = "artist_common_user")
    private List<Common_User_Artist> artist_common_user;


    public List<Common_User_Artist> getCommonUsers(){
        return this.artist_common_user;
    }

    public void setCommonUsers(List<Common_User_Artist> userArtist){
        this.artist_common_user = userArtist;
    }

    public List<Influyent_User_Artist> getInfluyentUsers(){
        return this.artist_influyent_user;
    }

    public void setInfluyentUsers(List<Influyent_User_Artist> userArtist){
        this.artist_influyent_user = userArtist;
    }

    public Genre getGenre(){
        return this.genre;
    }
    public List<Statistic> getStatistic() {
        return this.statistic;
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

