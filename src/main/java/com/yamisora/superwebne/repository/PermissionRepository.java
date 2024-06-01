package com.yamisora.superwebne.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yamisora.superwebne.model.Permission;

public interface PermissionRepository extends JpaRepository<Permission, Integer>{
    
    public Permission findByName(String name);
}
