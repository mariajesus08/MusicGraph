package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.User;
import tbd.restapi.repositories.UserRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/users")

public class UserService {
    @Autowired
    private UserRepository userRepository;

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<User> getAllUsers(){
        return this.userRepository.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public User getUser(@PathVariable int id)
    {
        return userRepository.findUserById(id);
    }
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public User createUser(@RequestBody User user){

        return userRepository.save(user);

    }
}
