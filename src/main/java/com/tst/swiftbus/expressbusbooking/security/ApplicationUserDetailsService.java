package com.tst.swiftbus.expressbusbooking.security;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.tst.swiftbus.expressbusbooking.model.repo.AccountRepo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ApplicationUserDetailsService implements UserDetailsService {

	private final AccountRepo accountRepo;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {

		return accountRepo.findByEmail(email)
				.map(account -> User.withUsername(email).password(account.getPassword())
						.authorities("ROLE_" + account.getRole().name())

						.disabled(!account.isActive()).build())
				.orElseThrow(() -> new UsernameNotFoundException("Invalid Login ID"));
	}
}
