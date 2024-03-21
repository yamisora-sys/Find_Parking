package com.yamisora.superwebne.controller;

import java.net.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.repository.UserRepository;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class GreetingController {

    @Autowired
    private UserRepository userRepository;

	@GetMapping("/greeting")
	public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
		model.addAttribute("name", name);
		return "auth/greeting";
	}

    @GetMapping("/home")
    public String hello(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        model.addAttribute("name", name);
        return "greeting";
    }

    @GetMapping("/users")
    public @ResponseBody Iterable<User> getAllUsers() {
        return userRepository.findAll();
    }

    @GetMapping("/user")
    public @ResponseBody User getUser(@RequestParam String name) {
        return userRepository.findByUsername(name);
    }
    
}