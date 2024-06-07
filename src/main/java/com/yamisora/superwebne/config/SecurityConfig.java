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
import org.springframework.cache.annotation.Cacheable;
import com.yamisora.superwebne.service.UserDetailServiceImpl;

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
        return new UserDetailServiceImpl();
    }

    // authentication with DaoAuthenticationProvider
    @Bean
    @Cacheable("users")
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(final HttpSecurity http) throws Exception {
        // permit all /api
        http.authenticationProvider(authenticationProvider())
        .authorizeHttpRequests(
            auth -> auth
                .requestMatchers(request -> request.getServletPath().startsWith("/api")).permitAll()
                // admin route
                // matcher /ws/** permit all
                .requestMatchers(request -> request.getServletPath().startsWith("/ws")).permitAll()
                .requestMatchers("/admin/*").hasRole("Admin")
                .anyRequest().permitAll()
                )
            .httpBasic(Customizer.withDefaults())
            .formLogin(form -> form
                .loginPage("/login")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/home", true)
                .failureUrl("/login?error=true"))
            // if not have role redirect to No Access
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
