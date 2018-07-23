package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;

import java.awt.Stroke;
import java.util.ArrayList;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Genre;
import tbd.restapi.models.Statistic;
import tbd.restapi.models.Artist;
import tbd.restapi.repositories.ArtistRepository;
import tbd.restapi.repositories.GenreRepository;
import tbd.restapi.repositories.StatisticRepository;
import org.springframework.data.domain.Sort;
import java.util.List;

import javax.validation.constraints.Null;

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
    @RequestMapping(value = "/best10/popularArtist", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerArtistasMasPopulares()
    {
        List<Artist> allArtists= artistRepository.findAll();
        List<Statistic> response = new ArrayList<Statistic>();
        List<Statistic> statisticsAux = new ArrayList<Statistic>();
        List<Float> totalTweetsList = new ArrayList<Float>();
        for(Artist artista : allArtists){
            String name = artista.getName();
            float totalTweets = 0;
            List<Statistic> artistStatistic = this.statisticRepository.findStatisticsByNameOrderByDateDesc(name);
            if(artistStatistic.size()>0){
                totalTweets = artistStatistic.get(0).getTotal_tweets();
                statisticsAux.add(artistStatistic.get(0));
                totalTweetsList.add(totalTweets);
            }
        }
        int aux = 0;
        for(int i = 0; i<totalTweetsList.size(); i++){
            float maximo = 0;
            int index = 0;
            Statistic estadistica = new Statistic();
            for(int j = 0; j<totalTweetsList.size(); j++){
                if(totalTweetsList.get(j)>maximo){
                    maximo = totalTweetsList.get(j);
                    index = j;
                    estadistica = statisticsAux.get(j);
                }
            }
            totalTweetsList.remove(index);
            statisticsAux.remove(index);
            response.add(estadistica);
            aux = aux + 1 ;
            if(aux == 10){
                break;
            }
        }
        
       
        return response;

    }

    @CrossOrigin
    @RequestMapping(value = "/best10/artistIncrease", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerArtistaMayorCrecimiento()
    {
        List<Artist> allArtists= artistRepository.findAll();
        List<Statistic> response = new ArrayList<Statistic>();
        List<Statistic> statisticsAux = new ArrayList<Statistic>();
        List<Float> divitions = new ArrayList<Float>();
        for(Artist artista : allArtists){
            String name = artista.getName();
            float crecimiento = 0;
            List<Statistic> artistStatistic = this.statisticRepository.findStatisticsByNameOrderByDateDesc(name);
            if(artistStatistic.size()>0){
                crecimiento = artistStatistic.get(artistStatistic.size() - 1).getTotal_tweets() - artistStatistic.get(0).getTotal_tweets();
            }
            System.out.println(crecimiento);
        }
        
       
        return response;

    }

    @CrossOrigin
    @RequestMapping(value = "/worst10/genres", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerDiezPeoresGenerosTotales()
    {
        List<Artist> allArtists= artistRepository.findAll();
        List<Statistic> response = new ArrayList<Statistic>();
        List<Statistic> statisticsAux = new ArrayList<Statistic>();
        List<Float> divitions = new ArrayList<Float>();


        
        for(Artist element : allArtists) {
            String name = element.getName();
            List<Statistic> artistStatistic = this.statisticRepository.findStatisticsByNameOrderByDateDesc(name);
            if(artistStatistic.size()>0){
                float totalTweetsNegativos = artistStatistic.get(0).getNegativeTweets();
                //float totalTweetsNegativos = artistStatistic.get(0).getNegativeTweets();
                
                divitions.add(totalTweetsNegativos);
                statisticsAux.add(artistStatistic.get(0));
            
            }
            
        
        }
        
        int aux = 0;
        List<Float> divisionesFinal = new ArrayList<Float>();
        for(int i = 0; i<divitions.size(); i++){
            float maximo = 0;
            int index = 0;
            Statistic estadistica = new Statistic();
            for(int j = 0; j<divitions.size(); j++){
                if(divitions.get(j)>maximo){
                    maximo = divitions.get(j);
                    index = j;
                    estadistica = statisticsAux.get(j);
                }
            }
            divitions.remove(index);
            statisticsAux.remove(index);
            int flag = 0;
            for(Statistic elemento : response){
                if(artistRepository.findFirstArtistByName(elemento.getName()).getGenre().getName().equals(artistRepository.findFirstArtistByName(estadistica.getName()).getGenre().getName())){
                    aux = aux -1;
                    flag = 1;
                    break;
                }
            }
            if(flag == 0){
                response.add(estadistica);
                divisionesFinal.add(maximo);
            }
            aux = aux + 1 ;
            if(aux == 10){
                break;
            }
        }
       
        for(Statistic elemento : response){
            elemento.setName(artistRepository.findFirstArtistByName(elemento.getName()).getGenre().getName());
        }
        
       
        return response;

    }
    @CrossOrigin
    @RequestMapping(value = "/best10/genres", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerDiezMejoresGenerosTotales()
    {
        List<Artist> allArtists= artistRepository.findAll();
        List<Statistic> response = new ArrayList<Statistic>();
        List<Statistic> statisticsAux = new ArrayList<Statistic>();
        List<Float> divitions = new ArrayList<Float>();


        
        for(Artist element : allArtists) {
            String name = element.getName();
            List<Statistic> artistStatistic = this.statisticRepository.findStatisticsByNameOrderByDateDesc(name);
            if(artistStatistic.size()>0){
                float totalTweetsPositivos = artistStatistic.get(0).getPositiveTweets();
                //float totalTweetsNegativos = artistStatistic.get(0).getNegativeTweets();
                
                divitions.add(totalTweetsPositivos);
                statisticsAux.add(artistStatistic.get(0));
            
            }
            
        
        }
        
        int aux = 0;
        System.out.println(divitions.size());
        System.out.println(statisticsAux.size());
        List<Float> divisionesFinal = new ArrayList<Float>();
        for(int i = 0; i<divitions.size(); i++){
            float maximo = 0;
            int index = 0;
            Statistic estadistica = new Statistic();
            for(int j = 0; j<divitions.size(); j++){
                if(divitions.get(j)>maximo){
                    maximo = divitions.get(j);
                    index = j;
                    estadistica = statisticsAux.get(j);
                }
            }
            divitions.remove(index);
            statisticsAux.remove(index);

            int flag = 0;
            for(Statistic elemento : response){
                if(artistRepository.findFirstArtistByName(elemento.getName()).getGenre().getName().equals(artistRepository.findFirstArtistByName(estadistica.getName()).getGenre().getName())){
                    aux = aux -1;
                    flag = 1;
                    break;
                }
            }
            if(flag == 0){
                response.add(estadistica);
                divisionesFinal.add(maximo);
            }
            aux = aux + 1 ;
            if(aux == 10){
                break;
            }
        }
        for(Statistic elemento : response){
            elemento.setName(artistRepository.findFirstArtistByName(elemento.getName()).getGenre().getName());
        }
        
       
        return response;

    }


    @CrossOrigin
    @RequestMapping(value = "/worst10/artistAllGenres", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerDiezPeoresTotales()
    {
        List<Artist> allArtists= artistRepository.findAll();
        List<Statistic> response = new ArrayList<Statistic>();
        List<Statistic> statisticsAux = new ArrayList<Statistic>();
        List<Float> divitions = new ArrayList<Float>();


        
        for(Artist element : allArtists) {
            String name = element.getName();
            List<Statistic> artistStatistic = this.statisticRepository.findStatisticsByNameOrderByDateDesc(name);
            if(artistStatistic.size()>0){
                float totalTweetsNegativos = artistStatistic.get(0).getNegativeTweets();
                //float totalTweetsNegativos = artistStatistic.get(0).getNegativeTweets();
                
                divitions.add(totalTweetsNegativos);
                statisticsAux.add(artistStatistic.get(0));
            
            }
            
        
        }
        
        int aux = 0;

        List<Float> divisionesFinal = new ArrayList<Float>();
        for(int i = 0; i<divitions.size(); i++){
            float maximo = 0;
            int index = 0;
            Statistic estadistica = new Statistic();
            for(int j = 0; j<divitions.size(); j++){
                if(divitions.get(j)>maximo){
                    maximo = divitions.get(j);
                    index = j;
                    estadistica = statisticsAux.get(j);
                }
            }
            divitions.remove(index);
            statisticsAux.remove(index);
            response.add(estadistica);
            divisionesFinal.add(maximo);
            aux = aux + 1 ;
            if(aux == 10){
                break;
            }
        }
        
        
       
        return response;

    }

    @CrossOrigin
    @RequestMapping(value = "/best10/artistAllGenres", method = RequestMethod.GET)
    @ResponseBody
    public List<Statistic> obtenerDiezMejoresTotales()
    {
        List<Artist> allArtists= artistRepository.findAll();
        List<Statistic> response = new ArrayList<Statistic>();
        List<Statistic> statisticsAux = new ArrayList<Statistic>();
        List<Float> divitions = new ArrayList<Float>();


        
        for(Artist element : allArtists) {
            String name = element.getName();
            List<Statistic> artistStatistic = this.statisticRepository.findStatisticsByNameOrderByDateDesc(name);
            if(artistStatistic.size()>0){
                float totalTweetsPositivos = artistStatistic.get(0).getPositiveTweets();
                //float totalTweetsNegativos = artistStatistic.get(0).getNegativeTweets();
                
                divitions.add(totalTweetsPositivos);
                statisticsAux.add(artistStatistic.get(0));
            
            }
            
        
        }

        
        
        int aux = 0;
        System.out.println(divitions.size());
        System.out.println(statisticsAux.size());
        List<Float> divisionesFinal = new ArrayList<Float>();
        for(int i = 0; i<divitions.size(); i++){
            float maximo = 0;
            int index = 0;
            Statistic estadistica = new Statistic();
            for(int j = 0; j<divitions.size(); j++){
                if(divitions.get(j)>maximo){
                    maximo = divitions.get(j);
                    index = j;
                    estadistica = statisticsAux.get(j);
                }
            }
            divitions.remove(index);
            statisticsAux.remove(index);
            
            response.add(estadistica);
            divisionesFinal.add(maximo);
            aux = aux + 1 ;
            if(aux == 10){
                break;
            }
        }
        
        
       
        return response;

    }

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

