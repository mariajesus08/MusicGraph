package tbd.restapi;

import org.neo4j.driver.v1.*;
import org.neo4j.driver.v1.Driver;
import org.springframework.beans.factory.annotation.Autowired;
import tbd.restapi.models.Artist;
import tbd.restapi.models.Common_User;
import tbd.restapi.models.UserStatistic;
import tbd.restapi.repositories.*;

import java.sql.*;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Neo4j {

    @Autowired
    private CommonUserRepository commonUserRepository;

    @Autowired
    private InfluyentUserRepository influyentUserRepository;

    @Autowired
    private CommonUserArtistRepository commonUserArtistRepository;

    @Autowired
    private InfluyentUserArtistRepository influyentUserArtistRepository;

    @Autowired
    private ArtistRepository artistRepository;

    public void crearGrafo(){

       /* Driver driver = GraphDatabase.driver("bolt://165.227.12.119:7687", AuthTokens.basic("neo4j", "root123"));
        Session session = driver.session();
        session.run("match (a)-[r]->(b) delete r");
        session.run("match (n) delete n");
        List<Common_User> common_users = commonUserRepository.findAll();
        //PARA AGREGAR LOS NODOS
        for(Common_User common_user : common_users){
            System.out.println(common_user);
            session.run("CREATE (u:User {name: \""+ common_user.getName() + "\""
                    + ", followers:\""+ common_user.getFollowers() +"\""
                    + "})");
        }
        List<Artist> artists = artistRepository.findAll();
        //PARA agregar Artistas
        for(Artist artist :artists){
            session.run("CREATE (a:Artist {name:'" + artist.getName() + "'"
                     +
                    "})");
        }*/

   /*     for(UserStatistic userStatistic : userStatistics) {
            String nombreUsuario = userStatistic.getName();
            String nombreArtista = userStatistic.getArtist();
            nombreArtista = nombreArtista.replace("'", "");
            //PARA AGREGAR LAS RELACIONES
            session.run("match (u:User) where u.name='"+ nombreUsuario+ "' "
                    + "  match (a:Artist) where a.name='" + nombreArtista + "' "
                    + "  create (u)-[r:comenta]->(a)");
        }*/
      //  session.close();
      //  driver.close();
    }
}
