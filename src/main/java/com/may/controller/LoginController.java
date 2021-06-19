package com.may.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.may.dao.ProductDAO;
import com.may.entity.Account;
import com.may.entity.LoginForm;
import com.may.entity.Product;
import com.may.entity.UserResponse;
import com.may.service.SessionService;
import com.may.service.userServicefolder.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;
	@Autowired
	ProductDAO dao;
	@Autowired
	SessionService sessionService;

	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView view = new ModelAndView("login");
		Account validatedAccount = sessionService.get("login");
		if (validatedAccount != null) {
			sessionService.set("login", validatedAccount);
			view.setViewName("user/index");
			view.addObject("userLogined", validatedAccount);
			List<Product> items = dao.findAll(); // truy van tat ca
			view.addObject("items", items);

		}
		return view;
	}

	@RequestMapping("/logout")
	public ModelAndView logout() {
		ModelAndView view = new ModelAndView("login");
		Account validatedAccount = sessionService.get("login");
		if (validatedAccount != null) {
			sessionService.remove("login");
			view.setViewName("user/index");
		}
		return view;
	}

	@RequestMapping(value = "/login/auth", method = RequestMethod.POST)
	public @ResponseBody UserResponse loginAuth(@RequestBody LoginForm form) {
		if (sessionService.get("login") == null) {
			try {
				Account validatedAccount = userService.getUserById(form.getUserName(), form.getPassword());
				if (validatedAccount != null) {

					sessionService.set("login", validatedAccount);
					return new UserResponse(true, "ok", validatedAccount);
//					view.setViewName("user/index");
//					view.addObject("userLogined", validatedAccount);
				}
			} catch (Exception e) {
				return new UserResponse(false, "error", null);
			}
		} else {
			return new UserResponse(true, "user/index", null);
		}
		return new UserResponse(false, "user/Login", null);
	}
		
	
//	@RequestMapping(value = "/login/auth/cc", method = RequestMethod.POST)
//	public @ResponseBody String loginAuth(@RequestBody List<purchasedDTO> asd) {
//		return asd.get(0).getId();
//	}
	
	
	@RequestMapping("/pageRedirect")
	public ModelAndView pageRoute(@RequestParam String page, HttpServletRequest request) {
		ModelAndView view = new ModelAndView(request.getRequestURL().append("/" + page).toString());
		view.addObject("userLogined", sessionService.get("login"));
		return view;
	}

}