package com.yamisora.superwebne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.converter.SimpleMessageConverter;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

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

import com.yamisora.superwebne.dto.NotificationDto;
import com.yamisora.superwebne.dto.UserDto;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;

@Controller
public class AuthController {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;
    
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @GetMapping("/login")
    public String login(Model model){ 
        model.addAttribute("user", new User());
        return "auth/login";
    }
    
    @GetMapping("/register")
    public String register(Model model) {
        model.addAttribute("user", new UserDto());
        return "auth/register";
    }

    @PostMapping("/register")
    public String createNewUser(@ModelAttribute("user") @Valid UserDto user, BindingResult bindingResult, Model model) {
        NotificationDto notificationDto = new NotificationDto();
        Role userRole = roleRepository.findById(1).get();
        if (bindingResult.hasErrors()) {
            notificationDto.setType("error");
            notificationDto.setMessage("Please fill in all the fields");
            simpMessagingTemplate.convertAndSend("/public-notification", notificationDto);
            return "auth/register";
        } else {
            User newUser = new User(user.getUsername(), user.getEmail(), user.getPassword(), userRole);
            userRepository.save(newUser);
            notificationDto.setType("success");
            notificationDto.setMessage("User has been created");
            return "redirect:/login";
        }
    }
    
    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null){    
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login";
    }
}
