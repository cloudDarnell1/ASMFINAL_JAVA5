package com.may.service.userServicefolder;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.may.bean.Cart;
import com.may.dao.ProductDAO;
import com.may.entity.Product;
import com.may.service.CartService;

//1. phạm vi là session
@SessionScope
@Service
public class CartServiceImpl implements CartService{
	@Autowired ProductDAO dao;
	
	Map<Integer, Cart> map = new HashMap<Integer, Cart>();
	//Add
	@Override
	public Cart add(Integer id) {
		//kiểm trả có chưa
		Cart item = map.get(id);
		
		//Chưa có 
		if(item == null) {
			item = new Cart();
			Product p = new Product();
			
			List<Product> list = dao.findAll();
			
			//lấy ra sản phẩm dựa theo id
			p = list.stream()
					.filter(sp->sp.getId() == id)
					.collect(Collectors.toList())
					.get(0);
			item.setId(p.getId());
			item.setName(p.getName());
			item.setPrice(p.getPrice());
			item.setQuantity(1);
			//thêm vào giỏ hàng
			map.put(id, item);
		}else {
			//nếu đã có sản phẩm đó
			item.setQuantity(item.getQuantity() + 1);
		}
		return item;
	}
	
	//delete
	@Override
	public void remove(Integer id) {
		map.remove(id);
	}
	
	//update
	@Override
	public Cart update(Integer id, int quantity) {
		Cart item = map.get(id);
		item.setQuantity(quantity);
		return item;
	}
	
	//clear
	@Override
	public void clear() {
		map.clear();
	}
	
	//list sản phẩm
	@Override
	public Collection<Cart> getItems() {
		return map.values();
	}
	
	//Tổng số lượng sản phẩm
	@Override
	public int getCount() {
		return map.values().stream()
				.mapToInt(item -> item.getQuantity())
				.sum();
	}
	
	//Tổng tiền
	@Override
	public double getAmount() {
		return map.values().stream()
				.mapToDouble(item -> item.getPrice()*item.getQuantity())
				.sum();
	}
}
