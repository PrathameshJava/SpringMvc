package com.java.controller;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.Product;
import com.java.service.ProductServices;
@Controller
public class a {

	@Autowired
	private ProductServices productServices;

	@GetMapping("/products1")
	public String listProducts(Model model, @RequestParam(defaultValue = "0") int page) {
		int pageSize = 10; // number of products per page
		List<Product> products = productServices.getAll();
		int totalProducts = products.size();
		int totalPages = (int) Math.ceil(totalProducts / (double) pageSize);

		List<Product> pageProducts = products.stream().skip(page * pageSize).limit(pageSize)
				.collect(Collectors.toList());

		model.addAttribute("products", pageProducts);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);

		return "list1";
	}

}
