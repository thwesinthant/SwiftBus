package com.tst.swiftbus.expressbusbooking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	/*
	 * @GetMapping("/signin") public String showLoginPage() { return "signin"; }
	 */

	/*
	 * @GetMapping("/signup") public String testPage() { return "signup"; // Try to
	 * load login.jsp directly }
	 */

	@GetMapping("/home")
	public String showHomePage() {
		return "home"; // home.jsp or home.html
	}

	@GetMapping("/index")
	public String index() {
		return "index";
	}

	@GetMapping("/searchdetail")
	public String searchdetail() {

		return "searchdetail"; // This means /WEB-INF/views/searchdetail.jsp
	}

	@GetMapping("/booking")
	public String booking() {

		return "booking"; // This means /WEB-INF/views/searchdetail.jsp
	}

	@GetMapping("/bookingconfirm")
	public String bookingconfirm() {

		return "bookingconfirm"; // This means /WEB-INF/views/searchdetail.jsp
	}

	@GetMapping("/profile")
	public String profile() {

		return "profile"; // This means /WEB-INF/views/searchdetail.jsp
	}
}
