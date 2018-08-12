package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import tbd.restapi.models.Artist;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.models.Influyent_User_Artist;
import tbd.restapi.repositories.ArtistRepository;
import tbd.restapi.repositories.InfluyentUserArtistRepository;
import tbd.restapi.repositories.InfluyentUserRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/InfluyentUserArtist")

public class InfluyentUserArtistService {
    @Autowired
    private InfluyentUserArtistRepository influyentUserArtistRepository;
    @Autowired
    private InfluyentUserRepository influyentArtist;
    @Autowired
    private ArtistRepository artist;

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
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> createInfluyentUserRelation(@RequestBody Influyent_User_Artist influyentUser) {
        Map<String, Object> response = new HashMap<>();
        if((this.influyentUserArtistRepository.findFirstInfluyent_User_ArtistByNombreArtista(influyentUser.nombreArtista)!=null)&&(this.influyentUserArtistRepository.findFirstInfluyent_User_ArtistByNombreUsuarioInfluyente(influyentUser.nombreUsuarioInfluyente)!=null)){
            return response;
        }
        System.out.println("\n");
        System.out.println(influyentUser.getLast_tweet());
        System.out.println("\n");
        this.artist.findArtistByName(influyentUser.nombreArtista).getInfluyentUsers().add(influyentUser);
        this.influyentArtist.findFirstInfluyent_UserByName(influyentUser.nombreUsuarioInfluyente).getInfluyentUserArtist().add(influyentUser);
        influyentUser.setArtist(this.artist.findArtistByName(influyentUser.nombreArtista));
        influyentUser.setInfluyentUser(this.influyentArtist.findFirstInfluyent_UserByName(influyentUser.nombreUsuarioInfluyente));
        influyentUserArtistRepository.save(influyentUser);
        return response;

    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteInfluyentUser(@RequestBody int id){
        influyentUserArtistRepository.deleteInfluyent_User_ArtistById(id);
    }



}

