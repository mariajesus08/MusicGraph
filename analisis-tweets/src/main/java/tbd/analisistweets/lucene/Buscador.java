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

import javax.print.Doc;
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
    public List<Integer> idTweetsArtista;
    private Analisis analisis;
    private IndexReader reader;
    private IndexSearcher searcher;
    private Analyzer analyzer;

    public Buscador() throws Exception{
        cantidadComentarios = 0;
        nroComentariosPositivos = 0;
        nroComentariosNegativos = 0;
        idTweetsArtista = new ArrayList<>();
        analisis = new Analisis();
        reader = DirectoryReader.open(FSDirectory.open(Paths.get("indice")));
        searcher = new IndexSearcher(reader);
        analyzer = new StandardAnalyzer();
    }

    public void buscarArtista(String artista) throws Exception {
        cantidadComentarios = 0;
        QueryParser parser = new QueryParser("text", analyzer);
        Query query = parser.parse(artista);
        TopDocs results = searcher.search(query, 50000);
        ScoreDoc[] hits = results.scoreDocs;
        for(int i = 0; i < hits.length; i++)
            idTweetsArtista.add(hits[i].doc);
        cantidadComentarios = hits.length;
    }

    public void obtenerValoracionArtista() throws Exception{
        nroComentariosPositivos = 0;
        nroComentariosNegativos = 0;
        for(int i = 0; i < cantidadComentarios; i++){
            Document d = searcher.doc(idTweetsArtista.get(i));
            String tweet = d.get("text");
            String resultado = analisis.analisisSentimientoTweet(tweet);
            if(resultado.equals("Positivo"))
                nroComentariosPositivos++;
            if(resultado.equals("Negativo"))
                nroComentariosNegativos++;
        }
        reader.close();
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
