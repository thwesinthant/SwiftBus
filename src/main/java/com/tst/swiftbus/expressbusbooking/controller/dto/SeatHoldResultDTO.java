package com.tst.swiftbus.expressbusbooking.controller.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SeatHoldResultDTO {
	private boolean success;
	private List<Integer> failedSeatNos;
}