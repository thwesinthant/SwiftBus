package com.tst.swiftbus.expressbusbooking.model.entity;

import com.tst.swiftbus.expressbusbooking.model.entity.consts.Gender;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@Entity
@EqualsAndHashCode(callSuper = false)
public class Member extends AbstractEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;

	@OneToOne(optional = false)
	private Account account;

	@Column(nullable = false)
	private String name;

	@Column(nullable = false)
	private String email;

	@Column(nullable = false)
	private String phone;

	private String nrcRegion;
	private String nrcTownship;
	private String nrcType;
	private String nrcNumber;

	@Enumerated(EnumType.STRING)
	private Gender gender;
	private String profileImage;

}