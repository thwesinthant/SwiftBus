package com.tst.swiftbus.expressbusbooking.controller.dto;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StringUtils;

import com.tst.swiftbus.expressbusbooking.model.entity.Bus;
import com.tst.swiftbus.expressbusbooking.model.entity.BusRoute;
import com.tst.swiftbus.expressbusbooking.model.entity.BusRoute_;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSchedule;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSchedule_;
import com.tst.swiftbus.expressbusbooking.model.entity.BusType;
import com.tst.swiftbus.expressbusbooking.model.entity.BusType_;
import com.tst.swiftbus.expressbusbooking.model.entity.consts.BusCategory;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Predicate;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class BusSearchDTO {

	@NotBlank(message = "Please select a departure city.")
	private String startLocation;

	@NotBlank(message = "Please select a destination city.")
	private String endLocation;

	@NotNull(message = "Please select a travel date.")
	private LocalDate travelDate;

	private String passengerType;

	private String ticketType;

	@Min(value = 1, message = "At least one seat must be selected.")
	private int seats = 1;

	private String promoCode;

	private String busCategory;

	private String sortBy = "lowestPrice";
	private String departurePeriod;

	public Predicate[] where(CriteriaBuilder cb, Join<Bus, BusRoute> route, Join<Bus, BusSchedule> schedule,
			Join<Bus, BusType> busType) {

		List<Predicate> list = new ArrayList<>();

		if (StringUtils.hasText(startLocation) && StringUtils.hasText(endLocation)
				&& startLocation.equals(endLocation)) {
			throw new IllegalArgumentException("Departure and destination cities cannot be the same.");
		}

		if (StringUtils.hasText(startLocation)) {
			list.add(cb.equal(route.get(BusRoute_.startLocation), startLocation));
		}

		if (StringUtils.hasText(endLocation)) {
			list.add(cb.equal(route.get(BusRoute_.endLocation), endLocation));
		}

		if (travelDate != null) {
			var startOfDay = travelDate.atStartOfDay();
			var endOfDay = travelDate.plusDays(1).atStartOfDay();

			list.add(cb.and(cb.lessThan(schedule.get(BusSchedule_.departureTime), endOfDay),
					cb.greaterThan(schedule.get(BusSchedule_.arrivalTime), startOfDay)));
		}

		if (StringUtils.hasText(departurePeriod) && travelDate != null) {
			var departure = schedule.get(BusSchedule_.departureTime);

			var morningStart = travelDate.atStartOfDay();
			var afternoonStart = travelDate.atTime(12, 0);
			var nightStart = travelDate.atTime(18, 0);
			var nextDay = travelDate.plusDays(1).atStartOfDay();

			switch (departurePeriod) {
			case "morning" -> list.add(
					cb.and(cb.greaterThanOrEqualTo(departure, morningStart), cb.lessThan(departure, afternoonStart)));

			case "afternoon" -> list.add(
					cb.and(cb.greaterThanOrEqualTo(departure, afternoonStart), cb.lessThan(departure, nightStart)));

			case "night" ->
				list.add(cb.and(cb.greaterThanOrEqualTo(departure, nightStart), cb.lessThan(departure, nextDay)));
			}
		}

		if (StringUtils.hasText(ticketType)) {
			list.add(cb.equal(busType.get(BusType_.typeName), ticketType));
		}

		if (StringUtils.hasText(promoCode)) {
			list.add(cb.equal(schedule.get(BusSchedule_.promoCode), promoCode));
		}

		if (StringUtils.hasText(busCategory)) {
			list.add(cb.equal(busType.get(BusType_.category), BusCategory.valueOf(busCategory)));
		}

		return list.toArray(Predicate[]::new);
	}

}
