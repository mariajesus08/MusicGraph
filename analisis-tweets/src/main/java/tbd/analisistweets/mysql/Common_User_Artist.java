package tbd.analisistweets.mysql;

import java.util.*;

public class Common_User_Artist {

    private int id;


    private String last_tweet;

    private int retweets;

    private Date date;


    private Common_User Common_User_Artist;

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

