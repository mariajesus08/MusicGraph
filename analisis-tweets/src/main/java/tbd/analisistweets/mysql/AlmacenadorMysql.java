package tbd.analisistweets.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AlmacenadorMysql {
    public void insertarEstadistica(String artista, Integer positivos, Integer negativos, Integer totales){
        Connection connection = null;
        //TODO: cambiar según nombre de la base de datos
        String username = "root";
        String password = "secret1234";
        String host = "jdbc:mysql://165.227.12.119:3306/";
        String db_name = "musicgraphdb?useSSL=false";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(host + db_name, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        }
        //TODO: falta guardar el id_artist y id_genre
        /* String queryId = "SELECT id FROM genres WHERE id_artist = ?";
        Integer idGenero = new Integer(0);
        try{
            PreparedStatement ps = connection.prepareStatement(queryId);
            ps.setString(1, artista);
            ResultSet resultSet = ps.executeQuery();
            idGenero = resultSet.getInt("id");
         }catch (SQLException e) {
            e.printStackTrace();
        } */

        String query = "INSERT INTO statistics (name,negative_tweets,positive_tweets, total_tweets) VALUES (?,?,?,?)";
        String setIds =  "UPDATE statistics, artists SET statistics.id_artist = artists.id WHERE artists.name = statistics.name;";
        String setGenres =  "UPDATE statistics, artists SET statistics.id_genre = artists.id_genre WHERE artists.id = statistics.id_artist;";

//       "UPDATE statistics, artists SET statistics.id_artist = artists.id WHERE artists.name = statistics.name;"

        try{
            PreparedStatement ps = connection.prepareStatement(query);
            PreparedStatement ps2 = connection.prepareStatement(setIds);
            PreparedStatement ps3 = connection.prepareStatement(setGenres);
            ps.setString(1, artista);
            ps.setInt(2, negativos);
            ps.setInt(3, positivos);
            ps.setInt(4, totales);
            ps.execute();
            ps2.execute();
            ps3.execute();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
