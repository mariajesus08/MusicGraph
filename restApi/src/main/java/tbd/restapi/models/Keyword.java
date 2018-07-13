package tbd.restapi.models;

import javax.persistence.*;

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