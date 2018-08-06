package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;

import java.awt.Stroke;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.*;

import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Artist;
import tbd.restapi.models.Statistic;
import tbd.restapi.models.UserStatistic;
import tbd.restapi.repositories.ArtistRepository;
import tbd.restapi.repositories.UserStatisticRepository;
import org.springframework.data.domain.Sort;

import org.neo4j.driver.v1.*;
import org.neo4j.driver.v1.Driver;

@RestController
@RequestMapping(value = "/userStatistics")

public class UserStatisticService {
    @Autowired
    private UserStatisticRepository UserStatisticRepository ;

    @Autowired
    private ArtistRepository artistRepository;
    
    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<UserStatistic> getAllStatistics(){
        return this.UserStatisticRepository.findAll();
    }
    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public UserStatistic getUser(@PathVariable int id)
    {
        return UserStatisticRepository.findUserStatisticById(id);
    }
    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public UserStatistic createUserStatistic(@RequestBody UserStatistic statistic){ return UserStatisticRepository.save(statistic); }

    @CrossOrigin
    @RequestMapping(value = "/graph/nodes", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, String>> getNodesGraph() {
        List<Map<String, String>> out = new ArrayList<>();
        List<String> artistas = new ArrayList<>();
       // List<UserStatistic> userStatistics = UserStatisticRepository.findAll();
        List<UserStatistic> userStatistics = new ArrayList<>();
        UserStatistic u = new UserStatistic();
        u.setName("pepe_23");
        u.setArtist("Maluma");
        u.setDate(new Date());
        u.setLast_tweet("Me gusta la cancion de Maluma");
        u.setVerified(2);
        u.setRelevant(1);
        u.setFollowers(200);
        u.setId(1);

        for(UserStatistic userStatistic : userStatistics){
            HashMap<String, String> map = new HashMap<>();
            map.put("tipo", "user");
            map.put("name", userStatistic.getName());
            map.put("retweets", Integer.toString(userStatistic.getRetweets()));
            map.put("followers", Integer.toString(userStatistic.getFollowers()));
            map.put("lastTweet", userStatistic.geLast_tweet());
            map.put("size", Integer.toString(userStatistic.getRelevant()));
            out.add(map);
            for(String artista : artistas) {
                if (artista == userStatistic.getArtist())
                    ;
                else {
                    HashMap<String, String> map2 = new HashMap<>();
                    map2.put("tipo", "artist");
                    map2.put("name", userStatistic.getArtist());
                    map2.put("genre", artistRepository.findFirstArtistByName(userStatistic.getArtist()).getGenre().getName());
                    map2.put("size", "10");
                    out.add(map2);
                }
            }
        }
        return out;
    }

    @CrossOrigin
    @RequestMapping(value = "/graph/relations", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, String>> getRelationsGraph() {
        List<Map<String, String>> out = new ArrayList<>();
        //List<UserStatistic> userStatistics = UserStatisticRepository.findAll();
        List<UserStatistic> userStatistics = new ArrayList<>();
        UserStatistic u = new UserStatistic();
        u.setName("pepe_23");
        u.setArtist("Maluma");
        u.setDate(new Date());
        u.setLast_tweet("Me gusta la cancion de Maluma");
        u.setVerified(2);
        u.setRelevant(1);
        u.setFollowers(200);
        u.setId(1);
        for (UserStatistic userStatistic : userStatistics) {
            HashMap<String, String> map = new HashMap<>();
            map.put("source", userStatistic.getName());
            map.put("target", userStatistic.getArtist());
            out.add(map);
        }
        return out;
    }

}

