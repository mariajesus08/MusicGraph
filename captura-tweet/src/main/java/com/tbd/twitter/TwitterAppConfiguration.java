package com.tbd.twitter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;

import java.util.Arrays;

import com.mongodb.MongoClient;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;

import twitter4j.TwitterStream;
import twitter4j.TwitterStreamFactory;
import twitter4j.conf.ConfigurationBuilder;

@Configuration
@ConditionalOnClass({TwitterStreamFactory.class,TwitterStream.class,TwitterListener.class})
@EnableConfigurationProperties(TwitterProperties.class)
public class TwitterAppConfiguration {

	@Autowired
	private TwitterProperties properties;
	
    @Bean
    @ConditionalOnMissingBean
    public TwitterStreamFactory twitterStreamFactory() {
    	ConfigurationBuilder configurationBuilder=new ConfigurationBuilder();
		configurationBuilder.setDebugEnabled(false)
				.setOAuthConsumerKey(properties.getTwitter().getConsumerKey())
				.setOAuthConsumerSecret(properties.getTwitter().getConsumerSecret())
				.setOAuthAccessToken(properties.getTwitter().getAccessToken())
				.setOAuthAccessTokenSecret(properties.getTwitter().getAccessTokenSecret());
		return new TwitterStreamFactory(configurationBuilder.build());
    }
    @Bean
    @ConditionalOnMissingBean
    public TwitterStream twitterStream(TwitterStreamFactory twitterStreamFactory) {
    	return twitterStreamFactory.getInstance();
    }
    @Bean
    @ConditionalOnMissingBean
    public TwitterListener twitterListener() {
    	return new TwitterListener();
    }
    @Bean
    public MongoTemplate mongoTemplate() throws Exception {  
    MongoCredential mongoCredential = MongoCredential.createCredential("root", "admin","secret1234".toCharArray());
    ServerAddress address = new ServerAddress("165.227.12.119", 27017);
		MongoTemplate mongo=new MongoTemplate(new MongoClient(address, Arrays.asList(mongoCredential)),"musicgraphdb");
		return mongo;	
	}
}
