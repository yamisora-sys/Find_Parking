package com.yamisora.superwebne.controller.parking;
import com.nimbusds.jose.proc.SecurityContext;
import com.yamisora.superwebne.component.CustomModelAndView;
import com.yamisora.superwebne.dto.ParkingDto;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

import com.yamisora.superwebne.repository.NodeRepository;
import com.yamisora.superwebne.repository.ParkingCategoryRepository;
import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.model.Node;
import com.yamisora.superwebne.model.Parking;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.http.ResponseEntity;
import com.yamisora.superwebne.model.ParkingCategory;
import com.yamisora.superwebne.model.User;

import org.springframework.security.authorization.method.AuthorizeReturnObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import com.yamisora.superwebne.repository.UserRepository;
@Controller
@RequestMapping("/parking")
public class ParkingController {

    @Autowired
    private ParkingRepository parkingRepository;

    @Autowired
    private ParkingCategoryRepository parkingCategoryRepository;

    @Autowired
    private NodeRepository nodeRepository;

    @Autowired
    private UserRepository userRepository;

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
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        List<Parking> parkings = parkingRepository.findAll().stream().toList();
        CustomModelAndView modelAndView = new CustomModelAndView();
        modelAndView.setViewName("parking/manager-my-parking");
        modelAndView.addObject("parkings", parkings);
        modelAndView.addObject("newparking", new ParkingDto());
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
    }

    @GetMapping("/create")
    public ModelAndView viewCreate() {
        List<ParkingCategory> parkingCategories = parkingCategoryRepository.findAll().stream().toList();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomModelAndView modelAndView = new CustomModelAndView();
        ParkingDto newparking = new ParkingDto();
        modelAndView.setViewName("parking/add-parking");
        modelAndView.addObject("newparking", newparking);
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        modelAndView.addObject("parkingCategories", parkingCategories);
        return modelAndView;
    }

    @PostMapping("/create")
    public String create(ParkingDto newparking) {
        Node node = new Node(newparking.getLongitude(), newparking.getLatitude());
        node = nodeRepository.save(node);
        Parking parking = new Parking();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        parking.setNode(node);
        parking.setCategories(newparking.getCategories());
        parking.setCapacity(newparking.getCapacity());
        parking.setPrice(newparking.getPrice());
        parking.setAddress(newparking.getAddress());
        parking.setDescription(newparking.getDescription());
        parking.setUser(userRepository.findByUsername(authentication.getName()));
        parking.setPhone(newparking.getPhone());
        parking.setImage(newparking.getImage());
        parking.setName(newparking.getName());
        parking.setStatus(newparking.getStatus());
        parking.setUnitPrice(newparking.getUnitPrice());
        parkingRepository.save(parking);
        return "redirect:/parking/manager-my-parking";
    }

    @GetMapping("/detail")
    public ModelAndView detail() {
        return new ModelAndView("parking/detail");
    }

    @GetMapping("/get-all")
    public ResponseEntity<List<Parking>> getAll() {
        List<Parking> parkings = parkingRepository.findVerified().stream().toList();
        return ResponseEntity.ok(parkings);
    }
}
