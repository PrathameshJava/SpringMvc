package com.java.service;

import java.util.Arrays;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.java.entity.Users;
import com.java.repository.UserRepo;

@Service
public class UserService implements UserDetailsService {

	Logger logger = Logger.getLogger(UserService.class);

	@Autowired
	private UserRepo userRepo;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Users user = userRepo.findByUsername(username);
		GrantedAuthority authority = new SimpleGrantedAuthority(user.getRole());
		logger.info(user.getUsername());
		logger.info(user.getPassword());
		User user1 = new User(user.getUsername(), user.getPassword(), Arrays.asList(authority));
		UserDetails details = (UserDetails) user1;
		return details;
	}

}
