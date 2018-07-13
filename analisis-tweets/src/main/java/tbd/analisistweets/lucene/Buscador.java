package tbd.analisistweets.lucene;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;

import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Buscador {
    private Integer cantidadComentarios;
    private Integer nroComentariosPositivos;
    private Integer nroComentariosNegativos;
    public List<String> ComentariosArtista;
    private Analisis analisis;

    public Buscador() {
        cantidadComentarios = 0;
        nroComentariosPositivos = 0;
        nroComentariosNegativos = 0;
        ComentariosArtista = new ArrayList<>();
        analisis = new Analisis();
    }

    public void buscarArtista(String artista){
        cantidadComentarios = 0;
        try {
            IndexReader reader = DirectoryReader.open(FSDirectory.open(Paths.get("indice")));
            IndexSearcher searcher = new IndexSearcher(reader);
            Analyzer analyzer = new StandardAnalyzer();

            QueryParser parser = new QueryParser("text", analyzer);
            Query query = parser.parse(artista);

            TopDocs results = searcher.search(query, 25000);
            ScoreDoc[] hits = results.scoreDocs;
            for(int i = 0; i < hits.length; i++) {
                Document doc = searcher.doc(hits[i].doc);
                ComentariosArtista.add(doc.get("text"));
            }
            cantidadComentarios = ComentariosArtista.size();
            reader.close();
        }
        catch(IOException ioe) {
            Logger.getLogger(Buscador.class.getName()).log(Level.SEVERE, null, ioe);
        }
        catch(ParseException pe) {
            Logger.getLogger(Buscador.class.getName()).log(Level.SEVERE, null, pe);
        }
    }

    public void obtenerValoracionArtista(){
        nroComentariosPositivos = 0;
        nroComentariosNegativos = 0;
        for(int i = 0; i < ComentariosArtista.size(); i++){
            String resultado = analisis.analisisSentimientoTweet(ComentariosArtista.get(i));
            if(resultado.equals("Positivo"))
                nroComentariosPositivos++;
            if(resultado.equals("Negativo"))
                nroComentariosNegativos++;
        }
    }

    public Integer getCantidadComentarios() {
        return cantidadComentarios;
    }

    public void setCantidadComentarios(Integer cantidadComentarios) {
        this.cantidadComentarios = cantidadComentarios;
    }

    public Integer getNroComentariosPositivos() {
        return nroComentariosPositivos;
    }

    public void setNroComentariosPositivos(Integer nroComentariosPositivos) {
        this.nroComentariosPositivos = nroComentariosPositivos;
    }

    public Integer getNroComentariosNegativos() {
        return nroComentariosNegativos;
    }

    public void setNroComentariosNegativos(Integer nroComentariosNegativos) {
        this.nroComentariosNegativos = nroComentariosNegativos;
    }
}
