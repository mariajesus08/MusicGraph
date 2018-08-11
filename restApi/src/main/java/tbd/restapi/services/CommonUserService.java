package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.models.Common_User;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.repositories.CommonUserRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> createCommonUser(@RequestBody Common_User commonUser){

        Map<String,Object> response = new HashMap<>();
        if(this.commonUserRepository.findFirstCommon_UserByName(commonUser.getName())==null){
            response.put("Status", "Se debe crear influyent user");
            this.commonUserRepository.save(commonUser);
           
        } else {
            response.put("Status", "Se debe actualizar influyent user");
        }
        
        return response;


    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteCommonUser(@RequestBody String name){
        commonUserRepository.deleteCommon_UserByName(name);
    }



}

