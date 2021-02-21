package com.ptstore.services;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.ptstore.models.Account;

public interface AccountService extends UserDetailsService {
	
	public Iterable<Account> findAll();
	
	public Account find(int id);
	
	public boolean save(Account v);

	public Account findByUsername(String username);
	public Account findByUsername2(String username);
	public Account findByPassword(int id);
	
	public UserDetails loadUserByUsername(String username);
	
	
}
