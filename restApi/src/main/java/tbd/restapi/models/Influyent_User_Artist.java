package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.neo4j.ogm.annotation.NodeEntity;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "Influyent_User_Artist")
public class Influyent_User_Artist {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;


    @Column(name = "last_tweet")
    private String last_tweet;
    @Column(name = "retweets")

    private int retweets;
    @Column(name = "date")

    private Date date;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_influyent_user", nullable = false)
    @JsonIgnore
    private Influyent_User influyent_user_artist;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_artist", nullable = false)
    @JsonIgnore
    private Artist artist_influyent_user;

    
    public Influyent_User getInfluyentUser(){
        return this.influyent_user_artist;
    }

    public void setInfluyentUser(Influyent_User user){
        this.influyent_user_artist = user;
    }

    public Artist getArtist(){
        return this.artist_influyent_user;
    }

    public void setArtist(Artist artist){
        this.artist_influyent_user = artist;
    }

    public int getRetweets(){
        return this.retweets;
    }

    public void setRetweets(int retweets){
        this.retweets = retweets; 
    }

    public Date getDate(){
        return this.date;
    }

    public void setDate(Date date){
        this.date = date; 
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}

