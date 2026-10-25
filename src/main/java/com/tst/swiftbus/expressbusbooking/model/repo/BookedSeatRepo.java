package com.tst.swiftbus.expressbusbooking.model.repo;

import org.springframework.stereotype.Repository;

import com.tst.swiftbus.expressbusbooking.model.BaseRepository;
import com.tst.swiftbus.expressbusbooking.model.entity.BookedSeat;

@Repository
public interface BookedSeatRepo extends BaseRepository<BookedSeat, Long> {

}
