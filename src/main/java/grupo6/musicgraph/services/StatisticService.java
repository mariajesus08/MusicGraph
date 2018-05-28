package grupo6.musicgraph.services;


import org.springframework.beans.factory.annotation.Autowired;
import grupo6.musicgraph.models.Statistic;
import grupo6.musicgraph.repositories.StatisticRepository;
import org.springframework.web.bind.annotation.*;

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

