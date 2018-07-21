package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Genre;
import tbd.restapi.repositories.GenreRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/genres")

public class GenreService {
    @Autowired
    private GenreRepository genreRepository;
    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Genre> getAllGenres(){
        return this.genreRepository.findAll();
    }
    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Genre getGenre(@PathVariable int id)
    {
        return genreRepository.findGenreById(id);
    }
    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Genre createGenre(@RequestBody Genre genre){

        return genreRepository.save(genre);

    }

}

