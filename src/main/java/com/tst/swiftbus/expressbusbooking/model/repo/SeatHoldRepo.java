package com.tst.swiftbus.expressbusbooking.model.repo;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.tst.swiftbus.expressbusbooking.model.BaseRepository;
import com.tst.swiftbus.expressbusbooking.model.entity.SeatHold;

public interface SeatHoldRepo extends BaseRepository<SeatHold, Long> {

	@Query("""
			SELECT h FROM SeatHold h
			WHERE h.busNo = :busNo
			  AND h.scheduleId = :scheduleId
			  AND h.heldByAccountId = :accountId
			  AND h.seatNo IN :seatNos
			  AND h.holdUntil > :now
			""")
	List<SeatHold> findActiveHoldsForAccount(@Param("busNo") String busNo, @Param("scheduleId") Integer scheduleId,
			@Param("accountId") Long accountId, @Param("seatNos") List<Integer> seatNos,
			@Param("now") LocalDateTime now);

	@Modifying
	@Query("DELETE FROM SeatHold h WHERE h.busNo = :busNo AND h.seatNo = :seatNo "
			+ "AND h.scheduleId = :scheduleId AND h.holdUntil < :now")
	void deleteIfExpired(@Param("busNo") String busNo, @Param("seatNo") Integer seatNo,
			@Param("scheduleId") Integer scheduleId, @Param("now") LocalDateTime now);

	@Modifying
	@Query("DELETE FROM SeatHold h WHERE h.busNo = :busNo AND h.scheduleId = :scheduleId "
			+ "AND h.seatNo IN :seatNos AND h.heldByAccountId = :accountId")
	void releaseHolds(@Param("busNo") String busNo, @Param("scheduleId") Integer scheduleId,
			@Param("seatNos") List<Integer> seatNos, @Param("accountId") Long accountId);

	@Query("""
			SELECT h FROM SeatHold h
			WHERE h.busNo = :busNo
			  AND h.seatNo = :seatNo
			  AND h.scheduleId = :scheduleId
			  AND h.holdUntil > :now
			""")
	Optional<SeatHold> findActiveHold(@Param("busNo") String busNo, @Param("seatNo") Integer seatNo,
			@Param("scheduleId") Integer scheduleId, @Param("now") LocalDateTime now);

	@Modifying
	@Query("""
			DELETE FROM SeatHold h
			WHERE h.busNo = :busNo
			  AND h.scheduleId = :scheduleId
			  AND h.heldByAccountId = :accountId
			  AND h.seatNo NOT IN :seatNos
			""")
	void releaseHoldsNotSelected(@Param("busNo") String busNo, @Param("scheduleId") Integer scheduleId,
			@Param("accountId") Long accountId, @Param("seatNos") List<Integer> seatNos);
}