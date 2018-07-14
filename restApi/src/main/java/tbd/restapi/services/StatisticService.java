package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Statistic;
import tbd.restapi.repositories.StatisticRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/statistics")

public class StatisticService {
    @Autowired
    private StatisticRepository statisticRepository;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> getAllStatistics(){
        return this.statisticRepository.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Statistic getUser(@PathVariable int id)
    {
        return statisticRepository.findStatisticById(id);
    }
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Statistic createUser(@RequestBody Statistic statistic){

        return statisticRepository.save(statistic);

    }
}

