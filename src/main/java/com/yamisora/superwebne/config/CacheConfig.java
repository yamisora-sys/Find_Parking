package com.yamisora.superwebne.config;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCacheManager;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.UserCache;
import org.springframework.security.core.userdetails.cache.SpringCacheBasedUserCache;
import org.springframework.context.annotation.Bean;

@Configuration
@EnableCaching
public class CacheConfig {

    // configure cache manager
    @Bean 
    public ConcurrentMapCacheManager cacheManager() {
        return new ConcurrentMapCacheManager("users");
    }

    // configure user cache
    @Bean
    public UserCache userCache() {
        return new SpringCacheBasedUserCache(cacheManager().getCache("users"));
    }
}
