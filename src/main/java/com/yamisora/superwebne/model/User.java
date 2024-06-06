package com.yamisora.superwebne.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ForeignKey;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import java.util.Date;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.BindParam;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.yamisora.superwebne.model.Role;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private int id;

    @NotNull(message = "Username is required")
    @Column(unique = true)
    private String username;

    @NotNull
    @JsonIgnore
    private String password;

    @NotNull
    @Column(unique = true)
    private String email;

    @NotNull
    @ManyToOne(targetEntity = Role.class)
    @JoinColumn(name = "role_id", referencedColumnName = "id", foreignKey = @ForeignKey(name = "FK_USER_ROLE"))
    private Role role;

    @Column(name = "created_at", columnDefinition = "TIMESTAMP")
    private Timestamp createdAt = Timestamp.valueOf(LocalDateTime.now());

    @Column(name = "updated_at", columnDefinition = "TIMESTAMP")
    private Timestamp updatedAt = Timestamp.valueOf(LocalDateTime.now());

    public User(){}

    public User (
        String userName,
        String email,
        String password
    ){
        this.email = email;
        this.username = userName;
        this.password = passwordEncoder().encode(password);
    }
    
    public User(String username, String email, String password, Role role) {
        super();
        this.username = username;
        this.email = email;
        this.password = passwordEncoder().encode(password);
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getEmail() {
        return email;
    }

    public Role hasRole(){
        return role;
    }
    public Role getRole_id() {
        return role;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public static Object withDefaultPasswordEncoder() {
        return null;
    }

    private PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    public Role getRole() {
        return role;
    }
}