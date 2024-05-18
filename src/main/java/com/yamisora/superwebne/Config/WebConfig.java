package com.yamisora.superwebne.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.thymeleaf.spring6.templateresolver.SpringResourceTemplateResolver;
import org.springframework.context.annotation.ComponentScan;
@Configuration
@EnableWebMvc
// enable jpa repository for the project
@EnableJpaRepositories(basePackages = "com.yamisora.superwebne.repository")
// @ComponentScan(basePackages = "com.yamisora.superwebne.webapp")
public class WebConfig implements WebMvcConfigurer{

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
          .addResourceHandler("/css/**", "/js/**", "/img/**", "/webjars/**", "/xml/**")
          .addResourceLocations("classpath:/css/", "classpath:/js/", "classpath:/img/", "/webjars/");
    }
    
    @Override
    public void configureViewResolvers(final ViewResolverRegistry registry) {
        registry.jsp("/view/", ".jsp");
    }

    // configure folder for template
    @Bean
    public SpringResourceTemplateResolver templateResolver() {
        SpringResourceTemplateResolver templateResolver = new SpringResourceTemplateResolver();
        templateResolver.setPrefix("/view/");
        templateResolver.setSuffix(".jsp");
        templateResolver.setTemplateMode("HTML5");
        templateResolver.setCharacterEncoding("UTF-8");
        return templateResolver;
    }
}
