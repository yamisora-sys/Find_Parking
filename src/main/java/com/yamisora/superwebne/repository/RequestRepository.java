package com.yamisora.superwebne.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.yamisora.superwebne.model.Request;

public interface RequestRepository extends JpaRepository<Request, Integer>{
    
}
