package com.yamisora.superwebne.repository;
import com.yamisora.superwebne.model.ParkingOrder;

import org.springframework.data.jpa.repository.JpaRepository;

public interface ParkingOrderRepository extends JpaRepository<ParkingOrder, Integer> {
    
}