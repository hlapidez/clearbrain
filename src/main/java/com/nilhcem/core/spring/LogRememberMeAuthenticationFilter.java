package com.nilhcem.core.spring;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.rememberme.RememberMeAuthenticationFilter;

/**
 * Custom RememberMeAuthenticationFilter bean for SpringSecurity to log information once authentication is successful through remember me.
 * 
 * @author Nilhcem
 * @since 1.0
 */
public class LogRememberMeAuthenticationFilter extends RememberMeAuthenticationFilter {
	private Logger logger = LoggerFactory.getLogger(LogRememberMeAuthenticationFilter.class);

	/**
	 * Log after successful authentication through remember me.
	 * 
	 * @param request
	 * @param response
	 * @param authResult
	 */
	@Override
	protected void onSuccessfulAuthentication(HttpServletRequest request, HttpServletResponse response, Authentication authResult) {
		super.onSuccessfulAuthentication(request, response, authResult);
		logger.info("{} has logged-in through 'remember me'", authResult.getName());
	}
}