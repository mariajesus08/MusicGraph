package tbd.analisistweets.lucene;

import org.apache.commons.io.IOUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.FSDirectory;

import java.io.IOException;
import java.nio.file.Paths;
import java.text.Normalizer;
import java.util.HashSet;
import java.util.Set;

public class Analisis {
    private Integer palabrasPositivos;
    private Integer palabrasNegativos;
    public Set<String> bolsaPalabrasPositivas = new HashSet<>();
    public Set<String> bolsaPalabrasNegativas = new HashSet<>();


    public Analisis() throws Exception{
        palabrasPositivos = 0;
        palabrasNegativos = 0;
        ClassLoader classLoader = getClass().getClassLoader();
        bolsaPalabrasPositivas.addAll(IOUtils.readLines(classLoader.getResourceAsStream("positivas.dat"), "UTF-8"));
        bolsaPalabrasNegativas.addAll(IOUtils.readLines(classLoader.getResourceAsStream("negativas.dat"), "UTF-8"));
    }

    public String analisisSentimientoTweet(String tweet){
        palabrasPositivos = 0;
        palabrasNegativos = 0;
        //se quitan las mayusculas y acentos
        tweet = tweet.toLowerCase();
        tweet = Normalizer.normalize(tweet, Normalizer.Form.NFD)
                .replaceAll("[^\\p{ASCII}]", "");
        String[] palabras = tweet.split(" ");
        for(int i= 0; i < palabras.length; i++){
            //System.out.println(palabras[i]);
            for(String palabraP: bolsaPalabrasPositivas){
                if(tweet.matches(".*"+palabraP+".*"))
                    palabrasPositivos++;
            }
            for(String palabraN : bolsaPalabrasNegativas){
                if(tweet.matches(".*"+palabraN+".*"))
                    palabrasNegativos++;
            }
        }
        if(palabrasNegativos>0)
            System.out.println("NEG:"+palabrasNegativos);
        if(palabrasPositivos > palabrasNegativos){
            return "Positivo";
        }
        else if(palabrasNegativos > palabrasPositivos) {
            return "Negativo";
        }
        return "Neutro";
    }
}
