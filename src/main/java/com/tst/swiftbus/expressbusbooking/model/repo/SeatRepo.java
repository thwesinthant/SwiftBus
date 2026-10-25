package com.tst.swiftbus.expressbusbooking.model.repo;

import java.util.List;

import com.tst.swiftbus.expressbusbooking.model.BaseRepository;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSeat;
import com.tst.swiftbus.expressbusbooking.model.entity.embeddables.BusSeatPk;

public interface SeatRepo extends BaseRepository<BusSeat, BusSeatPk> {
	List<BusSeat> findByBus_BusNo(String busNo);

}
