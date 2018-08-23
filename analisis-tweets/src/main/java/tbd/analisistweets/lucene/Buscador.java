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
    private Float nroComentariosPositivos;
    private Float nroComentariosNegativos;
    private List<String> tweetersName;
    private List<String> locations;
    private List<String> lastestTweets;
    private List<Integer> followersCount;
    private List<Float> listaComentariosPositivos;
    private List<Float> listaComentariosNegativos;
    private List<Integer> retweetsCount;
    public List<Integer> idTweetsArtista;
    private Analisis analisis;
    private IndexReader reader;
    private IndexSearcher searcher;
    private Analyzer analyzer;

    public Buscador() throws Exception{
        tweetersName = new ArrayList<String> ();
        followersCount = new ArrayList<Integer> ();
        retweetsCount = new ArrayList<Integer> ();
        lastestTweets = new ArrayList<String> ();
        listaComentariosNegativos = new ArrayList<Float> ();
        listaComentariosPositivos = new ArrayList<Float> ();
        locations = new ArrayList<String>();
        cantidadComentarios = 0;
        nroComentariosPositivos = 0f;
        nroComentariosNegativos = 0f;
        idTweetsArtista = new ArrayList<>();
        analisis = new Analisis();
        reader = DirectoryReader.open(FSDirectory.open(Paths.get("indice")));
        searcher = new IndexSearcher(reader);
        analyzer = new StandardAnalyzer();
    }

    

	/**
	 * @return the listaComentariosNegativos
	 */
	public List<Float> getListaComentariosNegativos() {
		return listaComentariosNegativos;
	}



	/**
	 * @param listaComentariosNegativos the listaComentariosNegativos to set
	 */
	public void setListaComentariosNegativos(List<Float> listaComentariosNegativos) {
		this.listaComentariosNegativos = listaComentariosNegativos;
	}



	/**
	 * @return the listaComentariosPositivos
	 */
	public List<Float> getListaComentariosPositivos() {
		return listaComentariosPositivos;
	}



	/**
	 * @param listaComentariosPositivos the listaComentariosPositivos to set
	 */
	public void setListaComentariosPositivos(List<Float> listaComentariosPositivos) {
		this.listaComentariosPositivos = listaComentariosPositivos;
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
        float auxPositivos = 0f;
        float auxNegativos = 0f;
        for(int i = 0; i < cantidadComentarios; i++){
            Document d = searcher.doc(idTweetsArtista.get(i));
            String tweet = d.get("text");
            String artistAux = d.get("artistName");
            int followersAux = Integer.parseInt(d.get("followers"));
            int retweet = Integer.parseInt(d.get("retweets"));
            this.tweetersName.add(artistAux);
            this.followersCount.add(followersAux);
            this.retweetsCount.add(retweet);
            this.lastestTweets.add(tweet);
            List<Float> resultado = new ArrayList<Float>();
            resultado = analisis.analisisSentimientoTweet(tweet);
            String locationAux = d.get("location");
            locationAux.toLowerCase();
            if((locationAux.indexOf("santiago")!=-1) || (locationAux.indexOf("metropolitana")!=-1) || (locationAux.indexOf("arica")!=-1) || (locationAux.indexOf("parinacota")!=-1)
             || (locationAux.indexOf("tarapaca")!=-1) || (locationAux.indexOf("tarapacá")!=-1) || (locationAux.indexOf("antofagasta")!=-1) || (locationAux.indexOf("atacama")!=-1)
            || (locationAux.indexOf("coquimbo")!=-1) || (locationAux.indexOf("valparaiso")!=-1) || (locationAux.indexOf("viña")!=-1) || (locationAux.indexOf("higgins")!=-1) 
            || (locationAux.indexOf("maule")!=-1) || (locationAux.indexOf("biobio")!=-1) || (locationAux.indexOf("biobío")!=-1) || (locationAux.indexOf("araucania")!=-1) 
            || (locationAux.indexOf("araucanía")!=-1) || (locationAux.indexOf("rios")!=-1) || (locationAux.indexOf("ríos")!=-1) || (locationAux.indexOf("lagos")!=-1) 
            || (locationAux.indexOf("aysen")!=-1) || (locationAux.indexOf("aysén")!=-1) || (locationAux.indexOf("magallanes")!=-1) || (locationAux.indexOf("antartica")!=-1) 
            || (locationAux.indexOf("antártica")!=-1)){
                this.locations.add(locationAux);
                this.listaComentariosPositivos.add(resultado.get(0));
                this.listaComentariosNegativos.add(resultado.get(1));

            }
            if(auxPositivos == 0f){
                auxPositivos = resultado.get(0);
            } else {
                auxPositivos = (auxPositivos + resultado.get(0))/2;
            }
            if(auxNegativos == 0f){
                auxNegativos = resultado.get(1);
            } else {
                auxNegativos = (auxNegativos + resultado.get(1))/2;
            }
        }
        this.nroComentariosNegativos = auxNegativos;
        this.nroComentariosPositivos = auxPositivos;
        reader.close();
    }
    public List<String> getLastestTweets(){
        return this.lastestTweets;
    }
    public List<String> getLocation(){
        return this.locations;
    }
    public List<String> getTweetersName(){
        return this.tweetersName;
    }
    public List<Integer> getRetweetsCount(){
        return this.retweetsCount;
    }
    public List<Integer> getFollowersCount(){
        return this.followersCount;
    }

    public Integer getCantidadComentarios() {
        return cantidadComentarios;
    }

    public void setCantidadComentarios(Integer cantidadComentarios) {
        this.cantidadComentarios = cantidadComentarios;
    }
    


    public Float getNroComentariosPositivos() {
        return nroComentariosPositivos;
    }

    public void setNroComentariosPositivos(Float nroComentariosPositivos) {
        this.nroComentariosPositivos = nroComentariosPositivos;
    }

    public Float getNroComentariosNegativos() {
        return nroComentariosNegativos;
    }

    public void setNroComentariosNegativos(Float nroComentariosNegativos) {
        this.nroComentariosNegativos = nroComentariosNegativos;
    }
}
