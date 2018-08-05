package tbd.analisistweets.lucene;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;
import java.util.ArrayList;
import java.util.List;


public class Analisis {
    private float porcentajePositivo;
    private float porcentajeNegativo;
    private static HttpURLConnection con;

    public Analisis() throws Exception{
        porcentajePositivo = 0;
        porcentajeNegativo = 0;
    }

    public List<Float> analisisSentimientoTweet(String tweet) throws Exception{
        porcentajePositivo = 0;
        porcentajeNegativo = 0;
        //se quitan las mayusculas y acentos
        tweet = tweet.toLowerCase();
        tweet = Normalizer.normalize(tweet, Normalizer.Form.NFD)
                .replaceAll("[^\\p{ASCII}]", "");

        String url = "http://localhost:8989/classify";
        String urlParameters = "text="+tweet;
        byte[] postData = urlParameters.getBytes(StandardCharsets.UTF_8);

        try {

            URL myurl = new URL(url);
            con = (HttpURLConnection) myurl.openConnection();

            con.setDoOutput(true);
            con.setRequestMethod("POST");
            con.setRequestProperty("User-Agent", "Java client");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postData);
            }

            StringBuilder content;

            try (BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()))) {

                String line;
                content = new StringBuilder();

                while ((line = in.readLine()) != null) {
                    content.append(line);
                    content.append(System.lineSeparator());
                }
            }
            String positivos = getPositivos(content.toString());
            String negativos = getNegativos(content.toString());
            porcentajePositivo = Float.valueOf(positivos);
            porcentajeNegativo = Float.valueOf(negativos);
          

        }

        catch (IOException | StringIndexOutOfBoundsException | NumberFormatException a) {
            porcentajeNegativo = Float.valueOf("0.5");
            porcentajePositivo = Float.valueOf("0.5");
        } finally {

            con.disconnect();
        }
        List<Float> lista = new ArrayList<Float>();
        lista.add(1-porcentajeNegativo);
        lista.add(porcentajeNegativo);
        return lista;
    }
    public static String getNegativos(String tweet){
        String positivos = "";
        Integer tamano = (tweet.length() / 2) - 13 ;
        Integer indice = tweet.indexOf(":");
        Integer indiceEnd = tweet.indexOf(",");
        positivos = tweet.substring(indice+2, indice+tamano);
        return positivos;
    }

    public static String getPositivos(String tweet){
        String negativos = "";
        Integer tamano = (tweet.length() / 2) - 13 ;
        Integer indice = tweet.indexOf(",");
        negativos = tweet.substring(indice+14, indice+tamano);
        return negativos;
    }
}
