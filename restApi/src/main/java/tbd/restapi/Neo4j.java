package tbd.restapi;

import org.neo4j.driver.v1.*;
import org.neo4j.driver.v1.Driver;
import tbd.restapi.models.Artist;
import tbd.restapi.models.UserStatistic;

import java.sql.*;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Neo4j {

    public void crearGrafo(){
        Connection connection = null;
        String username = "root";
        String password = "secret1234";
        String host = "jdbc:mysql://165.227.12.119:3306/";
        String db_name = "musicgraphdb?useSSL=false";
        List<Artist> artists = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(host + db_name, username, password);
            String query = "SELECT name FROM artists";
            Statement st = connection.createStatement();
            ResultSet resultset = st.executeQuery(query);
            while (resultset.next()) {
                Artist artist = new Artist();
                String nombre = resultset.getString("name");
                nombre = nombre.replace("'","");
                artist.setName(nombre);
                artists.add(artist);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        List<UserStatistic> userStatistics = new ArrayList<>();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(host + db_name, username, password);
            String query = "SELECT name, retweets, followers, lastTweet, date, artist FROM userStatistics";
            Statement st = connection.createStatement();
            ResultSet resultset = st.executeQuery(query);
            while (resultset.next()) {
                UserStatistic userStatistic = new UserStatistic();
                userStatistic.setName(resultset.getString("name"));
                userStatistic.setRetweets(resultset.getInt("retweets"));
                userStatistic.setFollowers(resultset.getInt("followers"));
                userStatistic.setLast_tweet(resultset.getString("lastTweet"));
                userStatistic.setDate(resultset.getDate("date"));
                userStatistic.setArtist(resultset.getString("artist"));
                userStatistics.add(userStatistic);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        Driver driver = GraphDatabase.driver("bolt://165.227.12.119:7687", AuthTokens.basic("neo4j", "root123"));
        Session session = driver.session();
        session.run("match (a)-[r]->(b) delete r");
        session.run("match (n) delete n");
        for(UserStatistic userStatistic : userStatistics){
            session.run("CREATE (u:User {name: \""+ userStatistic.getName() + "\""
                    + ", retweets:\""+ userStatistic.getRetweets() +"\""
                    + ", followers:\""+ userStatistic.getFollowers() +"\""
                    + ", last_tweet:\""+ userStatistic.geLast_tweet() +"\""
                    + ", verified:\""+ userStatistic.getVerified() +"\""
                    + ", relevant:\""+ userStatistic.getRelevant() +"\""
                    + ", date:\""+ userStatistic.getDate() +"\""
                    + ", artist:\""+ userStatistic.getArtist() +"\""
                    + "})");
        }

        for(Artist artist :artists){
            session.run("CREATE (a:Artist {name:'" + artist.getName() + "'"
                     +
                    "})");
        }

        for(UserStatistic userStatistic : userStatistics) {
            String nombreUsuario = userStatistic.getName();
            String nombreArtista = userStatistic.getArtist();
            nombreArtista = nombreArtista.replace("'", "");
            session.run("match (u:User) where u.name='"+ nombreUsuario+ "' "
                    + "  match (a:Artist) where a.name='" + nombreArtista + "' "
                    + "  create (u)-[r:comenta]->(a)");
        }

        StatementResult result = session.run( "MATCH (n:Artist) RETURN n");
        while ( result.hasNext() )
        {
            Record record = result.next();
            System.out.println( record.get("name") );
        }
        session.close();
        driver.close();
    }
}
