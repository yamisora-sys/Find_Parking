package com.yamisora.superwebne.dto;


import com.yamisora.superwebne.model.ParkingCategory;

import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.NotNull;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.model.Parking;
import com.yamisora.superwebne.model.ParkingCategory;
import lombok.Getter;
import lombok.Setter;
import java.util.Set;


public class ParkingDto {
    @NotNull
    private String name;

    @NotNull
    private String address;

    @NotNull
    private String price;

    @NotNull
    private String description;

    @NotNull
    private String phone;

    private String unitPrice;

    @NotNull
    private User user;

    private Set<ParkingCategory> categories;


    @NotNull
    private String capacity;

    @NotNull
    private String category;

    @NotNull
    private String image;

    @NotNull
    private String status;

    public ParkingDto() {}
}
