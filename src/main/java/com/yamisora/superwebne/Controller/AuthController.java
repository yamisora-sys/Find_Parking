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

import com.yamisora.superwebne.model.Role;
import com.yamisora.superwebne.model.User;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.BindingResultUtils;

import com.yamisora.superwebne.repository.RoleRepository;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.context.request.WebRequest;
import com.yamisora.superwebne.dto.UserDto;
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
    public String register(WebRequest request, Model model) {
        model.addAttribute("user", new User());
        return "auth/register";
    }

    @PostMapping("/register")
    public String createNewUser(User user) {
        // set user role = 1
        System.out.println("email" + user.getEmail());
        System.out.println("username" + user.getUsername());
        Role userRole = roleRepository.findById(1).get();
        user.setRole(userRole);
        userRepository.save(user);
        
        return "redirect:/home";
    }
    
    @GetMapping("/")
    public String index(){
        return "index";
    }
}
