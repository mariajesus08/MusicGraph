package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.models.Common_User;
import tbd.restapi.repositories.InfluyentUserRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/InfluyentUser")

public class InfluyentUserService {
    @Autowired
    private InfluyentUserRepository incfluyentUserRepository;

    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Influyent_User> getAllInfluyentUser(){
        return this.incfluyentUserRepository.findAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    @ResponseBody
    public Influyent_User getInfluyentUser(@PathVariable String name)
    {
        return incfluyentUserRepository.findFirstInfluyent_UserByName(name);
    }

    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Influyent_User getInfluyentUser(@PathVariable int id)
    {
        return incfluyentUserRepository.findFirstInfluyent_UserById(id);
    }

    

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Influyent_User createInfluyentUser(@RequestBody Influyent_User commonUser){

        return incfluyentUserRepository.save(commonUser);

    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteInfluyentUser(@RequestBody String name){
        incfluyentUserRepository.deleteInfluyent_UserByName(name);
    }



}

