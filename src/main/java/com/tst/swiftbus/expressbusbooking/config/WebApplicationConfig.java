
package com.tst.swiftbus.expressbusbooking.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebApplicationConfig implements WebMvcConfigurer {

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		// Redirect root to /signin
		registry.addRedirectViewController("/", "/signin");

		// Map /signin to signin.jsp
		registry.addViewController("/signin").setViewName("anonymous/signin");

		// Map /admin/home to admin/home.jsp
		registry.addViewController("/admin/home").setViewName("admin/home");

		// (Optional) Map /member/home to member/home.jsp
		registry.addViewController("/member/home").setViewName("member/home");
	}
}