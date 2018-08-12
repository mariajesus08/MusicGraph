package tbd.analisistweets.mysql;

import java.util.*;

public class Common_User {


    private int id;

    private String name;

    private int followers;
    

    private Influyent_User influyent_user;

    


    public Influyent_User getInfluyentUser(){
        return this.influyent_user;
    }

    public void setInfluyentUser(Influyent_User user){
        this.influyent_user = user;
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

    public int getFollowers(){
        return this.followers;
    }

    public void setFollowers(int followers){
        this.followers = followers; 
    }
}