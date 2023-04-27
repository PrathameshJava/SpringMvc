package com.java.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Users {

	@Id
	@GeneratedValue
	private int id;

	private String username;

	private String password;

	private String actice;
	
	private String role;

	public Users(int id, String username, String password, String actice, String role) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.actice = actice;
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", actice=" + actice + ", role="
				+ role + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getActice() {
		return actice;
	}

	public void setActice(String actice) {
		this.actice = actice;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public Users() {
		super();

	}

}
