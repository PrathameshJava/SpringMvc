package com.java.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.java.entity.Product;
import com.java.exception.ResourceNotFoundException;
import com.java.service.ProductServices;

@Controller
public class ProductControler {

	@Autowired
	private ProductServices productServices;

	@RequestMapping(path = "/saveproduct", method = RequestMethod.POST)
	public String addProduct(@ModelAttribute Product product, BindingResult result, Model model)   {

		if (result.hasErrors()) {
			return "addproduct";
		}
		productServices.addProduct(product);
		return "saveproduct";
/*      
        if (file.isEmpty()) {
            return "redirect:/uploadFailure";
        }
        
        // Save the file to disk
        String fileName = file.getOriginalFilename();
        File uploadedFile = new File("path/to/uploaded/files/" + fileName);
        try {
            file.transferTo(uploadedFile);
        } catch (IOException e) {
            return "redirect:/uploadFailure";
        }
        
        // Create and save the entity
        Entity entity = new Entity();
        entity.setName(name);
        entity.setFilePath(uploadedFile.getAbsolutePath());
        entityService.save(entity);
        
        return "redirect:/uploadSuccess";
    }*/
	}

	@RequestMapping("/list")
	public String listProduct( Model model) {
	
		List<Product> products = productServices.getAll();
	
		model.addAttribute("products", products);

		return "productslist";
	}

	@RequestMapping("/update/{id}")
	public String updateProduct(@PathVariable("id") int product_ID, Model model)
			throws ResourceNotFoundException {
		Product product = productServices.updateProduct(product_ID);
		model.addAttribute("product", product);

		return "updateProduct";
	}

	@RequestMapping(path = "/update/saveproduct", method = RequestMethod.POST)
	public String editedProduct(@ModelAttribute Product product, Model model) {
		productServices.addProduct(product);

		return "editProduct";
	}

	@RequestMapping(path="/search/{name}",method=RequestMethod.GET)
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
