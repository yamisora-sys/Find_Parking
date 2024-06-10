package com.yamisora.superwebne.model;

import jakarta.persistence.Entity;
import jakarta.validation.constraints.NotNull;
import lombok.Setter;
import lombok.Getter;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.GenerationType;
import java.util.Set;

@Entity
@Getter
@Setter
public class Parking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

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
    @ManyToOne(targetEntity = User.class)
    @JoinColumn(name = "owner_id")
    private User user;

    @NotNull
    @ManyToOne(targetEntity = Node.class)
    @JoinColumn(name = "node_id")
    private Node node;

    @ManyToMany(targetEntity = ParkingCategory.class)
    Set<ParkingCategory> categories;


    @NotNull
    private String capacity;

    @NotNull
    private String image;

    
    private String status;

    public Parking() {}

}
