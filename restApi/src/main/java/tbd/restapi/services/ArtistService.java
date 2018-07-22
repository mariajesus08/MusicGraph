package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Artist;
import tbd.restapi.models.Genre;
import tbd.restapi.repositories.ArtistRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/artists")

public class ArtistService {
    @Autowired
    private ArtistRepository artistRepository;
    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Artist> getAllArtists(){
        return this.artistRepository.findAll();
    }
    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Artist getArtist(@PathVariable int id)
    {
        return artistRepository.findArtistById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/getGenre/{name}", method = RequestMethod.GET)
    @ResponseBody
    public String getGenreArtist(@PathVariable String name)
    {
        Artist artista = artistRepository.findArtistByName(name);

        return artista.getGenre().getName();
    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Artist createArtist(@RequestBody Artist artist){

        return artistRepository.save(artist);

    }

}

