package com.java.service;

import java.io.IOException;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import com.java.entity.Product;
import com.java.exception.ResourceNotFoundException;

public interface ProductServices {

	public Product addProduct(Product product);

	public Product updateProduct(int product_ID) throws ResourceNotFoundException;

	public Product searchProduct(String productname);

	public void deleteProduct(int product_ID) throws ResourceNotFoundException;

	public List<Product> getAll();
	
	public Product getByid(int id);
	
	public Page<Product> getAllProduct(int id,Pageable pageable);

}
