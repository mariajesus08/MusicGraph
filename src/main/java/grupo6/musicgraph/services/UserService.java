package grupo6.musicgraph.services;


import org.springframework.beans.factory.annotation.Autowired;
import grupo6.musicgraph.models.User;
import grupo6.musicgraph.repositories.UserRepository;
import org.springframework.web.bind.annotation.*;

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
