package com.yamisora.superwebne.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
    @GetMapping("/display-map")
    public String displayMap() {
        return "map/display";
    }
    
    @GetMapping("/display-direction")
    public String displayDirection() {
        return "map/route";
    }

    @GetMapping("/display-nearest")
    public String displayNearest() {
        return "map/nearest";
    }

    @GetMapping("/coordinate")
    public String displayCoordinate() {
        return "map/coordinate";
    }

    @GetMapping("/route")
    public ModelAndView displayRoute(@RequestParam("latitude") String latitude, @RequestParam("longitude") String longitude) {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("map/route");
        modelAndView.addObject("latitude", latitude);
        modelAndView.addObject("longitude", longitude);
        return modelAndView;
    }
}


