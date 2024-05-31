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
import lombok.Getter;
import lombok.Setter;

@Entity
@Setter
@Getter
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
    public Permission(){};
    public Permission(String name) {
        super();
        this.name = name;
    }

    public Permission(String name, String description) {
        super();
        this.name = name;
        this.description = description;
    }

    // return role containing this permission
    public boolean hasRole(Role role) {
        return permission_role.contains(role);
    }

    public void attachPermissionToRole(Role role) {
        permission_role.add(role);
    }

    public void detachPermissionFromRole(Role role) {
        permission_role.remove(role);
    }
}
