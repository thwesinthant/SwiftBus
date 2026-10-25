package com.tst.swiftbus.expressbusbooking.model.entity;

import java.time.LocalDateTime;
import java.util.List;

import com.tst.swiftbus.expressbusbooking.model.entity.consts.SeatStatus;
import com.tst.swiftbus.expressbusbooking.model.entity.embeddables.BusSeatPk;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinColumns;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.MapsId;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "bus_seat")
public class BusSeat {

	@EmbeddedId
	private BusSeatPk id;

	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("busNo")
	@JoinColumn(name = "bus_no", nullable = false)
	private Bus bus;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private SeatStatus status = SeatStatus.AVAILABLE;

	@Column(name = "hold_until")
	private LocalDateTime holdUntil;

	@OneToMany(mappedBy = "busSeat")
	private List<BookedSeat> bookedSeats;

	@OneToMany
	@JoinColumns({ @JoinColumn(name = "bus_no", referencedColumnName = "bus_no", insertable = false, updatable = false),
			@JoinColumn(name = "seat_no", referencedColumnName = "seat_no", insertable = false, updatable = false) })
	private List<SeatHold> holds;
}
