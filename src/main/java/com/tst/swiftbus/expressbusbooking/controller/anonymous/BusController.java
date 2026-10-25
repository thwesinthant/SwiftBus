
package com.tst.swiftbus.expressbusbooking.controller.anonymous;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tst.swiftbus.expressbusbooking.controller.dto.BusSearchDTO;
import com.tst.swiftbus.expressbusbooking.controller.dto.SeatStatusDTO;
import com.tst.swiftbus.expressbusbooking.model.entity.Member;
import com.tst.swiftbus.expressbusbooking.model.repo.BusTypeRepo;
import com.tst.swiftbus.expressbusbooking.model.repo.MemberRepo;
import com.tst.swiftbus.expressbusbooking.service.BusSearchService;
import com.tst.swiftbus.expressbusbooking.service.SeatService;
import com.tst.swiftbus.expressbusbooking.utils.exceptions.AppBusinessException;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/bus")
public class BusController {

	private final BusSearchService busSearchService;
	private final SeatService seatService;
	private final BusTypeRepo busTypeRepo;
	private final MemberRepo memberRepo;

	@GetMapping
	public String search(@Valid BusSearchDTO form, BindingResult bindingResult, ModelMap model,
			@RequestParam(required = false, defaultValue = "0") int page,
			@RequestParam(required = false, defaultValue = "10") int size) {

		model.put("form", form);
		model.put("busTypes", busTypeRepo.findAll());

		// Check whether the user selected a route and travel date.
		boolean hasSearchCriteria = StringUtils.hasText(form.getStartLocation())
				&& StringUtils.hasText(form.getEndLocation()) && form.getTravelDate() != null;

		// Direct navigation to /bus without search criteria.
		if (!hasSearchCriteria) {
			model.put("searchPerformed", false);
			return "busResultList";
		}

		// Stop searching when validation errors exist.
		if (bindingResult.hasErrors()) {
			model.put("searchPerformed", false);
			return "busResultList";
		}

		// Search buses.
		var result = busSearchService.search(form, page, size);

		model.put("result", result);
		model.put("searchPerformed", true);

		return "busResultList";
	}

	@GetMapping("/booking/{busNo}")
	public String booking(@PathVariable String busNo, @RequestParam(required = false) Integer scheduleId,
			ModelMap model) {

		// Find the bus.
		var result = busSearchService.findByBusNo(busNo);

		if (result.isEmpty()) {
			model.put("errorMessage", "No bus found with number " + busNo);
			return "error";
		}

		model.put("result", result.get());

		// Get the currently logged-in user's email.
		String email = SecurityContextHolder.getContext().getAuthentication().getName();

		// Find the member associated with that account.
		Member member = memberRepo.findOneByAccountEmail(email)
				.orElseThrow(() -> new AppBusinessException("Member not found for email: " + email));

		// Get seat statuses for this bus, schedule, and current user.
		List<SeatStatusDTO> seats = seatService.getSeatStatuses(busNo, scheduleId, member.getAccount().getId());

		model.put("seats", seats);

		return "booking";
	}

	@GetMapping("/booking/{busNo}/seat-status")
	@ResponseBody
	public List<SeatStatusDTO> getSeatStatuses(@PathVariable String busNo, @RequestParam Integer scheduleId) {

		// Get the currently logged-in user's email.
		String email = SecurityContextHolder.getContext().getAuthentication().getName();

		// Find the member associated with that account.
		Member member = memberRepo.findOneByAccountEmail(email)
				.orElseThrow(() -> new AppBusinessException("Member not found for email: " + email));

		// Return the latest seat statuses as JSON.
		return seatService.getSeatStatuses(busNo, scheduleId, member.getAccount().getId());
	}

}
