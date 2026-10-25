package com.tst.swiftbus.expressbusbooking.model.repo;

import java.util.Optional;

import com.tst.swiftbus.expressbusbooking.model.BaseRepository;
import com.tst.swiftbus.expressbusbooking.model.entity.Member;

public interface MemberRepo extends BaseRepository<Member, Long> {

	Optional<Member> findOneByAccountEmail(String email);

}
