package grupo6.musicgraph.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "artists")
@NamedNativeQueries({
        @NamedNativeQuery(name = "Artist.findAll", query = "SELECT a FROM Artist a")})

public class Artist {

    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name", unique = true, nullable = false)
    private String name;

    public Artist(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}