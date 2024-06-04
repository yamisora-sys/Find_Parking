package com.yamisora.superwebne.controller;

import java.net.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.Message;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.security.core.Authentication;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.repository.UserRepository;
import jakarta.servlet.http.HttpServletRequest;
import com.yamisora.superwebne.dto.UserDto;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;
import com.yamisora.superwebne.dto.NotificationDto;
@Controller
public class WebController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

	// @GetMapping("/greeting")
	// public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
	// 	model.addAttribute("name", name);
	// 	return "greeting";
	// }

    @GetMapping("/no-access")
    public String noAccess(){
        return "no-access";
    }

    @GetMapping("/notification")
    public String notification(){
        NotificationDto notificationDto = new NotificationDto();
        notificationDto.setType("info");
        notificationDto.setMessage("Notification");
        simpMessagingTemplate.convertAndSend("/public-notification", "Notification");
        return "notify";
    }

    // @GetMapping("/home")
    // public String hello(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
    //     Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    //     model.addAttribute("name", name);
    //     if (authentication != null) {
    //         model.addAttribute("username", authentication.getName());
    //         model.addAttribute("authorities", authentication.getAuthorities());
    //         model.addAttribute("role", authentication.getAuthorities().toString());
    //     }
    //     return "greeting";
    // }

    @GetMapping("/users")
    public @ResponseBody Iterable<User> getAllUsers() {
        return userRepository.findAll();
    }

    @GetMapping("/user")
    public @ResponseBody User getUser(@RequestParam String name) {
        return userRepository.findByUsername(name);
    }


}