package com.tst.swiftbus.expressbusbooking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tst.swiftbus.expressbusbooking.model.repo.BusSeatRepo;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/seat")
public class SeatController {

	private final BusSeatRepo seatRepo;

}
