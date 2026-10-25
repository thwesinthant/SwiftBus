package com.tst.swiftbus.expressbusbooking.controller;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Arrays;
import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tst.swiftbus.expressbusbooking.controller.dto.BookingDTO;
import com.tst.swiftbus.expressbusbooking.model.entity.Member;
import com.tst.swiftbus.expressbusbooking.model.repo.MemberRepo;
import com.tst.swiftbus.expressbusbooking.service.BusSearchService;
import com.tst.swiftbus.expressbusbooking.service.PaymentService;
import com.tst.swiftbus.expressbusbooking.service.SeatService;
import com.tst.swiftbus.expressbusbooking.utils.exceptions.AppBusinessException;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/booking")
public class BookingController {

	private final BusSearchService busSearchService;
	private final MemberRepo memberRepo;
	private final SeatService seatService;
	private final PaymentService paymentService;

	@PostMapping("/steptwo")
	public String bookingStepTwo(@RequestParam String busNo, @RequestParam Integer scheduleId,
			@RequestParam String selectedSeats, ModelMap model, HttpSession session,
			RedirectAttributes redirectAttributes) {

		String email = SecurityContextHolder.getContext().getAuthentication().getName();
		Member member = memberRepo.findOneByAccountEmail(email)
				.orElseThrow(() -> new AppBusinessException("Member not found for email: " + email));

		List<Integer> seatNos = Arrays.stream(selectedSeats.split(",")).map(Integer::parseInt).toList();

		try {
			seatService.tryHoldSeats(busNo, scheduleId, seatNos, member.getAccount().getId());

		} catch (DataIntegrityViolationException e) {

			redirectAttributes.addFlashAttribute("error",
					"One or more selected seats are no longer available. "
							+ "Your available selections have been kept. "
							+ "Please choose replacement seat(s) and try again.");

			redirectAttributes.addFlashAttribute("previouslySelectedSeats", seatNos);

			return "redirect:/bus/booking/" + busNo + "?scheduleId=" + scheduleId;
		}

		var result = busSearchService.findByBusNo(busNo);
		model.put("result", result.get());
		model.put("scheduleId", scheduleId);
		model.put("selectedSeats", selectedSeats.split(","));

		BookingDTO dto = new BookingDTO();
		dto.setBusNo(busNo);
		dto.setScheduleId(scheduleId);
		dto.setSelectedSeats(Arrays.asList(selectedSeats.split(",")));
		session.setAttribute("booking", dto);
		model.addAttribute("member", member);
		model.put("result", result.get());
		model.put("scheduleId", scheduleId);
		model.put("selectedSeats", selectedSeats.split(","));

		LocalDateTime holdUntil = seatService.getActiveHoldExpiry(busNo, scheduleId, seatNos,
				member.getAccount().getId());

		long holdUntilEpochMillis = holdUntil.atZone(ZoneId.of("Asia/Yangon")).toInstant().toEpochMilli();

		model.addAttribute("holdUntilEpochMillis", holdUntilEpochMillis);

		return "bookingsteptwo";
	}

