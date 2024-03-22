package com.yamisora.superwebne.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class WebController {
    @GetMapping("/no-access")
    public String noAccess(){
        return "no-access";
    }
    
}
