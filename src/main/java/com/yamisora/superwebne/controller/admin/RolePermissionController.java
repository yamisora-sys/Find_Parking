package com.yamisora.superwebne.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import com.yamisora.superwebne.model.Role;
import com.yamisora.superwebne.model.Permission;
import com.yamisora.superwebne.repository.RoleRepository;

import jakarta.servlet.http.HttpSession;

import com.yamisora.superwebne.repository.PermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
import com.yamisora.superwebne.component.CustomModelAndView;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.messaging.simp.SimpMessagingTemplate;
@PreAuthorize("hasPermission('Read permission')")
@Controller
@RequestMapping("/admin")
public class RolePermissionController {

    private final String indexView = "admin/role-permission";

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PermissionRepository permissionRepository;

    // send message to websocket
    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;




    @GetMapping("/role-permission")
    public ModelAndView displayRolePermission(HttpSession session) {
        List<Role> roles = roleRepository.findAll().stream().toList();
        List<Permission> permissions = permissionRepository.findAll().stream().toList();
        CustomModelAndView customModelAndView = new CustomModelAndView();
        customModelAndView.setViewName(indexView);
        customModelAndView.addObject("roles", roles);
        customModelAndView.addObject("permissions", permissions);
        customModelAndView.addNotification(CustomModelAndView.TYPE_INFO, "Role Permission Page");
        simpMessagingTemplate.convertAndSend("/public-notification", "Role Permission Page");
        return customModelAndView;
    }

    // attach permission to role
    @GetMapping("/role-permission/attach")
    public String attachPermissionToRole(@RequestParam("role_id") int role_id, @RequestParam("permission_id") int permission_id, HttpSession session) {
        Role role = roleRepository.findById(role_id).get();
        Permission permission = permissionRepository.findById(permission_id).get();
        role.getRole_permission().add(permission);
        roleRepository.save(role);
        return "redirect:/admin/role-permission";
    }

    // detach permission from role
    @GetMapping("/role-permission/detach")
    public String detachPermissionFromRole(@RequestParam("role_id") int role_id, @RequestParam("permission_id") int permission_id, HttpSession session) {
        Role role = roleRepository.findById(role_id).get();
        Permission permission = permissionRepository.findById(permission_id).get();
        role.getRole_permission().remove(permission);
        roleRepository.save(role);
        return "redirect:/admin/role-permission";
    }
}
