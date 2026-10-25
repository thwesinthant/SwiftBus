package com.tst.swiftbus.expressbusbooking.model.entity;

import java.time.LocalDateTime;
import java.util.List;

import com.tst.swiftbus.expressbusbooking.model.entity.consts.BookingStatus;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "booking")
public class Booking {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	// Who booked it
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "member_id", nullable = false)
	private Member member;

	// For which trip
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "schedule_id", nullable = false)
	private BusSchedule schedule;

	// Booking timestamp
	@Column(nullable = false)
	private LocalDateTime bookingTime = LocalDateTime.now();

	// Booking status: CONFIRMED, CANCELLED, etc.
	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private BookingStatus status = BookingStatus.PENDING;

	// Total amount
	@Column(nullable = false)
	private Double totalPrice;

	// One booking can have many booked seats
	@OneToMany(mappedBy = "booking", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<BookedSeat> bookedSeats;
}
