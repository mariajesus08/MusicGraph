package grupo6.musicgraph.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "Keywords")
public class Keyword {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "word", unique = true, nullable = false)
    private String word;




    public Keyword(String word) {
        this.word = word;
    }

    public String getWord() {
        return word;
    }


}

