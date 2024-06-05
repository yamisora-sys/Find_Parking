package com.yamisora.superwebne.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.yamisora.superwebne.model.ParkingReview;
public interface ParkingReviewRepository  extends JpaRepository<ParkingReview, Integer> {
    
}
