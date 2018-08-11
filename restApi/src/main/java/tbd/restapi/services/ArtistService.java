package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Artist;
import tbd.restapi.models.Genre;
import tbd.restapi.models.Statistic;
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
        return this.artistRepository.getAllByOrderByNameAsc();
    }
    @CrossOrigin
    @RequestMapping(value = "lastStatistic/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Statistic getArtistStatistic(@PathVariable int id)
    {
        Artist artista = artistRepository.findArtistById(id);
        Statistic estadistica = artista.getStatistic().get(artista.getStatistic().size()-1);
        return estadistica;
    }
    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Artist getArtist(@PathVariable int id)
    {
        return artistRepository.findArtistById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/name/{name}", method = RequestMethod.GET)
    @ResponseBody
    public Artist getArtist(@PathVariable String name)
    {
        return artistRepository.findArtistByName(name);
    }

    @CrossOrigin
    @RequestMapping(value = "/getGenre/{name}", method = RequestMethod.GET)
    @ResponseBody
    public String getGenreArtist(@PathVariable String name)
    {
        Artist artista = artistRepository.findFirstArtistByName(name);
        return artista.getGenre().getName();
    }


   
    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Artist createArtist(@RequestBody Artist artist){

        return artistRepository.save(artist);

    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteArtist(@RequestBody String name){
        artistRepository.deleteArtistsByName(name);
    }



}

