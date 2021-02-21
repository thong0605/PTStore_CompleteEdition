package com.ptstore.services;

import java.util.List;

import org.springframework.data.repository.query.Param;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;

import com.ptstore.models.Account;

public interface CustomerService {
	//extends UserDetailsService 
		public Iterable<Account> findAll();

		public Account find(int id);

		public Account save(Account customer);

		public boolean delete(int id);

		public Account findByUsername(String username);

		public Account findByEmail(String email);

		public Account findByFullname(String fullname);

		public Account login(String username, String password);

		// search product
		public List<Account> searchByVendor(String keyword);

		// public UserDetails loadUserByUsername(String username);
}