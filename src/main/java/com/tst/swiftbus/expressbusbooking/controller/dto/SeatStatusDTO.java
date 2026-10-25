
package com.tst.swiftbus.expressbusbooking.controller.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeatStatusDTO {

	@Min(value = 1, message = "Seat number must be at least 1")
	@Max(value = 100, message = "Seat number cannot exceed 100")
	private int seatNumber;

	private Boolean booked;
	private Boolean held;

	// True only when the current logged-in user owns this active hold.
	private Boolean heldByCurrentUser;
}
