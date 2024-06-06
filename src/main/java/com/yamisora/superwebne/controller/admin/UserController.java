package com.yamisora.superwebne.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import com.yamisora.superwebne.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.dto.UserDto;
import java.util.List;
@Controller
@RequestMapping(method = RequestMethod.GET, value = "/admin")
public class UserController {
    @Autowired
    private UserRepository userRepository;

    @GetMapping("/manager-user")
    public ModelAndView manageUser() {
        List<User> users = userRepository.findAll().stream().toList();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/user-manager");
        modelAndView.addObject("users", users);
        return modelAndView;
    }

    @PostMapping("/new-user")
    public String newUser(){
        return "admin/new-user";
    }
}
