package grupo6.musicgraph.models;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "genres")
@NamedNativeQueries({
        @NamedNativeQuery(name = "Genre.findAll", query = "SELECT g FROM Genre g")})

public class Genre {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name", unique = true, nullable = false)
    private String name;

  @OneToMany (mappedBy = "genre")
    private List<Artist> artists = new ArrayList<Artist>();;

    public Genre(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
