package com.may.controller.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.may.dao.CategoryDAO;
import com.may.dao.ProductDAO;
import com.may.entity.Category;
import com.may.entity.Product;

@Controller
@RequestMapping("admin")
public class AdminProductController {
	@Autowired ProductDAO dao;
	@Autowired CategoryDAO cateDao;
	@GetMapping("product")
	public String index(Model model) {
		Product item = new Product();
		List<Product> items = dao.findAll();
		List<Category> cateItem = cateDao.findAll();
		model.addAttribute("items", items);
		model.addAttribute("item", item);
		model.addAttribute("cateItem", cateItem);
		return "admin/product";
	}
	@RequestMapping("/product/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		//3. lấy item dựa vào id
		Product item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Product> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/product"; // view trang index
	}

	
	@RequestMapping("/product/create")
	public String create(Product item) {
		// thêm 1 danh mục mới
		dao.save(item);
		return "redirect:/admin/product";
	}

	@RequestMapping("/product/update")
	public String update(Product item) {
		// cập nhật 
		dao.save(item);
		return "redirect:/admin/product/edit/" + item.getId();
	}

	@RequestMapping("/product/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		//5. xóa danh mục dựa vào id
		dao.deleteById(id);
		return "redirect:/admin/product";
	}
	
	@ModelAttribute("available")
	public Map<Boolean, String> getActived() {
		// map ở đây là lưu trữ dữ liệu theo cặp key và value
		Map<Boolean, String> map = new HashMap<>();
		// key = true,false value = male, female
		map.put(false, "Offline");
		map.put(true, "Online");
		return map;
	}
}
