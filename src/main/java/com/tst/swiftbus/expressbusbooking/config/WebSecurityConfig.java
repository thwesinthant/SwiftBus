package com.tst.swiftbus.expressbusbooking.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.tst.swiftbus.expressbusbooking.security.LoginSuccessHandler;

@Configuration
@EnableMethodSecurity
public class WebSecurityConfig {

	@Bean
	SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		// Request Authorization
		http.authorizeHttpRequests(req -> {
			req.requestMatchers("/", "/signin", "/signup", "/postLogin", "/resources/**").permitAll();
			req.requestMatchers("/admin/**").hasRole("ADMIN"); // ✅ Spring internally adds "ROLE_"
			req.requestMatchers("/member/**").hasRole("USER");
			req.anyRequest().authenticated();
		});

		// Login Form Configuration
		http.formLogin(form -> {
			form.loginPage("/signin") // Custom login page (GET)
					.loginProcessingUrl("/postLogin") // Login POST handler
					.usernameParameter("email") // Match your form input name
					.passwordParameter("password").successHandler(new LoginSuccessHandler()).permitAll();
		});

		// Logout
		http.logout(logout -> {
			logout.logoutUrl("/signout");
			logout.logoutSuccessUrl("/");
		});

		return http.build();
	}

	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}