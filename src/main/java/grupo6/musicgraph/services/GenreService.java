package grupo6.musicgraph.services;


import grupo6.musicgraph.models.Artist;
import grupo6.musicgraph.models.Genre;
import grupo6.musicgraph.repositories.ArtistRepository;
import grupo6.musicgraph.repositories.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/genres")

public class GenreService {
    @Autowired
    private GenreRepository genreRepository;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Genre> getAllGenres(){
        return this.genreRepository.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Genre getGenre(@PathVariable int id)
    {
        return genreRepository.findGenreById(id);
    }
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Genre createGenre(@RequestBody Genre genre){

        return genreRepository.save(genre);

    }

}

