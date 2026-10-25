package com.tst.swiftbus.expressbusbooking.service;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tst.swiftbus.expressbusbooking.controller.dto.SeatHoldResultDTO;
import com.tst.swiftbus.expressbusbooking.controller.dto.SeatStatusDTO;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSeat;
import com.tst.swiftbus.expressbusbooking.model.entity.SeatHold;
import com.tst.swiftbus.expressbusbooking.model.entity.consts.BookingStatus;
import com.tst.swiftbus.expressbusbooking.model.repo.BusSeatRepo;
import com.tst.swiftbus.expressbusbooking.model.repo.SeatHoldRepo;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.JoinType;

@Service
public class SeatService {

	private final BusSeatRepo seatRepo;
	private final SeatHoldRepo seatHoldRepo;

	public SeatService(BusSeatRepo seatRepo, SeatHoldRepo seatHoldRepo) { // updated constructor
		this.seatRepo = seatRepo;
		this.seatHoldRepo = seatHoldRepo;
	}

	@Transactional(readOnly = true)
	public LocalDateTime getActiveHoldExpiry(String busNo, Integer scheduleId, List<Integer> seatNos, Long accountId) {

		LocalDateTime now = LocalDateTime.now();

		List<SeatHold> activeHolds = seatHoldRepo.findActiveHoldsForAccount(busNo, scheduleId, accountId, seatNos, now);

		Set<Integer> requestedSeats = new HashSet<>(seatNos);

		Set<Integer> heldSeats = activeHolds.stream().map(SeatHold::getSeatNo).collect(Collectors.toSet());

		if (!heldSeats.containsAll(requestedSeats)) {
			throw new IllegalStateException("One or more seat holds have expired.");
		}

		return activeHolds.stream().filter(hold -> requestedSeats.contains(hold.getSeatNo()))
				.map(SeatHold::getHoldUntil).min(LocalDateTime::compareTo)
				.orElseThrow(() -> new IllegalStateException("No active seat holds found."));
	}

	@Transactional(readOnly = true)
	public List<SeatStatusDTO> getSeatStatuses(String busNo, Integer scheduleId, Long accountId) {

		return seatRepo.search(seatStatusQuery(busNo, scheduleId, accountId));
	}

	@Transactional
	public SeatHoldResultDTO tryHoldSeats(String busNo, Integer scheduleId, List<Integer> seatNos, Long accountId) {

		if (seatNos == null || seatNos.isEmpty()) {
			throw new IllegalArgumentException("At least one seat must be selected.");
		}

		LocalDateTime now = LocalDateTime.now();

		// Remove this user's holds for seats they no longer selected.
		seatHoldRepo.releaseHoldsNotSelected(busNo, scheduleId, accountId, seatNos);

		for (Integer seatNo : seatNos) {

			seatHoldRepo.deleteIfExpired(busNo, seatNo, scheduleId, now);

			var existingHold = seatHoldRepo.findActiveHold(busNo, seatNo, scheduleId, now);

			if (existingHold.isPresent()) {

				// This seat is already held by the current user.
				if (existingHold.get().getHeldByAccountId().equals(accountId)) {
					continue;
				}

				// Another user owns this seat. Throwing a runtime exception
				// rolls back this entire transaction.
				throw new org.springframework.dao.DataIntegrityViolationException(
						"Seat " + seatNo + " is held by another user.");
			}

			SeatHold hold = new SeatHold();
			hold.setBusNo(busNo);
			hold.setSeatNo(seatNo);
			hold.setScheduleId(scheduleId);
			hold.setHeldByAccountId(accountId);
			hold.setHoldUntil(now.plusMinutes(10));

			// A concurrent user may claim the seat between the lookup and insert.
			// The unique database constraint remains necessary for that race.
			seatHoldRepo.saveAndFlush(hold);
		}

		return new SeatHoldResultDTO(true, List.of());
	}

	private Function<CriteriaBuilder, CriteriaQuery<SeatStatusDTO>> seatStatusQuery(String busNo, Integer scheduleId,
			Long accountId) {
		return cb -> {
			var cq = cb.createQuery(SeatStatusDTO.class);
			var seatRoot = cq.from(BusSeat.class);

			var bookedJoin = seatRoot.join("bookedSeats", JoinType.LEFT);
			var bookingJoin = bookedJoin.join("booking", JoinType.LEFT);
			var holdJoin = seatRoot.join("holds", JoinType.LEFT);

			// Check whether this seat is booked for the requested schedule.
			var isBooked = cb.and(cb.isNotNull(bookingJoin.get("id")),
					cb.equal(bookingJoin.get("status"), BookingStatus.CONFIRMED),
					cb.equal(bookingJoin.get("schedule").get("scheduleId"), scheduleId));

			// Check whether this seat has an active hold for this schedule only.
			var isHeld = cb.and(cb.isNotNull(holdJoin.get("id")), cb.equal(holdJoin.get("scheduleId"), scheduleId),
					cb.greaterThan(holdJoin.get("holdUntil"), LocalDateTime.now()));

			var isHeldByCurrentUser = cb.and(isHeld, cb.equal(holdJoin.get("heldByAccountId"), accountId));

			cq.select(cb.construct(SeatStatusDTO.class, seatRoot.get("id").get("seatNo"),
					cb.<Boolean>selectCase().when(isBooked, true).otherwise(false),
					cb.<Boolean>selectCase().when(isHeld, true).otherwise(false),
					cb.<Boolean>selectCase().when(isHeldByCurrentUser, true).otherwise(false)));

			cq.where(cb.equal(seatRoot.get("id").get("busNo"), busNo));

			cq.orderBy(cb.asc(seatRoot.get("id").get("seatNo")));

			return cq;
		};
	}

}
