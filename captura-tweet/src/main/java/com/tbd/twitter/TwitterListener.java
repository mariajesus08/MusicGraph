package com.tbd.twitter;

import javax.annotation.PostConstruct;

import org.bson.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import org.apache.commons.io.IOUtils;
import twitter4j.FilterQuery;
import twitter4j.JSONException;
import twitter4j.JSONObject;
import twitter4j.StallWarning;
import twitter4j.Status;
import twitter4j.StatusDeletionNotice;
import twitter4j.StatusListener;
import twitter4j.TwitterStream;
import twitter4j.json.DataObjectFactory;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.apache.commons.io.IOUtils;
import java.text.Normalizer;

@Service
@Configurable
public class TwitterListener {
	@Autowired
	private TwitterStream twitterStream;
	@Autowired
	private MongoTemplate mongo;

	private Set<String> bolsaPalabras;
		
	@PostConstruct
	public void run() {
		twitterStream.addListener(new StatusListener() {
			public void onStatus(Status status) {

				String country, latitude, longitude, user_description;
				try {
					country = status.getUser().getLocation();
				} catch (NullPointerException e){
					country = "null";
				}
				try {
					latitude = Double.toString(status.getGeoLocation().getLatitude());
					longitude = Double.toString(status.getGeoLocation().getLongitude());
				} catch (NullPointerException e){
					latitude = "null";
					longitude = "null";
				}

				user_description = status.getUser().getDescription();

				boolean verificarPais = analizarPais(country);
				boolean verificarCoordenadas = false;
				if(latitude != "null")
					verificarCoordenadas = verificarCoordenadas(latitude,longitude);
				boolean verificarDescripcion = analizarPais(user_description);

                Document tweet = new Document("id", status.getId())
                        .append("text", status.getText()) //tweet
						.append("tweet_country",country) //pais
						.append("tweet_latitude", latitude) //locacion
						.append("tweet_longitude", longitude) //locacion
						.append("user_id", status.getUser().getId()) //id del usuario
						.append("user_name", status.getUser().getName()) //nombre real del usuario
						.append("user_screen_name",status.getUser().getScreenName()) //@nombre_usuario
						.append("user_followers_count",status.getUser().getFollowersCount()) //seguidores del usuario
						.append("user_description",user_description) // descripcion del usuario
						.append("user_friend_count",status.getUser().getFriendsCount()); // amigos del usuario
				if(verificarPais == true || verificarCoordenadas == true || verificarDescripcion == true)
					//mongo.getCollection("statusJSONImpl").insertOne(tweet);
					mongo.insert(status);
	        }

			@Override
			public void onException(Exception arg0) {
								
			}

			@Override
			public void onDeletionNotice(StatusDeletionNotice arg0) {
							
			}

			@Override
			public void onScrubGeo(long arg0, long arg1) {
								
			}

			@Override
			public void onStallWarning(StallWarning arg0) {
								
			}

			@Override
			public void onTrackLimitationNotice(int arg0) {
								
			}			
		});
		bolsaPalabras = new HashSet<>();
		ClassLoader classLoader = getClass().getClassLoader();
		try {
            bolsaPalabras.addAll(IOUtils.readLines(classLoader.getResourceAsStream("palabras.dat"), "UTF-8"));
            FilterQuery filter = new FilterQuery();
			filter.track(bolsaPalabras.toArray(new String[0]));
			filter.language(new String[]{"es"});
			twitterStream.filter(filter);
        }catch (IOException e){
		    e.printStackTrace();
        }
	}

	public boolean analizarPais(String informacion){
		Set<String> bolsaCiudades = new HashSet<>();
		ClassLoader classLoader = getClass().getClassLoader();
		try {
			bolsaCiudades.addAll(IOUtils.readLines(classLoader.getResourceAsStream("ciudades.dat"), "UTF-8"));

			informacion = informacion.toLowerCase();
			informacion = Normalizer.normalize(informacion, Normalizer.Form.NFD)
					.replaceAll("[^\\p{ASCII}]", "");
			String[] palabras = informacion.split(" ");
			for(int i= 0; i < palabras.length; i++){
				for(String ciudad: bolsaCiudades){
					if(palabras[i].matches(".*"+ciudad+".*"))
						return true;
				}
			}
		}catch (IOException e){
			e.printStackTrace();
			return false;
		}
		return false;
	}

	public boolean verificarCoordenadas(String latitude, String longitude){
		double latitud = Double.parseDouble(latitude);
		double longitud = Double.parseDouble(longitude);
		if(latitud < -18.4745998 && latitud > -51.7298698)
			if(longitud < -68.9237137 && longitud > -73.2458878)
				return true;
		return false;
	}

	public TwitterStream getTwitterStream() {
		return twitterStream;
	}

	public void setTwitterStream(TwitterStream twitterStream) {
		this.twitterStream = twitterStream;
	}

	public MongoTemplate getMongo() {
		return mongo;
	}

	public void setMongo(MongoTemplate mongo) {
		this.mongo = mongo;
	}
}
