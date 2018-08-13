package tbd.analisistweets.mysql;

import java.util.*;

public class Influyent_User_Artist {


    private int id;


    public String lastTweet;

    public int retweets;
    
    private Date date;
    public String nombreArtista;
    public String nombreUsuarioInfluyente;


    private Influyent_User influyentUserArtist;

    private Artist artistInfluyentUser;

    public Influyent_User getInfluyentUser(){
        return this.influyentUserArtist;
    }

    public String getLast_tweet(){
        return this.lastTweet;
    }
    public void setLast_tweet(String lastTweet){
        this.lastTweet = lastTweet;
    }
    public void setInfluyentUser(Influyent_User user){
        this.influyentUserArtist = user;
    }
    
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

