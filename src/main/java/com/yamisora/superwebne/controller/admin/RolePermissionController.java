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
import com.yamisora.superwebne.repository.PermissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.List;
@Controller
@RequestMapping(method = RequestMethod.GET, value = "/admin")
public class RolePermissionController {
    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PermissionRepository permissionRepository;

    @GetMapping("/role-permission")
    public ModelAndView displayRolePermission() {
        List<Role> roles = roleRepository.findAll().stream().toList();
        List<Permission> permissions = permissionRepository.findAll().stream().toList();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin/role-permission");
        modelAndView.addObject("roles", roles);
        modelAndView.addObject("permissions", permissions);
        return modelAndView;
    }

    // attach permission to role
    @GetMapping("/role-permission/attach")
    public String attachPermissionToRole(@RequestParam("role_id") int role_id, @RequestParam("permission_id") int permission_id) {
        Role role = roleRepository.findById(role_id).get();
        Permission permission = permissionRepository.findById(permission_id).get();
        role.getRole_permission().add(permission);
        roleRepository.save(role);
        return "redirect:/admin/role-permission";
    }

    // detach permission from role
    @GetMapping("/role-permission/detach")
    public String detachPermissionFromRole(@RequestParam("role_id") int role_id, @RequestParam("permission_id") int permission_id) {
        Role role = roleRepository.findById(role_id).get();
        Permission permission = permissionRepository.findById(permission_id).get();
        role.getRole_permission().remove(permission);
        roleRepository.save(role);
        return "redirect:/admin/role-permission";
    }
}
