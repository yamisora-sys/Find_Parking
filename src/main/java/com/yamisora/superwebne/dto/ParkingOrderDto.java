package com.yamisora.superwebne.dto;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.yamisora.superwebne.model.Parking;

import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;
import com.yamisora.superwebne.model.User;
import java.util.Calendar;
import java.sql.Timestamp;
@Getter
@Setter
public class ParkingOrderDto {
    public ParkingOrderDto() {};

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Timestamp timeIn;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE_TIME)
    private Timestamp timeOut;

    private String status;

    private String paymentMethod;

    private String paymentStatus;

    private Float paymentAmount;

    private Parking parking;

    private User user;

    private String licensePlate;
}
