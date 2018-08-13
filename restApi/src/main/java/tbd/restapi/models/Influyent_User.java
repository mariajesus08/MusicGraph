package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import org.neo4j.ogm.annotation.NodeEntity;

import javax.persistence.*;
import java.util.*;

@Entity
@Inheritance
@Table(name = "influyent_user")
public class Influyent_User {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "name")
    private String name;
    @Column(name = "followers")
    private int followers;

    @OneToMany(mappedBy = "influyent_user")
    private List<Common_User> commonUsers;


    @OneToMany(mappedBy = "influyentUserArtist")
    private List<Influyent_User_Artist> influyentUserArtist;

    
    public int getFollowers(){
        return this.followers;
    }

    public void setFollowers(int followers){
        this.followers = followers; 
    }

    @JsonManagedReference(value="influyent-common")
    public List<Common_User> getCommonUsers() {
        return commonUsers;
    }

    public void setInfluyentUserArtist(List<Influyent_User_Artist> influyentUsersArtists) {
        this.influyentUserArtist = influyentUsersArtists;
    }
    @JsonManagedReference(value="influyent-artist-relation")
    public List<Influyent_User_Artist> getInfluyentUserArtist() {
        return this.influyentUserArtist;
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

