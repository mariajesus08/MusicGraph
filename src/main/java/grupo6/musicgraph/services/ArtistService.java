package grupo6.musicgraph.services;


import grupo6.musicgraph.models.Artist;
import grupo6.musicgraph.repositories.ArtistRepository;
import org.springframework.beans.factory.annotation.Autowired;
import grupo6.musicgraph.models.Statistic;
import grupo6.musicgraph.repositories.StatisticRepository;
import org.springframework.web.bind.annotation.*;

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

