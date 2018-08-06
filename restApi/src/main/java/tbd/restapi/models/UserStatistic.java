package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import com.fasterxml.jackson.annotation.JsonIgnore;
import org.neo4j.ogm.annotation.GraphId;
import org.neo4j.ogm.annotation.NodeEntity;
import org.neo4j.ogm.annotation.Relationship;

import javax.persistence.*;
import java.util.*;


@Entity
@Table(name = "userStatistics")

public class UserStatistic {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "retweets")
    private int retweets ;
    @Column(name = "followers")
    private int followers;
    @Column(name = "last_tweet")
    private String last_tweet;
    @Column(name = "verified")
    public int verified;
    @Column(name = "relevant")
    public int relevant;
    @Column(name = "date")
    private Date date;
    @Column(name = "artist")
    private String artist;

    public UserStatistic() {
        verified = 1;
        relevant = 10;
    }

    public String getArtist() {
        return artist;
    }

    public void setArtist(String artist) {
        this.artist = artist;
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
    public int getRelevant() {
        return retweets;
    }

    public void setRelevant(int relevant) {
        this.relevant = relevant;
    }
    public int getVerified() {
        return retweets;
    }

    public void setVerified(int verified) {
        this.verified = verified;
    }
    public int getRetweets() {
        return retweets;
    }

    public void setRetweets(int retweets) {
        this.retweets = retweets;
    }
    public int getFollowers() {
        return followers;
    }

    public void setFollowers(int followers) {
        this.followers = followers;
    }
    public String geLast_tweet() {
        return last_tweet;
    }

    public void setLast_tweet(String last_tweet) {
        this.last_tweet = last_tweet;
    }

   
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
