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

    @Column(name = "emotion", nullable = false)
    private Boolean emotion;

    @Column(name = "quantity", nullable = false)
    private Float quantity;

    @Column(name = "date", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date date;




    public Statistic(String name, Boolean emotion, Float quantity, Date date) {
        this.name = name;
        this.emotion = emotion;
        this.quantity = quantity;
        this.date = date;

    }


    public String getName() {
        return name;
    }

    public Boolean getEmotion() {
        return emotion;
    }

    public Float getQuantity() {
        return quantity;
    }

    public Date getDate() {
        return date;
    }


}