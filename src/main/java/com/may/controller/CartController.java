package com.may.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.may.bean.Cart;
import com.may.dao.AccountDAO;
import com.may.dao.OrderDAO;
import com.may.dao.OrderDetailDAO;
import com.may.dao.ProductDAO;
import com.may.entity.Account;
import com.may.entity.Order;
import com.may.entity.OrderDetail;
import com.may.service.CartService;
import com.may.service.SessionService;


@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired CartService cart;
	@Autowired SessionService session;
	@Autowired AccountDAO accountDao;
	@Autowired OrderDetailDAO dao;
	@Autowired ProductDAO productDao;
	@Autowired OrderDAO orderDao;

	@GetMapping
	public String cart(Model model) {
		double sum = cart.getAmount();
		model.addAttribute("tong", sum);
		model.addAttribute("cart", cart);
		return "cart/index";
	}

	@RequestMapping("add/{id}")
	public String add(Model model, @PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/cart";
	}

	@RequestMapping("remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart";
	}

	@RequestMapping("update/{id}")
	public String update(@PathVariable("id") Integer id, 
						 @RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart";
	}

	@RequestMapping("clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart";
	}

	@RequestMapping("save")
	public String save(Model model) {
		String username = session.get("username");
		Account currentAcc = null;
		if (accountDao.findById(username).isPresent()) {
			currentAcc = accountDao.findById(username).get();
			Order ord = new Order();
			ord.setAccount(currentAcc);
			ord.setCreateDate(new Date());
			ord.setAddress("Ho Chi Minh");
			List<OrderDetail> details = new ArrayList<>();
			for (Cart item : cart.getItems()) {
				OrderDetail od = new OrderDetail();
				od.setOrder(ord);
				productDao.findById(item.getId()).ifPresent(p->{
					od.setProduct(p);
				});
				od.setPrice(item.getPrice());
				od.setQuantity(item.getQuantity());
				details.add(od);
			}
			ord.setOrderDetails(details);
			orderDao.save(ord);
			cart.clear();
		}else {
			return "redirect:/login";
		}
		return "redirect:/cart";
	}
}
