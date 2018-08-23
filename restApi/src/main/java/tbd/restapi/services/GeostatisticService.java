package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;

import java.awt.Stroke;
import java.util.ArrayList;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Genre;
import tbd.restapi.models.Geostatistic;
import tbd.restapi.models.Artist;
import tbd.restapi.repositories.ArtistRepository;
import tbd.restapi.repositories.GenreRepository;
import tbd.restapi.repositories.GeostatisticRepository;
import org.springframework.data.domain.Sort;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import java.util.LinkedHashMap;
import javax.validation.constraints.Null;

@RestController
@RequestMapping(value = "/Geostatistics")

public class GeostatisticService {
    @Autowired
    private GeostatisticRepository GeostatisticRepository;

    @Autowired
    private GenreRepository genreRepository;

    @Autowired
    private ArtistRepository artistRepository;
    
    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Geostatistic> getAllGeostatistics(){
        return this.GeostatisticRepository.findAll();
    }
    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Geostatistic getUser(@PathVariable int id)
    {
        return GeostatisticRepository.findGeostatisticById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "name/{name}", method = RequestMethod.GET)
    @ResponseBody
    public Geostatistic getUser(@PathVariable String name)
    {
        List<Geostatistic> staAux = GeostatisticRepository.findGeostatisticByName(name);

        return staAux.get(staAux.size()-1);
    }
    
    @CrossOrigin
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> createGeostatistic(@RequestBody Geostatistic Geostatistic){
        Map<String,Object> response = new HashMap<>();
        if(this.artistRepository.findArtistByName(Geostatistic.getName())== null){
            response.put("Error", "No se encontro el artista");
            return response;
        }
        response.put("Status", "Se ha agregado la estadistica");
        Geostatistic.setArtist(this.artistRepository.findArtistByName(Geostatistic.getName()));
        Geostatistic.setGenre(this.artistRepository.findArtistByName(Geostatistic.getName()).getGenre());
        this.artistRepository.findArtistByName(Geostatistic.getName()).getGeoStatistic().add(Geostatistic);
        this.GeostatisticRepository.save(Geostatistic);
        return response;

    }
    @CrossOrigin
    @RequestMapping(value = "/genre/{genre_name}", method = RequestMethod.GET)
    @ResponseBody
    public List<Geostatistic> obtenerDiezMejorValoradosPorGenero( @PathVariable("genre_name") String genre_name)
    {
        List<Artist> allArtists= artistRepository.findAll();
        List<Geostatistic> response = new ArrayList<Geostatistic>();
        for(Artist artista: allArtists){
            if(artista.getGenre().getName().equals(genre_name)){
                String name = artista.getName();
                
                List<Geostatistic> artistStatistic = this.GeostatisticRepository.findGeostatisticByName(name);
                for(Geostatistic aux: artistStatistic){
                    response.add(aux);
                }
            }
        }
        return response;

    }

   


    

    


}

