package com.yamisora.superwebne.model;

import jakarta.persistence.Entity;
import jakarta.validation.constraints.NotNull;
import lombok.Setter;
import lombok.Getter;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.GenerationType;
import java.util.Set;

@Entity
@Getter
@Setter
public class AreaNode {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(targetEntity = Areas.class)
    private Areas area;

    @ManyToOne(targetEntity = Node.class)
    private Node node;

    public AreaNode() {

    }
}
