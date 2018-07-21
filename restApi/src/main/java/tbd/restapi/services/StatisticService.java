package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import java.util.ArrayList;
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
    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> getAllStatistics(){
        return this.statisticRepository.findAll();
    }
    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Statistic getUser(@PathVariable int id)
    {
        return statisticRepository.findStatisticById(id);
    }
    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Statistic createUser(@RequestBody Statistic statistic){ return statisticRepository.save(statistic); }

    @CrossOrigin
    @RequestMapping(value = "/best10/genre/{genre_name}", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerDiezMejorValoradosPorGenero( @PathVariable("genre_name") String genre_name)
    {
        Genre genre = genreRepository.findGenreByName(genre_name);
        List<Statistic> allStatistics = statisticRepository.findByGenreOrderByPositiveTweetsDesc(genre);
        List<Statistic> response = new ArrayList<Statistic>();
        int aux = 0;
        for(Statistic element : allStatistics) {
            int flag = 0;
            for(Statistic artist : response){
                System.out.println(artist.getName());
                System.out.println(element.getName());
                if(artist.getName().equals(element.getName())){
                   flag = 1;
                }
            }    
            if(flag == 0){
                response.add(response.size(), element);
                aux = aux+1;
            }
            
            if(aux == 10){
                break;
            }
        }
        return response;

    }
    @CrossOrigin
    @RequestMapping(value = "/worst10/genre/{genre_name}", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerDiezPeorValoradosPorGenero( @PathVariable("genre_name") String genre_name)
    {
        Genre genre = genreRepository.findGenreByName(genre_name);
        List<Statistic> allStatistics = statisticRepository.findByGenreOrderByNegativeTweetsDesc(genre);
        List<Statistic> response = new ArrayList<Statistic>();
        int aux = 0;
        for(Statistic element : allStatistics) {
            int flag = 0;
            for(Statistic artist : response){
                System.out.println(artist.getName());
                System.out.println(element.getName());
                if(artist.getName().equals(element.getName())){
                   flag = 1;
                }
            }    
            if(flag == 0){
                response.add(response.size(), element);
                aux = aux+1;
            }
            
            if(aux == 10){
                break;
            }
        }
        return response;

    }

    


}

