package com.yamisora.superwebne.model;

import java.sql.Date;

import org.hibernate.annotations.ManyToAny;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class ParkingOrder {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private Date inTime;

    private Date outTime;

    private Float total;

    private String status;

    private String paymentMethod;

    private String paymentStatus;

    private Float paymentAmount;

    @ManyToOne(targetEntity = Parking.class)
    @JoinColumn(name = "parking_id")
    private Parking parking;

    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id")
    private User user;

    public ParkingOrder() {}
}
