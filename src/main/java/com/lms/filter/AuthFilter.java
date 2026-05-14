package com.lms.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		
		String url = httpServletRequest.getRequestURI();
		HttpSession session = httpServletRequest.getSession();
		
		
		boolean loggedIn = (session != null && session.getAttribute("user") != null);
		boolean allowedUrl = url.equals(httpServletRequest.getContextPath() + "/") ||
				url.equals(httpServletRequest.getContextPath() + "/AuthenticationController");
		
		if(loggedIn || allowedUrl) {
			chain.doFilter(request, response);
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("jsp/login.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

}
