package tbd.analisistweets.lucene;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.Normalizer;


public class Analisis {
    private Integer porcentajePositivo;
    private Integer porcentajeNegativo;
    private static HttpURLConnection con;

    public Analisis() throws Exception{
        porcentajePositivo = 0;
        porcentajeNegativo = 0;
    }

    public String analisisSentimientoTweet(String tweet) throws Exception{
        porcentajePositivo = 0;
        porcentajeNegativo = 0;
        //se quitan las mayusculas y acentos
        tweet = tweet.toLowerCase();
        tweet = Normalizer.normalize(tweet, Normalizer.Form.NFD)
                .replaceAll("[^\\p{ASCII}]", "");

        String url = "http://localhost:8080/classify";
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
            porcentajePositivo = Integer.parseInt(positivos);
            porcentajeNegativo = Integer.parseInt(negativos);

        } finally {

            con.disconnect();
        }

        if(porcentajePositivo > porcentajeNegativo){
            System.out.println("positivo");
            return "Positivo";
        }
        else if(porcentajeNegativo > porcentajePositivo) {
            System.out.println("negativo");
            return "Negativo";
        }
        System.out.println("neutro");
        return "Neutro";
    }
    public static String getPositivos(String tweet){
        String positivos = "";
        Integer indice = tweet.indexOf(":");
        Integer indiceEnd = tweet.indexOf(",");
        positivos = tweet.substring(indice+1, indiceEnd);
        return positivos;
    }

    public static String getNegativos(String tweet){
        String negativos = "";
        Integer indice = tweet.indexOf(",");
        negativos = tweet.substring(indice+12, indice+30);
        return negativos;
    }
}
