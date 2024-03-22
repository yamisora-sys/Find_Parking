package com.yamisora.superwebne.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.core.GrantedAuthorityDefaults;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.rsocket.RSocketSecurity.AuthorizePayloadsSpec.Access;

import com.yamisora.superwebne.service.CustomUserService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    // change default value of getAuthorities
    @Bean
    public GrantedAuthorityDefaults grantedAuthorityDefaults() {
        return new GrantedAuthorityDefaults(""); // Remove the ROLE_ prefix
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserService();
    }

    // authentication with DaoAuthenticationProvider
    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        // permit all /api
        http.authenticationProvider(authenticationProvider());
        http.authorizeHttpRequests(
            auth -> auth
                .requestMatchers(request -> request.getServletPath().startsWith("/api")).permitAll()
                // admin route
                .requestMatchers("/admin").hasRole("Admin")
                // if not have role redirect to No Access
                .anyRequest().permitAll())
            .httpBasic(Customizer.withDefaults())
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/home", true)
                .failureUrl("/login?error=true"))
            .exceptionHandling(exception -> exception
                .accessDeniedPage("/no-access"));
        return http.build();
    }


    // password encoder
    @Bean
    public PasswordEncoder passwordEncoder (){
        return new BCryptPasswordEncoder();
    }

    // authentication manager
    @Autowired
    public void configure (AuthenticationManagerBuilder auth) throws Exception {
        auth.eraseCredentials(false);
    }
}
