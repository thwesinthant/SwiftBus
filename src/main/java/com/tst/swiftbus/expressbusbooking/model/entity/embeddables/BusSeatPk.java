package com.tst.swiftbus.expressbusbooking.model.entity.embeddables;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
@AllArgsConstructor
@Embeddable
public class BusSeatPk implements Serializable {

	private static final long serialVersionUID = 1L;

	@Column(name = "bus_no", nullable = false, length = 20)
	private String busNo;

	@Column(name = "seat_no", nullable = false)
	private int seatNo;

}
