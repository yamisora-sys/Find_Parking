package com.yamisora.superwebne.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yamisora.superwebne.model.Role;
public interface RoleRepository extends JpaRepository<Role, Integer>{
    
}
