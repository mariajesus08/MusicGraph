package tbd.analisistweets.mysql;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.util.HashMap;
import java.util.Map;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.client.CredentialsProvider;
import org.apache.http.entity.StringEntity;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.util.EntityUtils;
import org.apache.http.client.ResponseHandler;
import org.apache.http.HttpHeaders;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.http.impl.client.HttpClientBuilder;
import java.util.concurrent.TimeUnit;

public class AlmacenadorMysql {

    

    public void insertarEstadistica(int id, String artista, List<String> nombreTweeteros,List<String> lastestTweets,List<Integer> followersCount,List<Integer> retweetsCount, Float positivos, Float negativos, Integer totales) throws Exception{
        
        System.out.println("Ingresando estadisticas de: "+artista);
        if(id == 100){
            System.out.println("** Artista N°100, quedan 288 **");
        }
        if(id == 200){
            System.out.println("** Artista N°200, quedan 288 **");
        }
        if(id == 300){
            System.out.println("** Artista N°300, quedan 88 **");
        }
        if(id == 350){
            System.out.println("** Artista N°350, quedan 38 **");
        }

        CredentialsProvider provider = new BasicCredentialsProvider();
            UsernamePasswordCredentials credentials
            = new UsernamePasswordCredentials("root", "secret1234");
            provider.setCredentials(AuthScope.ANY, credentials);
        float tweetsPositivos = 0f;
        float tweetsNegativos = 0f;
        int tweetsTotales = 0;
        ResponseHandler<String> responseHandler = new ResponseHandler<String>() {

            @Override
            public String handleResponse(
                    final HttpResponse response) throws ClientProtocolException, IOException {
                int status = response.getStatusLine().getStatusCode();
                if (status >= 200 && status < 300) {
                    HttpEntity entity = response.getEntity();
                    return entity != null ? EntityUtils.toString(entity) : null;
                } else {
                    throw new ClientProtocolException("Unexpected response status: " + status);
                }
            }

        };

        CloseableHttpClient httpclient = HttpClientBuilder.create()
        .setDefaultCredentialsProvider(provider)
        .build();
        String idArtista = Integer.toString(id);
        try {
            HttpGet httpget = new HttpGet("http://165.227.12.119:9091/artists/lastStatistic/"+idArtista);


            // Create a custom response handler
           
            String responseBodyGet = httpclient.execute(httpget, responseHandler);
            if(responseBodyGet.isEmpty()){
                tweetsTotales = 0;
                tweetsPositivos = 0.5f;
                tweetsNegativos = 0.5f;
            } else {
                Gson gson = new GsonBuilder().create();
                Statistic p = gson.fromJson(responseBodyGet, Statistic.class);
                tweetsTotales = p.getTotal_tweets();
                tweetsPositivos = p.getPositiveTweets();
                tweetsNegativos = p.getNegativeTweets();
            }
            
            
            tweetsTotales = totales+tweetsTotales;
            if(positivos != 0f){
                tweetsPositivos = (positivos+tweetsPositivos)/2;
            }
            if(negativos != 0f){
                tweetsNegativos = (negativos+tweetsNegativos)/2;
            }
            
            HttpPost httpPost = new HttpPost("http://165.227.12.119:9091/statistics/create");
            httpPost.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
            Map<String,String> params = new HashMap<>(); 
            params.put("name", artista);
            params.put("positiveTweets", String.valueOf(tweetsPositivos));
            params.put("negativeTweets", String.valueOf(tweetsNegativos));
            params.put("total_tweets", String.valueOf(tweetsTotales));
            String jsonMap = new Gson().toJson(params);
            StringEntity se = new StringEntity(jsonMap.toString(), "UTF-8");
            httpPost.setEntity(se);
            //Se ejecuta post de estadistica
            //String responseBody = httpclient.execute(httpPost, responseHandler);
            

            //Artista
            Artist artistaActual = new Artist();
            artistaActual.setName(artista);
            


            String jsonMap2 = "";
            List<Common_User> usuariosComunes = new ArrayList<Common_User>();
            for(int i = 0; i<nombreTweeteros.size(); i++){
                int relevancia = followersCount.get(i)+retweetsCount.get(i);

                if(relevancia<1000){
                    Common_User usuarioComun = new Common_User();
                    usuarioComun.setName(nombreTweeteros.get(i));
                    usuarioComun.setFollowers(followersCount.get(i));
                    HttpPost httpPostCommonUser = new HttpPost("http://165.227.12.119:9091/CommonUser/create");
                    httpPostCommonUser.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
                    Map<String,String> params2 = new HashMap<>(); 
                    params2.put("name", nombreTweeteros.get(i));
                    params2.put("followers", String.valueOf(followersCount.get(i)));
                    jsonMap2 = new Gson().toJson(params2);
                    usuariosComunes.add(usuarioComun);
                    StringEntity se2 = new StringEntity(jsonMap2.toString(), "UTF-8");
                    httpPostCommonUser.setEntity(se2);
                    
                    String responseBody2 = httpclient.execute(httpPostCommonUser, responseHandler);
                    
                }          
            }
            List<Influyent_User_Artist> listaRelacionesInfluyentes = new ArrayList<Influyent_User_Artist>();

            for(int i = 0; i<nombreTweeteros.size(); i++){
                int relevancia = followersCount.get(i)+retweetsCount.get(i);
                if(relevancia>=1000){
                    
                    HttpPost httpPostInfluyentUser = new HttpPost("http://165.227.12.119:9091/InfluyentUser/create");
                    httpPostInfluyentUser.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
                    Influyent_User user = new Influyent_User();
                    user.setName(nombreTweeteros.get(i));
                    user.setFollowers(followersCount.get(i));
                    user.setCommonUser(usuariosComunes);
                    String jsonMap3 = new Gson().toJson(user);
                    StringEntity se3 = new StringEntity(jsonMap3.toString(), "UTF-8");
                    httpPostInfluyentUser.setEntity(se3);
                    String responseBody3 = httpclient.execute(httpPostInfluyentUser, responseHandler);
                    
                    
                    //Relacion Influyent User con artista
                    Influyent_User_Artist relacionUsuarioInfluyente = new Influyent_User_Artist();
                    relacionUsuarioInfluyente.nombreArtista=artista;
                    relacionUsuarioInfluyente.retweets=retweetsCount.get(i);
                    relacionUsuarioInfluyente.lastTweet=lastestTweets.get(i);
                    relacionUsuarioInfluyente.nombreUsuarioInfluyente=nombreTweeteros.get(i);
                    HttpPost httpPostInfluyentRelation = new HttpPost("http://localhost:9091/InfluyentUserArtist/create");
                    httpPostInfluyentRelation.setHeader(HttpHeaders.CONTENT_TYPE, "application/json");
                    String jsonMap4 = new Gson().toJson(relacionUsuarioInfluyente);

                    StringEntity se4 = new StringEntity(jsonMap4.toString(), "UTF-8");
                    httpPostInfluyentRelation.setEntity(se4);
                    String responseBody4 = httpclient.execute(httpPostInfluyentRelation, responseHandler);
                }          
            }
            
        } finally {
            httpclient.close();
        }
        
        
        
        
    }
}



