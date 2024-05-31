package com.yamisora.superwebne.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MapController {
    @GetMapping("/display-map")
    public String displayMap() {
        return "map/display";
    }
    
}
