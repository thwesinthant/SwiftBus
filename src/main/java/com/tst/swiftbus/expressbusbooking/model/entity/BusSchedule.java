package com.tst.swiftbus.expressbusbooking.model.entity;

import java.time.LocalDateTime;
import java.time.LocalTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "bus_schedule")
public class BusSchedule {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "schedule_id")
	private Integer scheduleId;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "bus_no", referencedColumnName = "bus_no", nullable = false)
	private Bus bus;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "route_id", referencedColumnName = "route_id", nullable = false)
	private BusRoute route;

	@Column(name = "available_seats")
	private Integer availableSeats;

	@Column(name = "departure_time", nullable = false)
	private LocalDateTime departureTime;

	@Column(name = "arrival_time", nullable = false)
	private LocalDateTime arrivalTime;

	@Column(name = "estimated_duration", nullable = false)
	private LocalTime estimatedDuration;

	@Column(name = "promo_code")
	private String promoCode;

}
