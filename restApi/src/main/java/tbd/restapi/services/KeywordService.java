package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Keyword;
import tbd.restapi.repositories.KeywordRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/keywords")

public class KeywordService {
    @Autowired
    private KeywordRepository keywordRepository;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Keyword> getAllKeywords(){
        return this.keywordRepository.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Keyword getKeyword(@PathVariable int id)
    {
        return keywordRepository.findKeywordById(id);
    }
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Keyword createKeyword(@RequestBody Keyword keyword){

        return keywordRepository.save(keyword);

    }
}

