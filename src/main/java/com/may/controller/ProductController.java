package com.may.controller;



import com.may.dao.ProductDAO;
import com.may.entity.Product;
import com.may.service.SessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;
import java.util.Optional;


@Controller
public class ProductController {

    @Autowired
    private ProductDAO productDAO;
    @Autowired
    SessionService session;

    @Autowired
	ProductDAO dao;
    @PostMapping("/products")
    public String findByPrice(@RequestBody Map<Object, Double> data, Model model) {

        if (!data.containsKey("from") || !data.containsKey("to")) {
            throw new RuntimeException("must contain \'from\' and \'to\'");
        }

        List<Product> result = productDAO.findByPriceBetween(data.get("from"), data.get("to"));

        model.addAttribute("items", result);

        return "user/product";
    }
	//-----------------------------------------

    
	
    
    
}