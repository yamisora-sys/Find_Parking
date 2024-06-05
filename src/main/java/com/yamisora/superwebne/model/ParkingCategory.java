package com.yamisora.superwebne.model;

import groovy.transform.Generated;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.CreatedDate;
import jakarta.persistence.GenerationType;

@Getter
@Setter
@Entity
public class ParkingCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private String description;

    public ParkingCategory() {}

    public ParkingCategory(String name, String description) {
        this.name = name;
        this.description = description;
    }
}
