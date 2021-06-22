package com.may.controller;

import com.may.dao.ProductDAO;
import com.may.entity.Account;
import com.may.entity.Product;
import com.may.service.SessionService;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class HomeController {
	@Autowired
	ProductDAO dao;
	@Autowired
	SessionService sessionService;
	

	@Autowired
	SessionService session;

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
	public String home() {
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
	
	
	@RequestMapping("/product/search-and-page")
	public String searchAndPage(Model model, 
			@RequestParam("keywords") Optional<String> kw,
			@RequestParam("p") Optional<Integer> p) {
		String keywords = kw.orElse(session.get("keywords", ""));
		session.set("keywords", keywords);
		Pageable pageable = PageRequest.of(p.orElse(0), 5);
		//Page<Product> page = dao.findByKeywords("%"+keywords+"%", pageable);
		Page<Product> page = dao.findAllByNameLike(keywords, pageable);
		model.addAttribute("page", page);
		return "user/product";
	}
    // nè code này đúng k search theo tên sản phẩm
	
//	@GetMapping("resources/{path}")
//	public String getResource(@PathVariable("path") String path) {	
//		return path;
//	}

}
