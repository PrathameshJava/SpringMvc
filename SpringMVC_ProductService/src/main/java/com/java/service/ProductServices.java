package com.java.service;

import java.util.List;

import com.java.entity.Product;
import com.java.exception.ResourceNotFoundException;

public interface ProductServices {

	public Product addProduct(Product product);

	public Product updateProduct(int product_ID) throws ResourceNotFoundException;

	public Product searchProduct(String productname);

	public void deleteProduct(int product_ID) throws ResourceNotFoundException;

	public List<Product> getAll();
	
	public Product getByid(int id) throws ResourceNotFoundException;
	
	

}
