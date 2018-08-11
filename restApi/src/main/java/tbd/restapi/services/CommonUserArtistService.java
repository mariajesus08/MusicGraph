package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Common_User_Artist;
import tbd.restapi.repositories.CommonUserArtistRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/CommonUserArtist")

public class CommonUserArtistService {
    @Autowired
    private CommonUserArtistRepository commonUserArtistRepository;

    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Common_User_Artist> getAllInfluyentUser(){
        return this.commonUserArtistRepository.findAll();
    }

 

    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Common_User_Artist getInfluyentUser(@PathVariable int id)
    {
        return commonUserArtistRepository.findFirstCommon_User_ArtistById(id);
    }

    

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Common_User_Artist createInfluyentUser(@RequestBody Common_User_Artist commonUser){

        return commonUserArtistRepository.save(commonUser);

    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteInfluyentUser(@RequestBody int id){
        commonUserArtistRepository.deleteCommon_User_ArtistById(id);
    }



}

