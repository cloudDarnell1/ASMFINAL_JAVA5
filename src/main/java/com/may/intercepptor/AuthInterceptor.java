package com.may.intercepptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.may.entity.Account;

public class AuthInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Account account = (Account) session.getAttribute("login");
		if (!account.isAdmin()) {
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		
		return true;
	}

}
