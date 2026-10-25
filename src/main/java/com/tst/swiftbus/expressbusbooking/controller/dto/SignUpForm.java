package com.tst.swiftbus.expressbusbooking.controller.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
public class SignUpForm {

	@NotBlank(message = "Please enter your full name.")
	private String name;

	@NotBlank(message = "Please enter phone number.")
	private String phone;

	@Email(message = "Please enter a valid email.")
	@NotBlank(message = "Please enter email for log in.")
	private String email;

	@NotBlank(message = "Please enter NRC Region.")
	private String nrcRegion;

	@NotBlank(message = "Please enter NRC Township.")
	private String nrcTownship;

	@NotBlank(message = "Please enter NRC Type.")
	private String nrcType;

	@NotBlank(message = "Please enter NRC Number.")
	private String nrcNumber;

	@NotBlank(message = "Please enter password.")
	private String password;

	@NotBlank(message = "Please confirm your password.")
	private String repeatPassword;
}
