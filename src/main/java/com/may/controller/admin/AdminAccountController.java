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
import com.may.dao.AccountDAO;
import com.may.entity.Account;

@Controller
@RequestMapping("admin")
public class AdminAccountController {
@Autowired AccountDAO dao;
	
	@GetMapping("account")
	public String index(Model model) {
		Account item = new Account();
		List<Account> items = dao.findAll();
		model.addAttribute("item", item);
		model.addAttribute("items", items);
		return "admin/account";
	}
	@RequestMapping("/account/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		//3. lấy item dựa vào id
		Account item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Account> items = dao.findAll();
		model.addAttribute("items", items);
		return "admin/account"; // view trang index
	}

	
	@RequestMapping("/account/create")
	public String create(Account item) {
		// thêm 1 danh mục mới
		dao.save(item);
		return "redirect:/admin/account";
	}

	@RequestMapping("/account/update")
	public String update(Account item) {
		// cập nhật 
		dao.save(item);
		return "redirect:/admin/account/edit/" + item.getUsername();
	}

	@RequestMapping("/account/delete/{id}")
	public String delete(@PathVariable("id") String id) {
		//5. xóa danh mục dựa vào id
		dao.deleteById(id);
		return "redirect:/admin/account";
	}
	@ModelAttribute("activated")
	public Map<Boolean, String> getActivated() {
		// map ở đây là lưu trữ dữ liệu theo cặp key và value
		Map<Boolean, String> map = new HashMap<>();
		// key = true,false value = male, female
		map.put(false, "Offline");
		map.put(true, "Online");
		return map;
	}
	@ModelAttribute("admin")
	public Map<Boolean, String> getAdmin() {
		// map ở đây là lưu trữ dữ liệu theo cặp key và value
		Map<Boolean, String> map = new HashMap<>();
		// key = true,false value = male, female
		map.put(false, "Offline");
		map.put(true, "Online");
		return map;
	}
}
