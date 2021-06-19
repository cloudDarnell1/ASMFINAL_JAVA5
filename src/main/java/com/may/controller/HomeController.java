package com.may.controller;

import java.util.List;

import com.may.constant.Constant;
import com.may.utils.PageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.may.service.SessionService;
import com.may.dao.ProductDAO;
import com.may.entity.Account;
import com.may.entity.Product;

@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
	ProductDAO dao;
	@Autowired
	SessionService sessionService;

//@RequestMapping("product/all")
////	@RequestMapping("/login")
//	public String sort(Model model) {		
//		List<Product> items = dao.findAll(); // truy van tat ca				
//		model.addAttribute("items", items);
//		return "user/index";	

//	}
	@GetMapping
	public ModelAndView getRoot() {		
		return new ModelAndView("redirect:/index.php");
	}
	@RequestMapping("index.php")
	public String home(Model model, @RequestParam(defaultValue = "1") Integer page) {

		PageRequest pageRequest = PageRequest.of(page-1, Constant.PRODUCT_PER_PAGE);

		Page<Product> items = dao.findAll(pageRequest); // chạy trang chủ
		model.addAttribute("items", items.getContent());
		model.addAttribute("pages", PageUtils.getPages(items.getTotalPages()));
		return "user/index";
	}

	@RequestMapping(value = "products_detal", method = RequestMethod.GET)
	public ModelAndView productdetail(@RequestParam String masp, ModelAndView model) {
		model.setViewName("/user/productdetail");
		Account ac = sessionService.get("login"); //
		if (ac == null) {
			model.setViewName("user/login");
			return model;
		}
		Product item = dao.findById(Integer.valueOf(masp)).get();
		// chạy trang điều hướng
		model.addObject("item", item);
		return model;

	}
	
//	@GetMapping("resources/{path}")
//	public String getResource(@PathVariable("path") String path) {	
//		return path;
//	}

}
