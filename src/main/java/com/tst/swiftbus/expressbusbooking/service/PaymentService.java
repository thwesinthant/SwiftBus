package com.tst.swiftbus.expressbusbooking.service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tst.swiftbus.expressbusbooking.model.entity.Booking;
import com.tst.swiftbus.expressbusbooking.model.entity.Member;
import com.tst.swiftbus.expressbusbooking.model.entity.Payment;
import com.tst.swiftbus.expressbusbooking.model.entity.consts.PaymentStatus;
import com.tst.swiftbus.expressbusbooking.model.repo.PaymentRepo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PaymentService {

	private final PaymentRepo paymentRepo;
	private final BookingService bookingService;

	private static final List<String> ALLOWED_METHODS = List.of("WAVE_PAY", "MOBILE_BANKING", "BANK_TRANSFER");

	@Transactional
	public Payment processDemoPayment(String busNo, Integer scheduleId, List<String> selectedSeats,
			String paymentMethod, Member member) {

		if (paymentMethod == null || !ALLOWED_METHODS.contains(paymentMethod)) {
			throw new IllegalArgumentException("Please select a valid payment method.");
		}

		// Revalidates the schedule, price and active seat holds.
		Booking booking = bookingService.createPendingBooking(busNo, scheduleId, selectedSeats, member);

		if (booking.getTotalPrice() == null || booking.getTotalPrice() <= 0) {
			throw new IllegalStateException("The booking total is invalid.");
		}

		Payment payment = new Payment();
		payment.setBooking(booking);
		payment.setPaymentMethod(paymentMethod);
		payment.setAmount(BigDecimal.valueOf(booking.getTotalPrice()));
		payment.setStatus(PaymentStatus.PENDING);

		payment = paymentRepo.saveAndFlush(payment);

		/*
		 * DEMO ONLY: This simulates a successful payment. It does not contact Wave Pay
		 * or a bank.
		 */
		payment.setStatus(PaymentStatus.SUCCESS);
		payment.setTransactionReference("DEMO-" + UUID.randomUUID());
		payment.setPaidAt(LocalDateTime.now());

		payment = paymentRepo.saveAndFlush(payment);

		// Confirm only after the demo payment is marked successful.
		bookingService.confirmAfterVerifiedPayment(booking.getId(), member);

		return payment;
	}
}
