package com.tst.swiftbus.expressbusbooking.model.entity;

import java.math.BigDecimal;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "bus_route")
public class BusRoute {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "route_id")
	private Integer routeId;

	@Column(name = "start_location", nullable = false, length = 100)
	private String startLocation;

	@Column(name = "end_location", nullable = false, length = 100)
	private String endLocation;

	@Column(name = "distance", nullable = false, precision = 10, scale = 2)
	private BigDecimal distance;

	// One route can have many buses
	@OneToMany(mappedBy = "route", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Bus> buses;
}
