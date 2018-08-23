package tbd.analisistweets.mysql;

import java.util.*;


public class Geostatistic {

    private int id;
    private String name;
    private Float positiveTweets;
    private Float negativeTweets;
    private String region;
    private String commune;

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

}
