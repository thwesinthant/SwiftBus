
package com.tst.swiftbus.expressbusbooking.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.tst.swiftbus.expressbusbooking.model.entity.Account;
import com.tst.swiftbus.expressbusbooking.model.entity.consts.Role;
import com.tst.swiftbus.expressbusbooking.model.repo.AccountRepo;

import jakarta.annotation.PostConstruct;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Configuration
@PropertySource(value = "classpath:/admin-user.properties")
@RequiredArgsConstructor
public class AdminUserInitializer {

	private final PasswordEncoder passwordEncoder;
	private final AccountRepo accountRepo;

	@Value("${app.admin.email}")
	private String email;
	@Value("${app.admin.password}")
	private String password;

	@PostConstruct
	@Transactional
	public void initialize() {

		if (accountRepo.count() == 0L) {
			var admin = new Account();
			admin.setEmail(email);
			admin.setPassword(passwordEncoder.encode(password));
			admin.setRole(Role.ADMIN);
			admin.setActive(true);
			accountRepo.save(admin);
		}
	}
}
