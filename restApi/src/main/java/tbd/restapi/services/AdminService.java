package tbd.restapi.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import tbd.restapi.models.Admin;
import tbd.restapi.repositories.AdminRepository;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

    @CrossOrigin
    @RequestMapping(value= "/login", method = RequestMethod.GET)
    @ResponseBody
    public Admin verifyAdmin(@RequestParam("email") String email, @RequestParam("password") String password, HttpServletResponse httpResponse) {

            if (!adminRepository.existsByEmail(email)) {
                httpResponse.setStatus(HttpStatus.NOT_FOUND.value());
                return null;
            }

            else if (adminRepository.findByEmail(email).getPassword().equals(password) ){
                return adminRepository.findByEmail(email);
            }

            httpResponse.setStatus(HttpStatus.UNAUTHORIZED.value());
            return null;
    }
}
