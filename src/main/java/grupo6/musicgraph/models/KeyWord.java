package grupo6.musicgraph.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "KeyWords")
@NamedNativeQueries({
        @NamedNativeQuery(name = "KeyWord.findAll", query = "SELECT k FROM KeyWord k")})

public class KeyWord {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "word", unique = true, nullable = false)
    private String word;


    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;


    public KeyWord(String word) {
        this.word = word;
    }

    public String getWord() {
        return word;
    }


}

