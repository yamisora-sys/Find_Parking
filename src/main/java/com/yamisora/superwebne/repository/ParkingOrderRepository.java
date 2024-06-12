package com.yamisora.superwebne.repository;
import com.yamisora.superwebne.model.ParkingOrder;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.yamisora.superwebne.model.User;
import java.util.List;
public interface ParkingOrderRepository extends JpaRepository<ParkingOrder, Integer> {

    public ParkingOrder findByLicensePlate(String licensePlate);

    public List<ParkingOrder> findByUser(User user);

    @Query("SELECT COUNT(po) FROM ParkingOrder po WHERE po.parking.id = ?1 AND po.timeIn <= CURRENT_TIMESTAMP AND po.timeOut IS NULL")
    public Integer usedSlot(Integer parkingId);
}