package com.yamisora.superwebne.Config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        // permit all /api
        http.authorizeHttpRequests(
            auth -> auth
                .requestMatchers(request -> request.getServletPath().startsWith("/api")).permitAll()
                .anyRequest().permitAll()
        );
        return http.build();
    }
}
