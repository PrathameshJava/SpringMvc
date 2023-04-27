package com.java.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.java.entity.Product;

@Repository
public interface ProductDao extends JpaRepository<Product, Integer> {

	public Product findByName(String name);

   public Page<Product> findById(int id,Pageable pageable);
    
   
   
}
