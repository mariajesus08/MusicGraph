package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
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


    public String lastTweet;

    public int retweets;
    @Column(name = "date")

    private Date date;
    public String nombreArtista;
    public String nombreUsuarioInfluyente;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_influyent_user")
    @JsonIgnore
    private Influyent_User influyentUserArtist;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_artist")
    @JsonIgnore
    private Artist artistInfluyentUser;

    @JsonBackReference(value="influyent-artist-relation")
    public Influyent_User getInfluyentUser(){
        return this.influyentUserArtist;
    }

    public void setInfluyentUser(Influyent_User user){
        this.influyentUserArtist = user;
    }

    public String getLast_tweet(){
        return this.lastTweet;
    }

    public void setLast_tweet(String tweet){
        this.lastTweet = tweet;
    }
    
    @JsonBackReference(value="artist-influyent-relation")
    public Artist getArtist(){
        return this.artistInfluyentUser;
    }

    public void setArtist(Artist artist){
        this.artistInfluyentUser = artist;
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

