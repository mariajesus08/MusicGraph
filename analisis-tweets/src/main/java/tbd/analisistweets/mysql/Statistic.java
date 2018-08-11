package tbd.analisistweets.mysql;

import java.util.*;


public class Statistic {

    private int id;
    private String name;
    private Float positiveTweets;
    private Float negativeTweets;
    private int total_tweets;
    private Date date;


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

    public Float getPositiveTweets() {
        return positiveTweets;
    }

    public void setPositiveTweets(Float positiveTweets) {
        this.positiveTweets = positiveTweets;
    }

    public Float getNegativeTweets() {
        return negativeTweets;
    }

    public void setNegativeTweets(Float negativeTweets) {
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
