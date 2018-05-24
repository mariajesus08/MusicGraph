package grupo6.musicgraph.mysql;

import java.sql.*;

//TODO: reestructurar esta clase para almacenar en mysql mediante herramientas de spring
public class AlmacenadorMysql {

    public void insertarEstadistica(String artista, Integer positivos, Integer negativos, Integer totales){
        Connection connection = null;
        String username = "root";
        String password = "secret1234";
        String host = "jdbc:mysql://localhost:3306/";
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
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "Estadistica "+artista);
            ps.setInt(2, negativos);
            ps.setInt(3, positivos);
            ps.setInt(4, totales);
            ps.execute();
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
