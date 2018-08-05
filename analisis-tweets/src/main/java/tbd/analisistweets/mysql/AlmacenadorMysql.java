package tbd.analisistweets.mysql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class AlmacenadorMysql {
    public void insertarEstadistica(String artista, Float positivos, Float negativos, Integer totales){

        System.out.println("Ingresando estadisticas de: "+artista);
        if(artista.equals("Shawn Mendes")){
            System.out.println("** Artista N°100, quedan 295 **");
        }
        if(artista.equals("Ray Charles")){
            System.out.println("** Artista N°200, quedan 195 **");
        }
        if(artista.equals("Inna de Yard")){
            System.out.println("** Artista N°300, quedan 95 **");
        }
        if(artista.equals("La India")){
            System.out.println("** Artista N°350, quedan 45 **");
        }
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

        String query = "INSERT INTO statistics (name,negative_tweets,positive_tweets, total_tweets) VALUES (?,?,?,?)";
        String setIds =  "UPDATE statistics, artists SET statistics.id_artist = artists.id WHERE artists.name = statistics.name;";
        String setGenres =  "UPDATE statistics, artists SET statistics.id_genre = artists.id_genre WHERE artists.id = statistics.id_artist;";
        String queryGet = "SELECT * FROM statistics WHERE statistics.name = \""+artista+"\";";
        try{

            PreparedStatement ps = connection.prepareStatement(query);
            Statement ps2 = connection.createStatement();
            Statement ps3 = connection.createStatement();
            
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(queryGet);
            int total_tweetsAux = 0;
            float positivosAux = 0f;
            float negativosAux = 0f;
            while(rs.next()){
                total_tweetsAux = rs.getInt("total_tweets");
                positivosAux = rs.getInt("positive_tweets");
                negativosAux = rs.getInt("negative_tweets");
            }
            totales = totales + total_tweetsAux;
            if(positivosAux != 0f){
                positivos = (positivos+positivosAux)/2;
            }
            if(negativosAux != 0f){
                negativos = (negativos+negativosAux)/2;
            }
            ps.setString(1, artista);
            ps.setFloat(2, negativos);
            ps.setFloat(3, positivos);
            ps.setInt(4, totales);
            ps.execute();
            ps2.executeUpdate(setIds);
            ps3.executeUpdate(setGenres);
            
        }catch (SQLException e) {
            e.printStackTrace();
        }finally{
            try { connection.close(); } catch (Exception e) { /* ignored */ }
        }

        
    }
}
