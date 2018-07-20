package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "statistics")

public class Statistic {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;
    private String name;
    @Column(name = "positive_tweets")
    private int positiveTweets;
    @Column(name = "negative_tweets")
    private int negativeTweets;
    private int total_tweets;
    private Date date;


    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_artist", nullable = false)
    @JsonIgnore
    private Artist artist;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_genre", nullable = false)
    @JsonIgnore
    private Genre genre;


    public Artist getArtist() {
        return artist;
    }

    public void setArtist(Artist artist) {
        this.artist = artist;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
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

    public int getPositiveTweets() {
        return positiveTweets;
    }

    public void setPositiveTweets(int positiveTweets) {
        this.positiveTweets = positiveTweets;
    }

    public int getNegativeTweets() {
        return negativeTweets;
    }

    public void setNegativeTweets(int negativeTweets) {
        this.negativeTweets = negativeTweets;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTotal_tweets() {
        return total_tweets;
    }

    public void setTotal_tweets(int total_tweets) {
        this.total_tweets = total_tweets;
    }
}
