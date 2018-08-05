package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;

import java.awt.Stroke;
import java.util.ArrayList;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.UserStatistic;
import tbd.restapi.repositories.UserStatisticRepository;
import org.springframework.data.domain.Sort;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.LinkedHashMap;
import javax.validation.constraints.Null;

@RestController
@RequestMapping(value = "/userStatistics")

public class UserStatisticService {
    @Autowired
    private UserStatisticRepository UserStatisticRepository ;

   
    
    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<UserStatistic> getAllStatistics(){
        return this.UserStatisticRepository.findAll();
    }
    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public UserStatistic getUser(@PathVariable int id)
    {
        return UserStatisticRepository.findUserStatisticById(id);
    }
    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public UserStatistic createUserStatistic(@RequestBody UserStatistic statistic){ return UserStatisticRepository.save(statistic); }


    

    


}

