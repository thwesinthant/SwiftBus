package com.tst.swiftbus.expressbusbooking.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.tst.swiftbus.expressbusbooking.controller.dto.SignUpForm;
import com.tst.swiftbus.expressbusbooking.model.entity.Account;
import com.tst.swiftbus.expressbusbooking.model.entity.Member;
import com.tst.swiftbus.expressbusbooking.model.entity.consts.Role;
import com.tst.swiftbus.expressbusbooking.model.repo.AccountRepo;
import com.tst.swiftbus.expressbusbooking.model.repo.MemberRepo;
import com.tst.swiftbus.expressbusbooking.utils.exceptions.AppBusinessException;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SignUpService {

	private final AccountRepo accountRepo;
	private final MemberRepo memberRepo;
	private final PasswordEncoder passwordEncoder;

	@Transactional
	public String signUp(SignUpForm form) {

		if (accountRepo.existsByEmail(form.getEmail())) {
			throw new AppBusinessException("Your email is already registered.Please try another email.");
		}

		var account = new Account();
		account.setEmail(form.getEmail());
		account.setPassword(passwordEncoder.encode(form.getPassword()));
		account.setActive(true);
		account.setRole(Role.USER);
		accountRepo.save(account);

		var member = new Member();
		member.setName(form.getName());
		member.setEmail(form.getEmail());
		member.setPhone(form.getPhone());
		member.setNrcRegion(form.getNrcRegion());
		member.setNrcTownship(form.getNrcTownship());
		member.setNrcType(form.getNrcType());
		member.setNrcNumber(form.getNrcNumber());
		member.setAccount(account);

		memberRepo.save(member);

		return "Your account has been created successfully. Please sign in again.";
	}

}
