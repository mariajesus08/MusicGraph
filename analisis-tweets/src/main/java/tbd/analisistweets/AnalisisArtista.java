package tbd.analisistweets;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import org.apache.commons.io.IOUtils;
import tbd.analisistweets.lucene.Buscador;
import tbd.analisistweets.lucene.Index;
import tbd.analisistweets.mysql.AlmacenadorMysql;

public class AnalisisArtista {

    public void analizarTodos() throws Exception {
        //TODO: Ver porqué algunos artista marcan con tantos falsos comentarios (ej: franco de vita) (alcance de nombre?)
        System.out.println("Empezó análisis de tweets");
        Index index = new Index();
        index.crearIndice();
        Connection connection = null;
        //TODO: cambiar según nombre de la base de datos
        String username = "root";
        String password = "secret1234";
        //String host = "jdbc:mysql://165.227.12.119:3306/";
        String host = "jdbc:mysql://localhost:3306/";
        String db_name = "musicgraphdb?useSSL=false";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(host + db_name, username, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();

        }
        List<String> palabras = new ArrayList<String>();;
        String palabrasQuery = "SELECT word FROM keywords";
        try{
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(palabrasQuery);
            while(resultSet.next())
                palabras.add(resultSet.getString("word"));
        }catch (SQLException e) {
            e.printStackTrace();
        }

        for(String artista: palabras){
            Buscador buscador = new Buscador();
            buscador.buscarArtista(artista);
            buscador.obtenerValoracionArtista();
            AlmacenadorMysql almacenadorMysql = new AlmacenadorMysql();
            int comentariosNegativos = buscador.getCantidadComentarios() - buscador.getNroComentariosPositivos();
            almacenadorMysql.insertarEstadistica(artista, buscador.getNroComentariosPositivos(),
                    comentariosNegativos, buscador.getCantidadComentarios());

        }
        System.out.println("Finalizó análisis de tweets");

    }
}
