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
import jakarta.persistence.OneToMany;
import jakarta.persistence.GenerationType;
import java.util.Set;

@Entity
@Getter
@Setter
public class Areas {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotNull
    private String name;

    private String description;

    public Areas() {
    }
}
