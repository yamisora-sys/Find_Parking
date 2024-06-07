package com.yamisora.superwebne.interfaces;


import java.io.Serializable;

import org.springframework.security.core.Authentication;

public interface PermissionEvaluator {
    public boolean hasPermission(
        Authentication auth, Object targetDomainObject, Object permission
    );

    public boolean hasPermission(
        Authentication auth, Serializable targetId, String targetType, Object permisison
    );
}
