package com.tst.swiftbus.expressbusbooking.model.entity;

import java.math.BigDecimal;

import com.tst.swiftbus.expressbusbooking.model.entity.consts.BusCategory;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Data
@Table(name = "bus_type")
public class BusType {
	@Id
	@Column(name = "type_name", length = 50)
	private String typeName;

	@Enumerated(EnumType.STRING)
	@Column(nullable = false)
	private BusCategory category;

	@Column(nullable = false)
	private int capacity;

	@Column(nullable = false, precision = 15, scale = 2)
	private BigDecimal price;

}
