package com.yamisora.superwebne.service;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import java.io.Serializable;

import com.yamisora.superwebne.repository.PermissionRepository;
import com.yamisora.superwebne.interfaces.PermissionEvaluator;
import com.yamisora.superwebne.model.User;
import java.util.*;
public class PermissionEvaluatorImp implements PermissionRepository {

    public static final PermisisonEvalutor denyAll = new DenyAllPermissionEvaluator();
    private final Map<String, PermissionEvaluator> permissionEvaluators;

    public PermissionEvaluatorImp(Map<String, PermissionEvaluator> permissionEvaluators) {
        this.permissionEvaluators = permissionEvaluators;
    }

    
}
