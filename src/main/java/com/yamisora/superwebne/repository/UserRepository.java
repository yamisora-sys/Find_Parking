package com.yamisora.superwebne.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.yamisora.superwebne.model.User;

public interface UserRepository  extends JpaRepository<User, Integer>{

    
}