package com.yamisora.superwebne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;

import com.yamisora.superwebne.repository.UserRepository;

import jakarta.servlet.http.HttpServlet;
import jakarta.validation.Valid;

import com.yamisora.superwebne.model.Role;
import com.yamisora.superwebne.model.User;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.BindingResultUtils;

import com.yamisora.superwebne.repository.RoleRepository;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.context.request.WebRequest;
import com.yamisora.superwebne.dto.UserDto;
import java.util.HashMap;
import java.util.Map;
@Controller
public class AuthController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;
    
    @GetMapping("/login")
    public String Login (Model model){ 
        model.addAttribute("user", new User());
        return "auth/login";
    }
    
    @GetMapping("/register")
    public String register(@ModelAttribute("user") UserDto user) {
        user.setRoleId(1);
        return "auth/register";
    }

    @PostMapping("/register")
    public String createNewUser(@ModelAttribute("user") @Valid UserDto user, BindingResult bindingResult) {
        // set user role = 1
        Role userRole = roleRepository.findById(1).get();
        if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.getAllErrors());
            Map<String, String> errors= new HashMap<>();
            bindingResult.getFieldErrors().forEach(
                    error -> errors.put(error.getField(), error.getDefaultMessage())
            );
            // print error
            for(String key : errors.keySet()){
                System.out.println(key + " : " + errors.get(key));
            }
            return "auth/register";
        } else {
            User newUser = new User(user.getUsername(), user.getEmail(), user.getPassword(), userRole);
            userRepository.save(newUser);
            return "redirect:/login";
        }
    }
    
    @GetMapping("/")
    public String index(){
        return "index";
    }
    @GetMapping("/about")
    public String about(){
        return "about";
    }
    @GetMapping("/contact")
    public String contact(){
        return "contact";
    }
    @GetMapping("/detail")
    public String detail(){
        return "detail";
    }
}
