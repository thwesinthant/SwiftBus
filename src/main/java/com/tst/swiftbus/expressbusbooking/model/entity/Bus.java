package com.tst.swiftbus.expressbusbooking.model.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "bus")
public class Bus {

	@Id
	@Column(name = "bus_no", nullable = false, length = 20)
	private String busNo;

	@Column(name = "bus_name", nullable = false, length = 100)
	private String busName;

	@Column(name = "image_url", length = 255)
	private String imageUrl;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "type_name", nullable = false)
	private BusType busType;

	// Many buses share one route
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "route_id", nullable = false)
	private BusRoute route;

	@OneToMany(mappedBy = "bus", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<BusSchedule> schedules;

	// One bus has many seats
	@OneToMany(mappedBy = "bus", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<BusSeat> seats;
}
