package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Admin;
import tbd.restapi.repositories.AdminRepository;

import java.util.List;

@RestController
@RequestMapping(value = "/admins")

public class AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @CrossOrigin
    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public List<Admin> getAllAdmins(){
        return this.adminRepository.findAll();
    }

    @CrossOrigin
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Admin getAdmin(@PathVariable int id)
    {
        return adminRepository.findAdminById(id);
    }

    @CrossOrigin
    @RequestMapping(method = RequestMethod.POST)
    @ResponseBody
    public Admin createAdmin(@RequestBody Admin admin){ return adminRepository.save(admin); }


}
