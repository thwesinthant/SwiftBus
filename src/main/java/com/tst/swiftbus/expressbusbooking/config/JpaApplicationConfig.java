package com.tst.swiftbus.expressbusbooking.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.tst.swiftbus.expressbusbooking.model.BaseRepositoryImpl;

@Configuration
@EnableJpaRepositories(basePackages = "com.tst.swiftbus.expressbusbooking.model.repo", repositoryBaseClass = BaseRepositoryImpl.class)
@EnableJpaAuditing
public class JpaApplicationConfig {

}
