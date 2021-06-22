package com.may.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String login() {
		Account ac = sessionService.get("login");
		
		if (ac == null || !ac.isAdmin()) {
			return "user/login";
		}
		
		return "redirect:/admin";
		
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
	public String loginAuth(LoginForm form, RedirectAttributes request) {
		Account userById = userService.getUserById(form.getUserName(), form.getPassword());
		
		
		if (userById == null) {
			request.addFlashAttribute("notify", "username or password sai!");
			return "redirect:/login";
		}
		
		if (!userById.isActivated()) {
			return "redirect:/login";
		}
		
		sessionService.set("login", userById);
		
		if (userById.isAdmin()) {
			return "redirect:/admin";
		}
		
		return "redirect:/index.php";
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