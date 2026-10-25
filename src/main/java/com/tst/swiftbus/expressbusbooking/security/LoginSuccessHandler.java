package com.tst.swiftbus.expressbusbooking.security;

import java.io.IOException;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		var contextPath = request.getContextPath();
		var authority = authentication.getAuthorities().stream().map(a -> a.getAuthority()).findFirst().orElse("");

		if (authority.equals("ROLE_ADMIN")) {
			response.sendRedirect(contextPath + "/admin/home");
		} else if (authority.equals("ROLE_USER")) {
			response.sendRedirect(contextPath + "/member/home");
		} else {
			response.sendRedirect(contextPath + "/signin?error=unauthorized");
		}
	}

}