	@PostMapping("/stepthree")
	public String bookingStepThree(@RequestParam String busNo, @RequestParam Integer scheduleId,
			@RequestParam String selectedSeats, @RequestParam String name, @RequestParam String gender,
			@RequestParam String nrc, @RequestParam String phone, @RequestParam String email,
			@RequestParam(required = false) String request, HttpSession session, ModelMap model,
			RedirectAttributes redirectAttributes) {

		BookingDTO dto = (BookingDTO) session.getAttribute("booking");

		if (dto == null) {
			redirectAttributes.addFlashAttribute("error",
					"Your booking session has expired. Please select seats again.");

			return "redirect:/bus/booking/" + busNo + "?scheduleId=" + scheduleId;
		}

		List<String> requestedSeats = Arrays.stream(selectedSeats.split(",")).map(String::trim).toList();

		List<String> sessionSeats = dto.getSelectedSeats();

		boolean bookingMismatch = !busNo.equals(dto.getBusNo()) || !scheduleId.equals(dto.getScheduleId())
				|| sessionSeats == null
				|| !new java.util.HashSet<>(requestedSeats).equals(new java.util.HashSet<>(sessionSeats));

		if (bookingMismatch) {
			redirectAttributes.addFlashAttribute("error",
					"Your booking information has changed. Please select your seats again.");

			return "redirect:/bus/booking/" + dto.getBusNo() + "?scheduleId=" + dto.getScheduleId();
		}

		List<Integer> seatNos = Arrays.stream(selectedSeats.split(",")).map(String::trim).map(Integer::parseInt)
				.toList();

		String currentEmail = SecurityContextHolder.getContext().getAuthentication().getName();

		Member member = memberRepo.findOneByAccountEmail(currentEmail)
				.orElseThrow(() -> new AppBusinessException("Member not found for email: " + currentEmail));

		try {
			// Read the EXISTING active hold expiry.
			// Do not call tryHoldSeats() here.
			LocalDateTime holdUntil = seatService.getActiveHoldExpiry(busNo, scheduleId, seatNos,
					member.getAccount().getId());

			long holdUntilEpochMillis = holdUntil.atZone(ZoneId.of("Asia/Yangon")).toInstant().toEpochMilli();

			dto.setBusNo(busNo);
			dto.setScheduleId(scheduleId);
			dto.setSelectedSeats(Arrays.asList(selectedSeats.split(",")));

			dto.setTravellerName(name);
			dto.setTravellerGender(gender);
			dto.setTravellerNrc(nrc);
			dto.setTravellerPhone(phone);
			dto.setTravellerEmail(email);
			dto.setRequest(request);

			session.setAttribute("booking", dto);

			model.addAttribute("trip", dto);
			model.addAttribute("holdUntilEpochMillis", holdUntilEpochMillis);

			// Keep the existing JSP attributes if the payment page uses them.
			var result = busSearchService.findByBusNo(busNo);

			if (result.isEmpty()) {
				redirectAttributes.addFlashAttribute("error", "The selected bus could not be found.");

				return "redirect:/bus/booking/" + busNo + "?scheduleId=" + scheduleId;
			}

			model.addAttribute("result", result.get());
			model.addAttribute("scheduleId", scheduleId);
			model.addAttribute("selectedSeats", selectedSeats.split(","));
			model.addAttribute("member", member);

			return "bookingstepthree";

		} catch (IllegalStateException e) {
			redirectAttributes.addFlashAttribute("error", "Your seat hold has expired. Please select seats again.");

			return "redirect:/bus/booking/" + busNo + "?scheduleId=" + scheduleId;
		}
	}

	@PostMapping("/stepfour")
	public String bookingStepFour(@RequestParam String paymentMethod, HttpSession session, ModelMap model,
			RedirectAttributes redirectAttributes) {

		BookingDTO dto = (BookingDTO) session.getAttribute("booking");

		if (dto == null) {
			redirectAttributes.addFlashAttribute("error",
					"Your booking session has expired. Please select seats again.");

			return "redirect:/bus";
		}

		String currentEmail = SecurityContextHolder.getContext().getAuthentication().getName();

		Member member = memberRepo.findOneByAccountEmail(currentEmail)
				.orElseThrow(() -> new AppBusinessException("Member not found."));

		try {
			// Use session data, NOT hidden form fields.
			var payment = paymentService.processDemoPayment(dto.getBusNo(), dto.getScheduleId(), dto.getSelectedSeats(),
					paymentMethod, member);

			// POST-Redirect-GET: reduce accidental form resubmission.
			redirectAttributes.addFlashAttribute("bookingId", payment.getBooking().getId());
			redirectAttributes.addFlashAttribute("totalAmount", payment.getAmount());
			redirectAttributes.addFlashAttribute("paymentMethod", payment.getPaymentMethod());
			redirectAttributes.addFlashAttribute("transactionReference", payment.getTransactionReference());

			// Prevent reusing this session booking for another payment.
			session.removeAttribute("booking");

			return "redirect:/booking/confirmation";

		} catch (IllegalArgumentException | IllegalStateException e) {
			redirectAttributes.addFlashAttribute("error", e.getMessage());

			return "redirect:/bus/booking/" + dto.getBusNo() + "?scheduleId=" + dto.getScheduleId();
		}
	}

	@GetMapping("/confirmation")
	public String bookingConfirmation() {
		return "bookingconfirm";
	}
}
