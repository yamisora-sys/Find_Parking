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
        return "admin/admin";
    }
}
