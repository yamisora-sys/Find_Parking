package com.yamisora.superwebne.repository;
import com.yamisora.superwebne.model.ParkingOrder;

import org.springframework.data.jpa.repository.JpaRepository;
import com.yamisora.superwebne.model.User;
public interface ParkingOrderRepository extends JpaRepository<ParkingOrder, Integer> {
    public ParkingOrder findByLicensePlate(String licensePlate);
    public ParkingOrder findByUser(User user);
}