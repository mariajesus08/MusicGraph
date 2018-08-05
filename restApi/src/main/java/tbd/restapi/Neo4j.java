package tbd.restapi;

import org.neo4j.driver.v1.AuthTokens;
import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.GraphDatabase;
import org.neo4j.driver.v1.Record;
import org.neo4j.driver.v1.Session;
import org.neo4j.driver.v1.StatementResult;
import tbd.restapi.models.UserStatistic;
import tbd.restapi.repositories.UserStatisticRepository;

import java.util.List;

public class Neo4j {

    UserStatisticRepository userStatisticRepository;

    public void crearGrafo() {
        List<UserStatistic> userStatistics = userStatisticRepository.findAll();
        Driver driver = GraphDatabase.driver("bolt://165.227.12.119:7687", AuthTokens.basic("neo4j", "root123"));
        Session session = driver.session();
        session.run("match (a)-[r]->(b) delete r");
        session.run("match (n) delete n");
        for(UserStatistic userStatistic : userStatistics){
            System.out.println(userStatistic);
            session.run("CREATE (a:User {name:'"+ userStatistic.getName() + "'"
                    + ", retweets:'"+ userStatistic.getRetweets() +"'"
                    + ", followers:'"+ userStatistic.getFollowers() +"'"
                    + ", last_tweet:'"+ userStatistic.geLast_tweet() +"'"
                    + ", verified:'"+ userStatistic.getVerified() +"'"
                    + ", relevant:'"+ userStatistic.getRelevant() +"'"
                    + ", date:'"+ userStatistic.getDate() +"'"
                    + "})");
        }
        session.close();
        driver.close();
    }
}
