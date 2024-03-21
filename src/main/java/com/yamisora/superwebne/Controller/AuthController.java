package com.yamisora.superwebne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;

import com.yamisora.superwebne.repository.UserRepository;
import com.yamisora.superwebne.model.User;

@Controller
public class AuthController {
    @Autowired
    private UserRepository userRepository;

    
    @GetMapping("/login")
    public String Login () {
        return "auth/login";
    }

    @GetMapping("/")
    public String index(){
        return "index";
    }
}
