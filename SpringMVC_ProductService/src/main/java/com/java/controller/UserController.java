package com.java.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.java.entity.Users;

@Controller
public class UserController {

	@RequestMapping("/register")
	public String userReg() {
		System.out.println("This is registration");
		return "registration";
	}

	@RequestMapping(path="/login" )
	public String authentication() {
		return "login";
	}

	@RequestMapping(path = "/product", method = RequestMethod.POST)
	public String userProfile(@ModelAttribute Users user, Model model) {

		return "add-product";

	}

	@GetMapping("/secured/login")
	public Principal login(Principal principal) {
		return principal;
	}
}
