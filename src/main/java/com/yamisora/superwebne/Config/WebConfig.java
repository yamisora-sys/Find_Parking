package com.yamisora.superwebne.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.thymeleaf.spring6.ISpringTemplateEngine;
import org.thymeleaf.spring6.SpringTemplateEngine;
import org.thymeleaf.spring6.templateresolver.SpringResourceTemplateResolver;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
import nz.net.ultraq.thymeleaf.layoutdialect.LayoutDialect;

@Configuration
@EnableWebMvc
@EnableJpaRepositories(basePackages = "com.yamisora.superwebne.repository")
// @ComponentScan(basePackages = "com.yamisora.superwebne.webapp")
// fix
public class WebConfig implements WebMvcConfigurer{
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry
          .addResourceHandler("/css/**", "/js/**", "/img/**", "/webjars/**", "/xml/**", "/view/**")
          .addResourceLocations("classpath:/css/", "classpath:/js/", "classpath:/img/", "/webjars/", "classpath:/xml/", "classpath:/view/");
    }
    
    @Override
    public void configureViewResolvers(final ViewResolverRegistry registry) {
        registry.jsp("view/", ".jsp");
    }

    @Bean
    public ClassLoaderTemplateResolver templateResolver(){
        ClassLoaderTemplateResolver templateResolver = new ClassLoaderTemplateResolver();
        templateResolver.setPrefix("view/");
        templateResolver.setSuffix(".jsp");
        templateResolver.setTemplateMode("HTML5");
        templateResolver.setCharacterEncoding("UTF-8");
        return templateResolver;
    }

    private ISpringTemplateEngine templateEngine(ISpringTemplateEngine templateEngine) {
        SpringTemplateEngine engine = new SpringTemplateEngine();
        engine.setTemplateResolver(templateResolver());
        engine.addDialect(new LayoutDialect());
        return engine;
    }
}
