package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;

import java.awt.Stroke;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
        //List<String> artistas = new ArrayList<>();
        //List<UserStatistic> userStatistics ;
        //= UserStatisticRepository.findAll();
      //  List<UserStatistic> userStatistics = new ArrayList<>();
       /* UserStatistic u = new UserStatistic();
        u.setName("pepe_23");
        u.setArtist("Maluma");
        u.setDate(new Date());
        u.setLast_tweet("Me gusta la cancion de Maluma");
        u.setVerified(2);
        u.setRelevant(10);
        u.setFollowers(200);
        u.setId(1);
        userStatistics.add(u);*/
        Connection connection = null;
        String username = "root";
        String password = "secret1234";
        String host = "jdbc:mysql://165.227.12.119:3306/";
        String db_name = "musicgraphdb?useSSL=false";
        List<UserStatistic> userStatistics = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(host + db_name, username, password);
            String query = "SELECT name, retweets, followers, lastTweet, date, artist, verified, relevant FROM userStatistics";
            java.sql.Statement st = connection.createStatement();
            ResultSet resultset = st.executeQuery(query);
            while (resultset.next()) {
                UserStatistic userStatistic = new UserStatistic();
                userStatistic.setName(resultset.getString("name"));
                userStatistic.setRetweets(resultset.getInt("retweets"));
                userStatistic.setFollowers(resultset.getInt("followers"));
                userStatistic.setLast_tweet(resultset.getString("lastTweet"));
                userStatistic.setDate(resultset.getDate("date"));
                userStatistic.setArtist(resultset.getString("artist"));
                userStatistic.setVerified(resultset.getInt("verified"));
                //userStatistic.setRelevant(resultset.getInt("relevant"));
                userStatistic.relevant = resultset.getInt("relevant");
                userStatistics.add(userStatistic);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        for(UserStatistic userStatistic : userStatistics){
            HashMap<String, String> map = new HashMap<>();
            map.put("tipo", "user");
            map.put("name", userStatistic.getName());
          //  map.put("retweets", Integer.toString(userStatistic.getRetweets()));
            map.put("followers", Integer.toString(userStatistic.getFollowers()));
            map.put("lastTweet", userStatistic.geLast_tweet());
            map.put("size", Integer.toString(userStatistic.getRelevant()));
            out.add(map);
          //  for(String artista : artistas) {
            //    if (artista == userStatistic.getArtist())
                    ;
              //  else {
                    HashMap<String, String> map2 = new HashMap<>();
                    map2.put("tipo", "artist");
                    map2.put("name", userStatistic.getArtist());
                    map2.put("genre", artistRepository.findFirstArtistByName(userStatistic.getArtist()).getGenre().getName());
                    map2.put("size", "10");
                    out.add(map2);
               // }
          //  }
        }
        return out;
    }

    @CrossOrigin
    @RequestMapping(value = "/graph/relations", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, String>> getRelationsGraph() {
        List<Map<String, String>> out = new ArrayList<>();
        Connection connection = null;
        String username = "root";
        String password = "secret1234";
        String host = "jdbc:mysql://165.227.12.119:3306/";
        String db_name = "musicgraphdb?useSSL=false";
        List<UserStatistic> userStatistics = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(host + db_name, username, password);
            String query = "SELECT name, retweets, followers, lastTweet, date, artist, verified, relevant FROM userStatistics";
            java.sql.Statement st = connection.createStatement();
            ResultSet resultset = st.executeQuery(query);
            while (resultset.next()) {
                UserStatistic userStatistic = new UserStatistic();
                userStatistic.setName(resultset.getString("name"));
                userStatistic.setRetweets(resultset.getInt("retweets"));
                userStatistic.setFollowers(resultset.getInt("followers"));
                userStatistic.setLast_tweet(resultset.getString("lastTweet"));
                userStatistic.setDate(resultset.getDate("date"));
                userStatistic.setArtist(resultset.getString("artist"));
                userStatistic.setVerified(resultset.getInt("verified"));
                //userStatistic.setRelevant(resultset.getInt("relevant"));
                userStatistic.relevant = resultset.getInt("relevant");
                userStatistics.add(userStatistic);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
     /*   List<UserStatistic> userStatistics = new ArrayList<>();
        UserStatistic u = new UserStatistic();
        u.setName("pepe_23");
        u.setArtist("Maluma");
        u.setDate(new Date());
        u.setLast_tweet("Me gusta la cancion de Maluma");
        u.setVerified(2);
        u.setRelevant(1);
        u.setFollowers(200);
        u.setId(1);
        userStatistics.add(u);*/
        for (UserStatistic userStatistic : userStatistics) {
            HashMap<String, String> map = new HashMap<>();
            map.put("source", userStatistic.getName());
            map.put("target", userStatistic.getArtist());
            out.add(map);
        }
        return out;
    }

}

