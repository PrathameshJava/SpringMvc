package com.java.controller;

import java.util.List;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.Product;
import com.java.exception.ResourceNotFoundException;
import com.java.repository.ProductDao;
import com.java.service.ProductServices;

@Controller
public class ProductControler {

	Logger logger = Logger.getLogger(ProductControler.class);

	@Autowired
	private ProductServices productServices;
	@Autowired
	private ProductDao productDao;

	@RequestMapping(path = "/saveproduct", method = RequestMethod.POST)
	public String addProduct(@Valid @ModelAttribute Product product, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "addproduct";
		}
		productServices.addProduct(product);
		return "saveproduct";

	}

	@RequestMapping(path = "/product", method = RequestMethod.POST)
	public String userProfile(@ModelAttribute Product product, Model model) {

		return "addproduct";

	}


	@RequestMapping("/list")
	public String listProduct(Model model, @RequestParam(defaultValue = "0") int page) {

		List<Product> products = productServices.getAll();
		Page<Product> productPage = productDao.findAll(PageRequest.of(page, 5));
		model.addAttribute("products", productPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", productPage.getTotalPages());
		model.addAttribute("products", products);

		return "productslist";
	}

	@RequestMapping("/update/{id}")
	public String updateProduct(@PathVariable("id") int product_ID, Model model) throws ResourceNotFoundException {

		Product product = productServices.updateProduct(product_ID);
		model.addAttribute("product", product);

		return "updateProduct";
	}

	@RequestMapping(path = "/update/saveproduct", method = RequestMethod.POST)
	public String editedProduct(@ModelAttribute Product product, Model model) {
		productServices.addProduct(product);

		return "editProduct";
	}

	@RequestMapping(path = "/search", method = RequestMethod.GET)
	public String getproduct(@PathVariable("name") String productname, Model model) {

		Product product = productServices.searchProduct(productname);
		logger.info(product.toString());

		model.addAttribute("product", product);
		return "productinfo";
	}

	@RequestMapping("/delete/{id}")
	public String deleteProduct(@PathVariable("id") int product_ID) throws ResourceNotFoundException {
		productServices.deleteProduct(product_ID);

		return "redirect:/";
	}

}
