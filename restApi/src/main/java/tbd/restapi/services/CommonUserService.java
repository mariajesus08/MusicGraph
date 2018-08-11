package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.models.Common_User;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.repositories.CommonUserRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/CommonUser")

public class CommonUserService {
    @Autowired
    private CommonUserRepository commonUserRepository;

    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Common_User> getAllCommonUser(){
        return this.commonUserRepository.findAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    @ResponseBody
    public Common_User getCommonUser(@PathVariable String name)
    {
        return commonUserRepository.findFirstCommon_UserByName(name);
    }

    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Common_User getCommonUser(@PathVariable int id)
    {
        return commonUserRepository.findFirstCommon_UserById(id);
    }

    

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Common_User createCommonUser(@RequestBody Common_User commonUser){

        return commonUserRepository.save(commonUser);

    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteCommonUser(@RequestBody String name){
        commonUserRepository.deleteCommon_UserByName(name);
    }



}

