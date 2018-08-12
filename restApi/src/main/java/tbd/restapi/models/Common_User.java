package tbd.restapi.models;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import org.neo4j.ogm.annotation.NodeEntity;

import javax.persistence.*;
import java.util.*;

@Entity
@Inheritance
@Table(name = "common_user")
public class Common_User {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    @Column(name = "followers")
    private int followers;
    
    @JsonIgnore
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="id_influyent_user", nullable = false)
    private Influyent_User influyent_user;

    


    @JsonBackReference
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

