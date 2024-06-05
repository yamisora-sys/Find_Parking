package com.yamisora.superwebne.model;

import groovy.transform.Generated;
import groovyjarjarantlr4.v4.runtime.misc.NotNull;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;

@Entity
@Setter
@Getter
public class ParkingReview {
    public ParkingReview() {
        super();
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String review;

    @Min(1)
    @Max(5)
    private int rating;

    @NotNull
    @OneToOne(targetEntity = Parking.class)
    @JoinColumn(name = "parking_id")
    private Parking parking;


    @NotNull
    @OneToOne(targetEntity = User.class)
    @JoinColumn(name = "user_id")
    private User user;

    private int parrentId;

    private Date created_at;
}
