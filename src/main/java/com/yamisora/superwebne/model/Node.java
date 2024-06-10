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
import jakarta.persistence.GenerationType;
import java.util.Set;

@Entity
@Getter
@Setter
public class Node {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull
    private Float longitude;

    @NotNull
    private Float latitude;

    public Node() {
    }

    public Node(Float longitude, Float latitude) {
        this.longitude = longitude;
        this.latitude = latitude;
    }
}
