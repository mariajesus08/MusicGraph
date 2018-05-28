package grupo6.musicgraph;

import grupo6.musicgraph.lucene.Buscador;
import grupo6.musicgraph.lucene.Index;
import grupo6.musicgraph.mysql.AlmacenadorMysql;
import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

public class AnalisisArtista {

    public void analizarTodos(){
        Index index = new Index();
        index.crearIndice();
        Set<String> bolsaArtistas = new HashSet<>();
        //TODO: Ver porqué algunos artista marcan con tantos falsos comentarios (ej: franco de vita) (alcance de nombre?)
        ClassLoader classLoader = getClass().getClassLoader();
        try {
            bolsaArtistas.addAll(IOUtils.readLines(classLoader.getResourceAsStream("palabras.dat"), "UTF-8"));
        }catch (IOException e){
            e.printStackTrace();
        }
        for(String artista: bolsaArtistas){
            Buscador buscador = new Buscador();
            buscador.buscarArtista(artista);
            buscador.obtenerValoracionArtista();
            AlmacenadorMysql almacenadorMysql = new AlmacenadorMysql();
            int comentariosNegativos = buscador.getCantidadComentarios() - buscador.getNroComentariosPositivos();
            almacenadorMysql.insertarEstadistica(artista, buscador.getNroComentariosPositivos(),
                    comentariosNegativos, buscador.getCantidadComentarios());

        }
        System.out.println("Termino analisis");

    }
}
