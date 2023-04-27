package com.java.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java.entity.Users;

public interface UserRepo extends JpaRepository<Users, Integer> {

	public Users findByUsername(String username);
}
