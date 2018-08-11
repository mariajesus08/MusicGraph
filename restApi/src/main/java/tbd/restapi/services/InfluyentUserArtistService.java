package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Influyent_User_Artist;
import tbd.restapi.repositories.InfluyentUserArtistRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/InfluyentUserArtist")

public class InfluyentUserArtistService {
    @Autowired
    private InfluyentUserArtistRepository influyentUserArtistRepository;

    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Influyent_User_Artist> getAllInfluyentUser(){
        return this.influyentUserArtistRepository.findAll();
    }

 

    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Influyent_User_Artist getInfluyentUser(@PathVariable int id)
    {
        return influyentUserArtistRepository.findFirstInfluyent_User_ArtistById(id);
    }

    

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Influyent_User_Artist createInfluyentUser(@RequestBody Influyent_User_Artist commonUser){

        return influyentUserArtistRepository.save(commonUser);

    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteInfluyentUser(@RequestBody int id){
        influyentUserArtistRepository.deleteInfluyent_User_ArtistById(id);
    }



}

