package com.may.intercepptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.may.entity.Account;

public class LoginInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Object attribute = session.getAttribute("login");
		
		if (attribute == null) {
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
		
		return true;
	}

}
