package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Artist;
import tbd.restapi.repositories.ArtistRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/artists")

public class ArtistService {
    @Autowired
    private ArtistRepository artistRepository;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Artist> getAllArtists(){
        return this.artistRepository.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Artist getArtist(@PathVariable int id)
    {
        return artistRepository.findArtistById(id);
    }
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Artist createArtist(@RequestBody Artist artist){

        return artistRepository.save(artist);

    }

}

