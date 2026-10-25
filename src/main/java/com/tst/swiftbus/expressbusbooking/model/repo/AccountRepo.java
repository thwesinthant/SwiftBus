package com.tst.swiftbus.expressbusbooking.model.repo;

import java.util.Optional;

import com.tst.swiftbus.expressbusbooking.model.BaseRepository;
import com.tst.swiftbus.expressbusbooking.model.entity.Account;

public interface AccountRepo extends BaseRepository<Account, Long> {

	Optional<Account> findByEmail(String email);

	boolean existsByEmail(String email);

}
