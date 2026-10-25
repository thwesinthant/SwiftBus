package com.tst.swiftbus.expressbusbooking.controller.dto;

import java.util.List;

import lombok.Data;

@Data
public class BookingDTO {

	private String busNo;
	private Integer scheduleId;
	private List<String> selectedSeats;

	private String travellerName;
	private String travellerGender;
	private String travellerNrc;
	private String travellerPhone;
	private String travellerEmail;
	private String request;

	private String paymentMethod;
	private boolean paymentSuccess;

	// If your route, date, price come from DB:
	private String departureCity;
	private String arrivalCity;
	private String departureDate;
	private String departureTime;
	private Integer pricePerSeat;
}
