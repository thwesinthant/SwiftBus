/*
 * package com.tst.expressbooking.service;
 * 
 * import java.io.IOException;
 * 
 * import org.springframework.security.core.Authentication; import
 * org.springframework.security.web.authentication.AuthenticationSuccessHandler;
 * 
 * import com.tst.expressbooking.model.entity.Account; import
 * com.tst.expressbooking.model.entity.consts.Role;
 * 
 * import jakarta.servlet.ServletException; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse;
 * 
 * public class LoginSuccessHandler implements AuthenticationSuccessHandler {
 * 
 * @Override public void onAuthenticationSuccess(HttpServletRequest request,
 * HttpServletResponse response, Authentication authentication) throws
 * IOException, ServletException { Account account = (Account)
 * authentication.getPrincipal();
 * 
 * if (account.getRole() == Role.ADMIN) { response.sendRedirect("/admin/home");
 * } else { response.sendRedirect("/member/home"); } } }
 */