package com.tbd.twitter.words;

import javax.persistence.*;

@Entity
@Table(name="keywords")
@NamedNativeQueries({
        @NamedNativeQuery(name = "Keyword.findAll", query = "SELECT k FROM Keyword k")})
public class Keyword {
    @Id
    @Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "word", nullable = false)
    private String word;

    public Keyword() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }
}
