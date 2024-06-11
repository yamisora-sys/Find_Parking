package com.yamisora.superwebne.controller.parking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.model.Parking;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import com.yamisora.superwebne.repository.UserRepository;


@Controller
public class ParkingDetailController {
    @Autowired
    private ParkingRepository parkingRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/park/detail")
    public ModelAndView displayDetail(@RequestParam("id") Integer id) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Parking parking = parkingRepository.findById(id).get();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("detail");
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        modelAndView.addObject("parking", parking);
        return modelAndView;
    }
    
}
