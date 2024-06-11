package com.yamisora.superwebne.controller.parking;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;

import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.model.Parking;


@Controller
public class ParkingDetailController {
    @Autowired
    private ParkingRepository parkingRepository;

    @GetMapping("/park/detail")
    public ModelAndView displayDetail(@RequestParam("id") Integer id) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("detail");
        Parking parking = parkingRepository.findById(id).get();
        modelAndView.addObject("parking", parking);
        return modelAndView;
    }
    
}
