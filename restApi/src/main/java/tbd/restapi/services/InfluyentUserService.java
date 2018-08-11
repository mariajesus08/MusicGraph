package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.models.Common_User;
import tbd.restapi.repositories.CommonUserRepository;
import tbd.restapi.repositories.InfluyentUserRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/InfluyentUser")

public class InfluyentUserService {
    @Autowired
    private InfluyentUserRepository incfluyentUserRepository;
    private CommonUserRepository commonUserRepository;

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
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> createInfluyentUser(@RequestBody Influyent_User influyentUser){
        Map<String,Object> response = new HashMap<>();
        if(this.incfluyentUserRepository.findFirstInfluyent_UserByName(influyentUser.getName())==null){
            response.put("Status", "Se debe crear influyent user");
            this.incfluyentUserRepository.save(influyentUser);
            
        }
        if(influyentUser.getCommonUsers()!= null){
            if(this.incfluyentUserRepository.findFirstInfluyent_UserByName(influyentUser.getName()).getCommonUsers()!=null){
                response.put("Status", "Ya tenia common user");
                /*
                for(Common_User usuariosComunes: influyentUser.getCommonUsers()){
                    if(this.commonUserRepository.findFirstCommon_UserByName(usuariosComunes.getName())!= null){
                        this.incfluyentUserRepository.findFirstInfluyent_UserByName(influyentUser.getName()).getCommonUsers().
                        add(this.commonUserRepository.findFirstCommon_UserByName(usuariosComunes.getName()));
                        this.commonUserRepository.findFirstCommon_UserByName(usuariosComunes.getName()).setInfluyentUser(influyentUser);
                    } else {
                        response.put("Error", "Usuario comun no encontrado");
        
                    }
                }
    
                */
             } else {
                
                response.put("Status", "Primer common user");
                 
             }

        } else {
            response.put("Status", "No hay common user para agregar");

        }
        return response;


    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteInfluyentUser(@RequestBody String name){
        incfluyentUserRepository.deleteInfluyent_UserByName(name);
    }



}

