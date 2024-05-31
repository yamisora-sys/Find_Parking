package com.yamisora.superwebne.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.util.ContentCachingRequestWrapper;
import org.springframework.web.util.ContentCachingResponseWrapper;

import com.yamisora.superwebne.model.Request;
import com.yamisora.superwebne.repository.RequestRepository;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import org.springframework.web.filter.OncePerRequestFilter;
import java.io.IOException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;

@Component
public class RequestController extends OncePerRequestFilter{
    
    // save the request to database
    @Autowired
    private RequestRepository requestRepository;
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        ContentCachingRequestWrapper cachingRequest = new ContentCachingRequestWrapper(request);
        // ContentCachingResponseWrapper cachingResponse = new ContentCachingResponseWrapper(response);
        String userAgent = cachingRequest.getHeader("User-Agent");
        String method = cachingRequest.getMethod();
        String requestUri = cachingRequest.getRequestURI();
        String remoteAddr = cachingRequest.getRemoteAddr();
        Request newRequest = new Request(userAgent, requestUri, method, remoteAddr);
        requestRepository.save(newRequest);
        filterChain.doFilter(request, response);
    }
}
