package grupo6.musicgraph.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "statistics")
@NamedNativeQueries({
        @NamedNativeQuery(name = "Statistic.findAll", query = "SELECT s FROM Statistic s")})

public class Statistic {
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name", unique = true, nullable = false)
    private String name;

    @Column(name = "positive_tweets", nullable = false)
    private int positiveTweets;

    @Column(name = "negative_tweets", nullable = false)
    private int negativeTweets;

    @Column(name = "date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;



    public Statistic(String name, Integer positiveTweets, Integer negativeTweets, Date date) {
        this.name = name;
        this.positiveTweets = positiveTweets;
        this.negativeTweets = negativeTweets;
        this.date = date;

    }


    public String getName() {
        return name;
    }

    public Integer getPositiveTweets() {
        return positiveTweets;
    }

    public Integer getNegativeTweets() {
        return negativeTweets;
    }

    public Date getDate() {
        return date;
    }


}