package com.yamisora.superwebne.dto;


import com.yamisora.superwebne.model.ParkingCategory;

import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.model.Parking;
import com.yamisora.superwebne.model.ParkingCategory;
import lombok.Getter;
import lombok.Setter;
import java.util.Set;
import java.util.ArrayList;
import org.hibernate.mapping.Array;

@Getter
@Setter
public class ParkingDto {
    @NotNull
    private String name;

    @NotNull
    private String address;

    @NotNull
    private Integer price;

    @NotNull
    private String description;

    @NotNull
    private String phone;

    private String unitPrice;
    
    @NotNull
    private int owner_id;

    private Set<ParkingCategory> categories;

    @NotNull
    private int capacity;

    @NotNull
    private String image;

    @NotNull
    private String status;


    private float longitude;

    private float latitude;

    private String coordinates;

    public ParkingDto() {}
}
