package com.prv.pjt.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class FailureLoginHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println(e.getClass().getName());
		if ("org.springframework.security.authentication.BadCredentialsException".equals(e.getClass().getName())) {
			response.sendRedirect("/login.do?error=bad");
		} else if (("org.springframework.security.authentication.InternalAuthenticationServiceException".equals(e.getClass().getName())) 
				    || "com.mysql.jdbc.exceptions.jdbc4.CommunicationsException".equals(e.getClass().getName())) {
			response.sendRedirect("/login.do?error=db");
		} else {
			response.sendRedirect("/login.do?error=unknown");
		}
		
		/*
org.springframework.security.authentication.InternalAuthenticationServiceException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure

org.springframework.security.authentication.BadCredentialsException: Bad credentials
		 * */

	}

}
