package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Genre;
import tbd.restapi.models.Statistic;
import tbd.restapi.repositories.ArtistRepository;
import tbd.restapi.repositories.GenreRepository;
import tbd.restapi.repositories.StatisticRepository;
import org.springframework.data.domain.Sort;
import java.util.List;

@RestController
@RequestMapping(value = "/statistics")

public class StatisticService {
    @Autowired
    private StatisticRepository statisticRepository;

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private ArtistRepository artistRepository;

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
    public Statistic createUser(@RequestBody Statistic statistic){ return statisticRepository.save(statistic); }


    @RequestMapping(value = "/best10/genre/{genre_name}", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerDiezMejorValoradosPorGenero( @PathVariable("genre_name") String genre_name)
    {
        Genre genre = genreRepository.findGenreByName(genre_name);
        return statisticRepository.findTop10ByGenreOrderByPositiveTweetsDesc(genre);

    }

    @RequestMapping(value = "/worst10/genre/{genre_name}", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerDiezPeorValoradosPorGenero( @PathVariable("genre_name") String genre_name)
    {
        Genre genre = genreRepository.findGenreByName(genre_name);
        return statisticRepository.findTop10ByGenreOrderByNegativeTweetsDesc(genre);

    }


}

