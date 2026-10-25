package com.tst.swiftbus.expressbusbooking.model.repo;

import org.springframework.stereotype.Repository;

import com.tst.swiftbus.expressbusbooking.model.BaseRepository;
import com.tst.swiftbus.expressbusbooking.model.entity.Booking;

@Repository
public interface BookingRepo extends BaseRepository<Booking, Long> {

}
