package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;

import java.awt.Stroke;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Artist;
import tbd.restapi.models.Statistic;
import tbd.restapi.models.UserStatistic;
import tbd.restapi.repositories.ArtistRepository;
import tbd.restapi.repositories.UserStatisticRepository;
import org.springframework.data.domain.Sort;

import org.neo4j.driver.v1.*;
import org.neo4j.driver.v1.Driver;

@RestController
@RequestMapping(value = "/userStatistics")

public class UserStatisticService {
    @Autowired
    private UserStatisticRepository UserStatisticRepository ;

    @Autowired
    private ArtistRepository artistRepository;

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

