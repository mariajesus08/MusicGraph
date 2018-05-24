package grupo6.musicgraph.lucene;


import java.io.IOException;
import java.util.HashSet;
import java.util.Set;
import org.apache.commons.io.IOUtils;
import java.text.Normalizer;


public class Analisis {
    private Integer palabrasPositivos;
    private Integer palabrasNegativos;
    public Set<String> bolsaPalabrasPositivas = new HashSet<>();
    public Set<String> bolsaPalabrasNegativas = new HashSet<>();

    public Analisis() {
        palabrasPositivos = 0;
        palabrasNegativos = 0;
        ClassLoader classLoader = getClass().getClassLoader();
        try {
            bolsaPalabrasPositivas.addAll(IOUtils.readLines(classLoader.getResourceAsStream("positivas.dat"), "UTF-8"));
            bolsaPalabrasPositivas.addAll(IOUtils.readLines(classLoader.getResourceAsStream("negativas.dat"), "UTF-8"));
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    //TODO: ver porqué ningun tweet coincide con uno negativo
    public String analisisSentimientoTweet(String tweet){
        palabrasPositivos = 0;
        palabrasNegativos = 0;
        //se quitan las mayusculas y acentos
        tweet = tweet.toLowerCase();
        tweet = Normalizer.normalize(tweet, Normalizer.Form.NFD)
                .replaceAll("[^\\p{ASCII}]", "");
        String[] palabras = tweet.split(" ");
        for(int i= 0; i < palabras.length; i++){
            for(String palabraP: bolsaPalabrasPositivas){
                if(palabras[i].matches(".*"+palabraP+".*"))
                    palabrasPositivos++;
            }
            for(String palabraN : bolsaPalabrasNegativas){
                if(palabras[i].matches(".*"+palabraN+".*"))
                    palabrasNegativos++;
            }
        }
        if(palabrasPositivos > palabrasNegativos)
            return "Positivo";
        else if(palabrasNegativos > palabrasPositivos)
            return "Negativo";
        return "Neutro";
    }
}
