package grupo6.musicgraph.lucene;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.apache.commons.io.IOUtils;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.IndexWriterConfig.OpenMode;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

//TODO: terminar esta clase
public class Analisis {
    private Integer comentariosTotales;
    private Integer comentariosPositivos;
    private Integer comentariosNegativos;
    public Set<String> bolsaPalabrasPositivas = new HashSet<>();
    public Set<String> bolsaPalabrasNegativas = new HashSet<>();

    public Analisis() {
        comentariosTotales = 0;
        comentariosPositivos = 0;
        comentariosNegativos = 0;
        ClassLoader classLoader = getClass().getClassLoader();
        try {
            bolsaPalabrasPositivas.addAll(IOUtils.readLines(classLoader.getResourceAsStream("positivas.dat"), "UTF-8"));
            bolsaPalabrasPositivas.addAll(IOUtils.readLines(classLoader.getResourceAsStream("negativas.dat"), "UTF-8"));
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public String analisisSentimientoTweet(String tweet){
        int contadorPositivas = 0;
        int contadorNegativas = 0;

        return "Return";
    }

    public Integer getComentariosTotales() {
        return comentariosTotales;
    }

    public void setComentariosTotales(Integer comentariosTotales) {
        this.comentariosTotales = comentariosTotales;
    }

    public Integer getComentariosPositivos() {
        return comentariosPositivos;
    }

    public void setComentariosPositivos(Integer comentariosPositivos) {
        this.comentariosPositivos = comentariosPositivos;
    }

    public Integer getComentariosNegativos() {
        return comentariosNegativos;
    }

    public void setComentariosNegativos(Integer comentariosNegativos) {
        this.comentariosNegativos = comentariosNegativos;
    }
}
