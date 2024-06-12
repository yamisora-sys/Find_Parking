package com.yamisora.superwebne.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.validation.constraints.NotNull;
import lombok.Setter;
import lombok.Getter;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.GenerationType;
import java.util.Set;

import org.springframework.data.jpa.repository.Query;

import com.yamisora.superwebne.repository.ParkingOrderRepository;
import com.yamisora.superwebne.repository.ParkingRepository;

import jakarta.persistence.OneToOne;
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
    private Integer price;

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
    @OneToOne(targetEntity = Node.class)
    private Node node;

    @ManyToMany(targetEntity = ParkingCategory.class)
    Set<ParkingCategory> categories;


    @NotNull
    private Integer capacity;

    @NotNull
    private String image;


    private String status;

    @Column(name = "verified", columnDefinition = "BOOLEAN DEFAULT false")
    private Boolean verified = false;

    public Parking() {}
}
