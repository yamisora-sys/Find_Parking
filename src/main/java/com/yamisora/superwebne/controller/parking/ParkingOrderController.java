package com.yamisora.superwebne.controller.parking;

import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import com.yamisora.superwebne.component.CustomModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.repository.ParkingOrderRepository;
import com.yamisora.superwebne.dto.ParkingOrderDto;
import com.yamisora.superwebne.model.Parking;
import com.yamisora.superwebne.model.ParkingOrder;
import com.yamisora.superwebne.model.User;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import com.yamisora.superwebne.repository.UserRepository;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDateTime;
@Controller
@RequestMapping("/parking-order")
public class ParkingOrderController {
    @Autowired
    private ParkingRepository parkingRepository;
    
    @Autowired
    private ParkingOrderRepository parkingOrderRepository;

    @Autowired
    private UserRepository userRepository;
    
    @GetMapping("/create")
    public ModelAndView viewCreateOrder(@RequestParam("parkingId") Integer parkingId){
        Parking parking = parkingRepository.findById(parkingId).get();
        ParkingOrderDto parkingOrderDto = new ParkingOrderDto();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("parking/create-order");
        modelAndView.addObject("parking", parking);
        modelAndView.addObject("orders", parkingOrderDto);
        modelAndView.addObject("auth", userRepository.findByUsername(authentication.getName()));
        return modelAndView;
    }

    @GetMapping("/my-list")
    public ModelAndView viewOrderList(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userRepository.findByUsername(authentication.getName());
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("parking/order-list");
        modelAndView.addObject("orders", parkingOrderRepository.findByUser(user));
        modelAndView.addObject("auth", user);
        return modelAndView;
    }

    @PostMapping("/create")
    public String createOrder(ParkingOrderDto order){
        ParkingOrder parkingOrder = new ParkingOrder();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        parkingOrder.setParking(order.getParking());
        parkingOrder.setUser(userRepository.findByUsername(authentication.getName()));
        parkingOrder.setTimeIn(order.getTimeIn());
        parkingOrder.setLicensePlate(order.getLicensePlate());
        parkingOrderRepository.save(parkingOrder);
        return "redirect:/parking-order/my-list";
    }

    @PostMapping("/payment")
    public String paymentOrder(@RequestParam("id") Integer id){
        ParkingOrder parkingOrder = parkingOrderRepository.findById(id).get();
        parkingOrder.setPaymentStatus("PAID");
        parkingOrderRepository.save(parkingOrder);
        return "redirect:/parking-order/my-list";
    }
}
