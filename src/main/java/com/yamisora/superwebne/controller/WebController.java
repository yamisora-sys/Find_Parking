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
import org.springframework.web.servlet.ModelAndView;
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
import com.yamisora.superwebne.component.CustomModelAndView;
import org.springframework.security.core.Authentication;
import com.yamisora.superwebne.model.Parking;
import com.yamisora.superwebne.repository.ParkingRepository;
import java.util.List;
@Controller
public class WebController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    @Autowired
    private ParkingRepository parkingRepository;

	// @GetMapping("/greeting")
	// public String greeting(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
	// 	model.addAttribute("name", name);
	// 	return "greeting";
	// }

    @GetMapping("/no-access")
    public String noAccess(){
        return "no-access";
    }

    @GetMapping("/admin")
    public String admin(){
        return "greating";
    }
    @GetMapping("/notification")
    public String notification(){
        NotificationDto notificationDto = new NotificationDto();
        notificationDto.setType("info");
        notificationDto.setMessage("Notification");
        simpMessagingTemplate.convertAndSend("/public-notification", "Notification");
        return "notify";
    }

    @GetMapping("/home")
    public String hello(@RequestParam(name="name", required=false, defaultValue="World") String name, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("name", name);
        if (authentication != null) {
            model.addAttribute("username", authentication.getName());
            model.addAttribute("authorities", authentication.getAuthorities());
            model.addAttribute("role", authentication.getAuthorities().toString());
        }
        return "greeting";
    }

    @GetMapping("/")
    public ModelAndView index(){
        // get auth user
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        List<Parking> parkings = parkingRepository.findAll();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("parkings", parkings);
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
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
    @GetMapping("/add-park")
    public String addparking(){
        return "parking/add-parking";
    }
}