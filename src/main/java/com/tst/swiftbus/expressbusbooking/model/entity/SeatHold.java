package com.tst.swiftbus.expressbusbooking.model.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.Data;

@Entity
@Data
@Table(name = "seat_hold", uniqueConstraints = @UniqueConstraint(name = "uk_seat_hold_bus_seat_schedule", columnNames = {
		"bus_no", "seat_no", "schedule_id" }))
public class SeatHold {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "bus_no", nullable = false, length = 20)
	private String busNo;

	@Column(name = "seat_no", nullable = false)
	private Integer seatNo;

	@Column(name = "schedule_id", nullable = false)
	private Integer scheduleId;

	@Column(name = "held_by_account_id", nullable = false)
	private Long heldByAccountId;

	@Column(name = "hold_until", nullable = false)
	private LocalDateTime holdUntil;
}