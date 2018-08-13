package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Artist;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.models.Influyent_User_Artist;
import tbd.restapi.repositories.ArtistRepository;
import tbd.restapi.repositories.InfluyentUserArtistRepository;
import tbd.restapi.repositories.InfluyentUserRepository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/InfluyentUserArtist")

public class InfluyentUserArtistService {
    @Autowired
    private InfluyentUserArtistRepository influyentUserArtistRepository;

    @Autowired
    private ArtistRepository artistRepository;

    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Influyent_User_Artist> getAllInfluyentUser(){
        return this.influyentUserArtistRepository.findAll();
    }

 

    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Influyent_User_Artist getInfluyentUser(@PathVariable int id)
    {
        return influyentUserArtistRepository.findFirstInfluyent_User_ArtistById(id);
    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Influyent_User_Artist createInfluyentUser(@RequestBody Influyent_User_Artist commonUser){

        return influyentUserArtistRepository.save(commonUser);

    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteInfluyentUser(@RequestBody int id){
        influyentUserArtistRepository.deleteInfluyent_User_ArtistById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/graph/nodes", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, String>> getNodesGraph() {
        List<Map<String, String>> resultado = new ArrayList<>();
        Connection connection = null;
        String username = "root";
        String password = "secret1234";
        String host = "jdbc:mysql://165.227.12.119:3306/";
        String db_name = "musicgraphdb?useSSL=false";
        List<Influyent_User> influyent_users = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(host + db_name, username, password);
            String query = "SELECT id, name, followers FROM influyent_user";
            java.sql.Statement st = connection.createStatement();
            ResultSet resultset = st.executeQuery(query);
            while (resultset.next()) {
                Influyent_User influyent_user = new Influyent_User();
                influyent_user.setId(resultset.getInt("id"));
                influyent_user.setName(resultset.getString("name"));
                influyent_user.setFollowers(resultset.getInt("followers"));
                influyent_users.add(influyent_user);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        for(Influyent_User influyent_user : influyent_users) {
            HashMap<String, String> map = new HashMap<>();
            map.put("type", "InfluyentUser");
            map.put("name", influyent_user.getName());
            map.put("followers", Integer.toString(influyent_user.getFollowers()));
            Integer size = influyent_user.getFollowers() % 30;
            if(size < 10)
                size = 10;
            map.put("size", Integer.toString(size));
            resultado.add(map);
        }
        List<Influyent_User_Artist> influyent_user_artists = influyentUserArtistRepository.findAll();
        List<Integer> artistasId = new ArrayList<>();
        for(Influyent_User_Artist influyent_user_artist : influyent_user_artists) {
            HashMap<String, String> map2 = new HashMap<>();
            if(artistasId.contains(influyent_user_artist.getArtist().getId())) {

            }
            else{
                artistasId.add(influyent_user_artist.getArtist().getId());
                map2.put("type", "artist");
                map2.put("name", influyent_user_artist.getArtist().getName());
                map2.put("genre", influyent_user_artist.getArtist().getGenre().getName());
                map2.put("size", "10");
                resultado.add(map2);
            }
        }
        return resultado;
    }

    @CrossOrigin
    @RequestMapping(value = "/graph/relations", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, String>> getRelationsGraph() {
        List<Map<String, String>> resultado = new ArrayList<>();
        List<Influyent_User_Artist> influyent_user_artists = influyentUserArtistRepository.findAll();
        for(Influyent_User_Artist influyent_user_artist : influyent_user_artists) {
            HashMap<String, String> map = new HashMap<>();
            map.put("source", influyent_user_artist.getInfluyentUser().getName());
            map.put("target", influyent_user_artist.getArtist().getName());
            resultado.add(map);
        }
        return resultado;
    }

}

