package com.tst.swiftbus.expressbusbooking.controller.dto;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Locale;

import com.tst.swiftbus.expressbusbooking.model.entity.Bus;
import com.tst.swiftbus.expressbusbooking.model.entity.BusRoute;
import com.tst.swiftbus.expressbusbooking.model.entity.BusRoute_;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSchedule;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSchedule_;
import com.tst.swiftbus.expressbusbooking.model.entity.BusType;
import com.tst.swiftbus.expressbusbooking.model.entity.BusType_;
import com.tst.swiftbus.expressbusbooking.model.entity.Bus_;
import com.tst.swiftbus.expressbusbooking.model.entity.consts.BusCategory;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Join;
import jakarta.persistence.criteria.Root;

public record BusSearchResultDTO(String busNo, String busName, String startLocation, String endLocation,
		LocalDateTime departureTime, LocalDateTime arrivalTime, Integer availableSeats, String ticketType,
		String passengerType, BusCategory category, BigDecimal pricePerSeat, String imageUrl, Integer scheduleId) {

	public static void select(CriteriaBuilder cb, CriteriaQuery<BusSearchResultDTO> cq, Root<Bus> root,
			Join<Bus, BusRoute> route, Join<Bus, BusSchedule> schedule, Join<Bus, BusType> busType) {

		cq.multiselect(root.get(Bus_.busNo).alias("busNo"), root.get(Bus_.busName).alias("busName"),
				route.get(BusRoute_.startLocation).alias("startLocation"),
				route.get(BusRoute_.endLocation).alias("endLocation"),
				schedule.get(BusSchedule_.departureTime).alias("departureTime"),
				schedule.get(BusSchedule_.arrivalTime).alias("arrivalTime"),
				schedule.get(BusSchedule_.availableSeats).alias("availableSeats"),
				busType.get(BusType_.typeName).alias("ticketType"), cb.literal("Local").alias("passengerType"),
				busType.get(BusType_.category).alias("category"), busType.get(BusType_.price).alias("pricePerSeat"),
				root.get(Bus_.IMAGE_URL).alias("imageUrl"), schedule.get(BusSchedule_.scheduleId).alias("scheduleId"));
	}

	public String getFormattedDepartureTime() {
		return departureTime.format(DateTimeFormatter.ofPattern("EEE, dd MMM yyyy '•' hh:mm a", Locale.ENGLISH));
	}

	public String getFormattedArrivalTime() {
		return arrivalTime.format(DateTimeFormatter.ofPattern("EEE, dd MMM yyyy '•' hh:mm a", Locale.ENGLISH));
	}

	public String getFormattedDuration() {
		if (departureTime == null || arrivalTime == null) {
			return "—";
		}

		long totalMinutes = java.time.Duration.between(departureTime, arrivalTime).toMinutes();

		if (totalMinutes < 0) {
			return "—";
		}

		long hours = totalMinutes / 60;
		long minutes = totalMinutes % 60;

		return hours + "h " + minutes + "m";
	}

}
