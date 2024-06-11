package com.yamisora.superwebne.model;

import java.sql.Date;
import java.util.Calendar;

import org.hibernate.annotations.ManyToAny;
import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;
import java.sql.Timestamp;

@Entity
@Getter
@Setter
public class ParkingOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp timeIn;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp timeOut;

    private Float total;

    private String status;

    private String paymentMethod;

    private String paymentStatus;

    private Float paymentAmount;

    private String licensePlate;

    @ManyToOne(targetEntity = Parking.class)
    @JoinColumn(name = "parking_id")
    private Parking parking;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id")
    private User user;

    public ParkingOrder() {}
}
