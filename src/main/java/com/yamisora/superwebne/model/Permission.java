package com.yamisora.superwebne.model;

import java.util.Set;

import org.hibernate.mapping.List;

import jakarta.annotation.Generated;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.validation.constraints.NotNull;


@Entity
public class Permission {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;

    @NotNull
    @Column(unique = true)
    private String name;
    
    private String description;


    @ManyToMany(mappedBy = "role_permission")
    Set<Role> permission_role;

    public Permission(String name) {
        super();
        this.name = name;
    }

    public Permission(String name, String description) {
        super();
        this.name = name;
        this.description = description;
    }
}
