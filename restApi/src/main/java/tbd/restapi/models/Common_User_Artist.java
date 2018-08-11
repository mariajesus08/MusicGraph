package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.neo4j.ogm.annotation.NodeEntity;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "Common_User_Artist")
public class Common_User_Artist {

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
    @JoinColumn(name="id_common_user", nullable = false)
    @JsonIgnore
    private Common_User Common_User_Artist;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_artist", nullable = false)
    @JsonIgnore
    private Artist artist_common_user;

    
    public Common_User getInfluyentUser(){
        return this.Common_User_Artist;
    }

    public void setInfluyentUser(Common_User user){
        this.Common_User_Artist = user;
    }

    public Artist getArtist(){
        return this.artist_common_user;
    }

    public void setArtist(Artist artist){
        this.artist_common_user = artist;
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

