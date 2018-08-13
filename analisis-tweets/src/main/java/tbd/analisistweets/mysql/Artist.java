package tbd.analisistweets.mysql;

import java.util.*;

public class Artist {

    private int id;

    private String name;

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    private Genre genre;

    private List<Statistic> statistic;

    private List<Influyent_User_Artist> artistInfluyentUser;

    private List<Common_User_Artist> artist_common_user;


    public List<Common_User_Artist> getCommonUsers(){
        return this.artist_common_user;
    }

    public void setCommonUsers(List<Common_User_Artist> userArtist){
        this.artist_common_user = userArtist;
    }

    public List<Influyent_User_Artist> getInfluyentUsers(){
        return this.artistInfluyentUser;
    }

    public void setInfluyentUsers(List<Influyent_User_Artist> userArtist){
        this.artistInfluyentUser = userArtist;
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

