package tbd.analisistweets.mysql;

import java.util.*;

public class Influyent_User {


    private int id;
    private String name;
    private int followers;

    private List<Common_User> commonUsers;



    
    public int getFollowers(){
        return this.followers;
    }

    public void setFollowers(int followers){
        this.followers = followers; 
    }

    public List<Common_User> getCommonUsers() {
        return commonUsers;
    }

 

    public void setCommonUser(List<Common_User> commonUsers) {
        this.commonUsers = commonUsers;
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