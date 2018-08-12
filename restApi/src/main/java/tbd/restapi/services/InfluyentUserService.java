package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Influyent_User;
import tbd.restapi.models.Influyent_User_Artist;
import tbd.restapi.models.Common_User;
import tbd.restapi.models.Artist;
import tbd.restapi.repositories.ArtistRepository;
import tbd.restapi.repositories.CommonUserRepository;
import tbd.restapi.repositories.InfluyentUserArtistRepository;
import tbd.restapi.repositories.InfluyentUserRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = "/InfluyentUser")

public class InfluyentUserService {
    @Autowired
    private InfluyentUserRepository incfluyentUserRepository;
    @Autowired
    private CommonUserRepository commonUserRepository;
    @Autowired
    private InfluyentUserArtistRepository relacionRepository;
    @Autowired
    private ArtistRepository artistRepository;


    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Influyent_User> getAllInfluyentUser() {
        return this.incfluyentUserRepository.findAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/{name}", method = RequestMethod.GET)
    @ResponseBody
    public Influyent_User getInfluyentUser(@PathVariable String name) {
        return incfluyentUserRepository.findFirstInfluyent_UserByName(name);
    }

    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Influyent_User getInfluyentUser(@PathVariable int id) {
        return incfluyentUserRepository.findFirstInfluyent_UserById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> createInfluyentUser(@RequestBody Influyent_User influyentUser) {
        Map<String, Object> response = new HashMap<>();
        if(this.incfluyentUserRepository.findFirstInfluyent_UserByName(influyentUser.getName())!= null){
            Influyent_User user = this.incfluyentUserRepository.findFirstInfluyent_UserByName(influyentUser.getName());
            Common_User usuarioComun = new Common_User();
            Artist artistaAux = new Artist();
            for (Common_User usuariosComunes : influyentUser.getCommonUsers()) {
                usuarioComun = this.commonUserRepository.findFirstCommon_UserByName(usuariosComunes.getName());
                usuarioComun.setInfluyentUser(user);
            }
            this.incfluyentUserRepository.save(user);
            
        } else {
            Artist artistaAux = new Artist();
            Common_User usuarioComun = new Common_User();
            for (Common_User usuariosComunes : influyentUser.getCommonUsers()) {
                usuarioComun = this.commonUserRepository.findFirstCommon_UserByName(usuariosComunes.getName());
                usuarioComun.setInfluyentUser(influyentUser);
            }

            this.incfluyentUserRepository.save(influyentUser);
            
            
            response.put("Status", "User influyente agregado");            
        }
        return response;

    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public void deleteInfluyentUser(@RequestBody String name) {
        incfluyentUserRepository.deleteInfluyent_UserByName(name);
    }

}
