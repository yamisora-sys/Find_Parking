package com.yamisora.superwebne.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import com.yamisora.superwebne.component.CustomModelAndView;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;
import com.yamisora.superwebne.repository.ParkingRepository;
import com.yamisora.superwebne.model.Parking;
import java.util.List;
@Controller
@RequestMapping("/admin")
public class IndexController {

    @Autowired
    private ParkingRepository parkingRepository;
    @GetMapping("index")
    public String index() {
        return "admin/index";
    }
    @GetMapping("adminuser")
    public String adminuser() {
        return "admin/user-manager";
    }
    @GetMapping("parking-manger")
    public ModelAndView parkingmanger() {
        List<Parking> parkings = parkingRepository.findAll().stream().toList();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/parking-manager");
        modelAndView.addObject("parkings", parkings);
        return modelAndView;
    }
    @GetMapping("adminsupport")
    public String adminsupport() {
        return "admin/adminsupport";
    }
    @GetMapping("adminreport")
    public String adminreport() {
        return "admin/adminreport";
    }
}
