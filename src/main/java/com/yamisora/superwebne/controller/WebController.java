package com.yamisora.superwebne.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.yamisora.superwebne.model.Parking;
import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.repository.UserRepository;
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
    public ModelAndView index(@RequestParam(defaultValue = "0") int page,
                              @RequestParam(defaultValue = "9") int size) {
        // get auth user
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Pageable pageable = PageRequest.of(page, size);
        Page<Parking> parkingPage = parkingRepository.findAll(pageable);
        List<Parking> parkings = parkingPage.getContent();

        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("index");
        modelAndView.addObject("parkings", parkings);
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        modelAndView.addObject("currentPage", page);
        modelAndView.addObject("totalPages", parkingPage.getTotalPages());

        return modelAndView;
    }

    @GetMapping("/about")
    public ModelAndView about(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("about");
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
    }

    @GetMapping("/contact")
    public ModelAndView contact(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("contact");
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
    }

    @GetMapping("/detail")
    public ModelAndView detail(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("detail");
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
    }

    @GetMapping("/add-park")
    public ModelAndView addParking(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("parking/add-parking");
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
    }

    @GetMapping("/profile")
    public ModelAndView profile(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("user/profile");
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
    }

    @GetMapping("/edit-profile")
    public ModelAndView editProfile(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("user/edit-profile");
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
    }
}