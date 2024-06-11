package com.yamisora.superwebne.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import com.yamisora.superwebne.component.CustomModelAndView;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class IndexController {
    @GetMapping("index")
    public String index() {
        return "admin/index";
    }
    @GetMapping("adminuser")
    public String adminuser() {
        return "admin/user-manager";
    }
    @GetMapping("parking-manger")
    public String parkingmanger() {
        return "admin/parking-manger";
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
