package com.yamisora.superwebne.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.yamisora.superwebne.model.Node;

public interface NodesRepository extends JpaRepository<Node, Integer> {
    
}
