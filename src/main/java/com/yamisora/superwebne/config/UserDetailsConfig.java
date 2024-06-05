package com.yamisora.superwebne.config;

import org.springframework.security.core.userdetails.UserDetails;

import com.yamisora.superwebne.model.Permission;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.repository.PermissionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.Collection;
import java.util.Collections;

public class UserDetailsConfig implements UserDetails{
    // UserDetails using database
    private User user;

    @Autowired
    private PermissionRepository permissionRepository;

    public UserDetailsConfig(User user){
        this.user = user;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        String role = user.hasRole().getName();
        GrantedAuthority authority = new SimpleGrantedAuthority(role);
        
        return Collections.singletonList(authority);
    }

    @Override
    public String getPassword() {
        return user.getPassword();
    }

    @Override
    public String getUsername() {
        return user.getUsername();
    }

    public String getRole(){
        return user.getRole();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
    @Override
    public boolean isEnabled() {
        return true;
    }

    public User getUser(){
        return user;
    }
}
