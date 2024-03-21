package com.yamisora.superwebne.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Request {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private int id;
    private String user_agent;
    private String request_uri;
    private String method;
    private String remote_addr;

    public Request(
            String user_agent,
            String request_uri,
            String method,
            String remote_addr) {
        super();
        this.method = method;
        this.user_agent = user_agent;
        this.remote_addr = remote_addr;
        this.request_uri = request_uri;
    }
}
