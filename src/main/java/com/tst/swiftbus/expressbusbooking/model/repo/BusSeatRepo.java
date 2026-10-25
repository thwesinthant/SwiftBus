package com.tst.swiftbus.expressbusbooking.model.repo;

import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tst.swiftbus.expressbusbooking.model.BaseRepository;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSeat;
import com.tst.swiftbus.expressbusbooking.model.entity.embeddables.BusSeatPk;

public interface BusSeatRepo extends BaseRepository<BusSeat, BusSeatPk> {

	@Query("SELECT s FROM BusSeat s WHERE s.id.busNo = :busNo AND s.id.seatNo = :seatNo")
	Optional<BusSeat> findByBusNoAndSeatNo(@Param("busNo") String busNo, @Param("seatNo") Integer seatNo);

}