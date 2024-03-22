package com.yamisora.superwebne.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.authentication.CachingUserDetailsService;
import org.springframework.security.core.userdetails.UserCache;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.yamisora.superwebne.model.User;
import com.yamisora.superwebne.repository.UserRepository;
import com.yamisora.superwebne.config.UserDetailsConfig;

@Configuration
@Service
public class CustomUserService  implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    // load user by username
    @Override
    @Cacheable
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if (user == null){
            throw new UsernameNotFoundException("User not found");
        }
        return new UserDetailsConfig(user);
    }
    // cache user loggin
    @Bean
    public CachingUserDetailsService cachingUserDetailsService(UserCache userCache){
        UserDetailsService delegate = new CustomUserService();
        CachingUserDetailsService service = new CachingUserDetailsService(delegate);
        service.setUserCache(userCache);
        return service;
    }
}
