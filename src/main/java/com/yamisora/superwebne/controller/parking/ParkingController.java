package com.yamisora.superwebne.controller.parking;
import com.yamisora.superwebne.component.CustomModelAndView;
import com.yamisora.superwebne.dto.ParkingDto;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.model.Parking;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.ResponseEntity;
@Controller
@RequestMapping("/parking")
public class ParkingController {

    @Autowired
    private ParkingRepository parkingRepository;

    @GetMapping("/display-parking-map")
    public ModelAndView displayParkingMap() {
        ModelAndView modelAndView = new ModelAndView();
        List<Parking> parkings = parkingRepository.findAll().stream().toList();
        modelAndView.setViewName("parking/parking-data-map");
        modelAndView.addObject("parkings", parkings);
        return modelAndView;
    }

    @GetMapping("/manager-my-parking")
    public ModelAndView manager() {
        List<Parking> parkings = parkingRepository.findAll().stream().toList();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("parking/manager-my-parking");
        modelAndView.addObject("parkings", parkings);
        modelAndView.addObject("new_parking", new ParkingDto());
        return modelAndView;
    }

    @PostMapping("/create")
    public ModelAndView create(@RequestBody Parking new_parking) {
        parkingRepository.save(new_parking);
        return new ModelAndView("redirect:/parking/manager-my-parking");
    }

    @GetMapping("/detail")
    public ModelAndView detail() {
        return new ModelAndView("parking/detail");
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<Parking>> getAll() {
        List<Parking> parkings = parkingRepository.findAll().stream().toList();
        return ResponseEntity.ok(parkings);
    }
}
