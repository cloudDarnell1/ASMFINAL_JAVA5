package com.may.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.may.dao.CategoryDAO;
import com.may.entity.Category;


@Controller
@RequestMapping("admin")
public class AdminCategoryController {
@Autowired CategoryDAO dao;
	
	@GetMapping("category")
	public String index(Model model) {
		Category category = new Category();
		List<Category> items = dao.findAll();
		model.addAttribute("category", category);
		model.addAttribute("items", items);
		return "admin/category";
	}
	
	@RequestMapping("/category/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		//3. lấy item dựa vào id
		Category category = dao.findById(id).get();
		model.addAttribute("category", category);
		List<Category> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/category"; // view trang index
	}

	
	@RequestMapping("/category/create")
	public String create(Category category) {
		// thêm 1 danh mục mới
		dao.save(category);
		return "redirect:/admin/category";
	}

	@RequestMapping("/category/update")
	public String update(Category category) {
		// cập nhật 
		dao.save(category);
		return "redirect:/admin/category/edit/" + category.getId();
	}

	@RequestMapping("/category/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		//5. xóa danh mục dựa vào id
		dao.deleteById(id);
		return "redirect:/admin/category";
	}
}
