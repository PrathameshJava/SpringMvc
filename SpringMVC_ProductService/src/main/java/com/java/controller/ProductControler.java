package com.java.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.entity.Product;
import com.java.exception.ResourceNotFoundException;
import com.java.service.ProductServices;

@Controller
public class ProductControler {

	@Autowired
	private ProductServices productServices;

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
	public String listProduct(Model model) {

		List<Product> products = productServices.getAll();

		model.addAttribute("products", products);

		return "productslist";
	}

	@RequestMapping("/update/{id}")
	public String updateProduct(@PathVariable("id") int product_ID, Model model, BindingResult result)
			throws ResourceNotFoundException {
		if (result.hasErrors()) {
			return "redirect:/";
		}

		Product product = productServices.updateProduct(product_ID);
		model.addAttribute("product", product);

		return "redirect/updateProduct";
	}

	@RequestMapping(path = "/update/saveproduct", method = RequestMethod.POST)
	public String editedProduct(@ModelAttribute Product product, Model model) {
		productServices.addProduct(product);

		return "editProduct";
	}

	@RequestMapping(path = "/search/{name}", method = RequestMethod.GET)
	public String getproduct(@PathVariable("name") String productname, Model model) {

		Product product = productServices.searchProduct(productname);
		model.addAttribute("product", product);
		return "productinfo";
	}

	@RequestMapping("/delete/{id}")
	public String deleteProduct(@PathVariable("id") int product_ID) throws ResourceNotFoundException {
		productServices.deleteProduct(product_ID);

		return "redirect:/";
	}

}
