package com.tst.swiftbus.expressbusbooking.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tst.swiftbus.expressbusbooking.model.entity.BookedSeat;
import com.tst.swiftbus.expressbusbooking.model.entity.Booking;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSchedule;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSeat;
import com.tst.swiftbus.expressbusbooking.model.entity.Member;
import com.tst.swiftbus.expressbusbooking.model.entity.consts.BookingStatus;
import com.tst.swiftbus.expressbusbooking.model.entity.embeddables.BusSeatPk;
import com.tst.swiftbus.expressbusbooking.model.repo.BookingRepo;
import com.tst.swiftbus.expressbusbooking.model.repo.BusScheduleRepo;
import com.tst.swiftbus.expressbusbooking.model.repo.BusSeatRepo;
import com.tst.swiftbus.expressbusbooking.model.repo.SeatHoldRepo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookingService {

	private final BookingRepo bookingRepo;
	private final BusScheduleRepo busScheduleRepo;
	private final BusSeatRepo busSeatRepo;
	private final SeatHoldRepo seatHoldRepo;
	private final SeatService seatService;

	@Transactional
	public Booking createPendingBooking(String busNo, Integer scheduleId, List<String> selectedSeats, Member member) {

		if (selectedSeats == null || selectedSeats.isEmpty()) {
			throw new IllegalArgumentException("At least one seat must be selected.");
		}

		if (member == null || member.getAccount() == null) {
			throw new IllegalArgumentException("A valid logged-in member is required.");
		}

		List<Integer> seatNos = selectedSeats.stream().map(String::trim).map(Integer::parseInt).toList();

		Set<Integer> uniqueSeats = new HashSet<>(seatNos);

		if (uniqueSeats.size() != seatNos.size()) {
			throw new IllegalArgumentException("Duplicate seat selections are not allowed.");
		}

		// Find the exact schedule selected by the user.
		BusSchedule schedule = busScheduleRepo.findById(scheduleId)
				.orElseThrow(() -> new IllegalArgumentException("The selected bus schedule was not found."));

		if (schedule.getBus() == null || !busNo.equals(schedule.getBus().getBusNo())) {
			throw new IllegalArgumentException("The selected schedule does not belong to this bus.");
		}

		Long accountId = member.getAccount().getId();

		// Verify that every selected seat still has an active hold.
		seatService.getActiveHoldExpiry(busNo, scheduleId, seatNos, accountId);

		// Get the price from the database, not from the browser.
		BigDecimal price = schedule.getBus().getBusType().getPrice();

		if (price == null || price.signum() < 0) {
			throw new IllegalStateException("The bus ticket price is invalid.");
		}

		double totalPrice = price.doubleValue() * seatNos.size();

		Booking booking = new Booking();
		booking.setMember(member);
		booking.setSchedule(schedule);
		booking.setTotalPrice(totalPrice);
		booking.setStatus(BookingStatus.PENDING);

		List<BookedSeat> bookedSeats = new ArrayList<>();

		for (Integer seatNo : seatNos) {

			BusSeatPk seatPk = new BusSeatPk(busNo, seatNo);

			BusSeat busSeat = busSeatRepo.findById(seatPk)
					.orElseThrow(() -> new IllegalArgumentException("Seat " + seatNo + " does not exist."));

			BookedSeat bookedSeat = new BookedSeat();
			bookedSeat.setBooking(booking);
			bookedSeat.setBusSeat(busSeat);
			bookedSeat.setCancelled(false);

			bookedSeats.add(bookedSeat);
		}

		booking.setBookedSeats(bookedSeats);

		// Cascade persists the booking and its booked-seat records.
		return bookingRepo.saveAndFlush(booking);
	}

	@Transactional
	public Booking confirmAfterVerifiedPayment(Long bookingId, Member member) {

		Booking booking = bookingRepo.findById(bookingId)
				.orElseThrow(() -> new IllegalArgumentException("Booking was not found."));

		if (member == null || booking.getMember() == null || booking.getMember().getId() != member.getId()) {

			throw new IllegalArgumentException("You are not authorized to confirm this booking.");
		}

		if (booking.getStatus() != BookingStatus.PENDING) {
			throw new IllegalStateException("This booking is not awaiting payment confirmation.");
		}

		String busNo = booking.getSchedule().getBus().getBusNo();

		Integer scheduleId = booking.getSchedule().getScheduleId();

		Long accountId = member.getAccount().getId();

		List<Integer> seatNos = booking.getBookedSeats().stream().filter(seat -> !seat.isCancelled())
				.map(seat -> seat.getBusSeat().getId().getSeatNo()).toList();

		// Recheck holds immediately before confirmation.
		// If a hold expired, do not confirm the booking.
		seatService.getActiveHoldExpiry(busNo, scheduleId, seatNos, accountId);

		booking.setStatus(BookingStatus.CONFIRMED);

		Booking confirmedBooking = bookingRepo.saveAndFlush(booking);

		// Release the user's holds after successful confirmation.
		seatHoldRepo.releaseHolds(busNo, scheduleId, seatNos, accountId);

		return confirmedBooking;
	}
}
