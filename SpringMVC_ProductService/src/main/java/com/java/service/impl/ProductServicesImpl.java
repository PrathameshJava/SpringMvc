package com.java.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.entity.Product;
import com.java.exception.ResourceNotFoundException;
import com.java.repository.ProductDao;
import com.java.service.ProductServices;

@Service
public class ProductServicesImpl implements ProductServices {

	Logger logger = Logger.getLogger(ProductServicesImpl.class);

	@Autowired
	private ProductDao productDao;

	public List<Product> list = new ArrayList<Product>();

	@Override
	public Product addProduct(Product product) {
//		String path = null;
//		String name = file.getOriginalFilename();
//
//		String FilePath = path + File.separator + name;
//
//		File file1 = new File(path);
//		if (!file1.exists()) {
//			file1.mkdir();
//		}
//		Files.copy(file.getInputStream(), Paths.get(FilePath));
//
//		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
//		if (fileName.contains("..")) {
//			System.out.println("not a a valid file");
//		}
//		product.setImage(fileName);

		logger.info(product.getProductname());
		return productDao.save(product);
	}

	@Override
	public Product updateProduct(int product_ID) throws ResourceNotFoundException {

		return productDao.findById(product_ID)
				.orElseThrow(() -> new ResourceNotFoundException("No id found for this Parameter" + product_ID));

	}

	@Override
	public Product searchProduct(String productname) {

		return productDao.findByProductname(productname);
	}

	@Override
	public void deleteProduct(int product_ID) throws ResourceNotFoundException {
		productDao.deleteById(product_ID);

	}

	@Override
	public List<Product> getAll() {

		return productDao.findAll();
	}

	@Override
	public Product getByid(int id) throws ResourceNotFoundException {

		return productDao.findById(id)
				.orElseThrow(() -> new ResourceNotFoundException("No id found for this Parameter" + id));
	}


}
