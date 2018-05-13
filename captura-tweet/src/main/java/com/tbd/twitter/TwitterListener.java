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
                Document tweet = new Document("id", status.getId())
                        //por ahora solo se guarda el contenido del tweet
                        .append("text", status.getText());
                mongo.getCollection("statusJSONImpl").insertOne(tweet);
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
        filter.track(bolsaPalabras.toArray(new String[0]));
            filter.language(new String[]{"es"});
            twitterStream.filter(filter);
        }catch (IOException e){
		    e.printStackTrace();
        }
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
