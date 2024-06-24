package com.yamisora.superwebne.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.yamisora.superwebne.model.Parking;
import java.util.List;

public interface ParkingRepository extends JpaRepository<Parking, Integer>{

    @Query("SELECT p FROM Parking p WHERE p.verified = true")
    public List<Parking> findVerified();

    @Query("SELECT p FROM Parking p WHERE p.verified = false")
    public List<Parking> findNotVerified();

    // count available slot in a parking with timeIn <= now, timeOut=null;
    @Query("SELECT COUNT(po) FROM ParkingOrder po WHERE po.parking.id = ?1 AND po.timeIn <= CURRENT_TIMESTAMP AND po.timeOut IS NULL")
    public Integer usedSlot(Integer parkingId);

    // current used slot / capacity
    @Query("SELECT COUNT(po) / 10 FROM ParkingOrder po, Parking p WHERE po.parking.id = ?1 AND p.id=?1 AND po.timeIn <= CURRENT_TIMESTAMP AND po.timeOut IS NULL")
    public Float usedSlotRate(Integer parkingId);
}
