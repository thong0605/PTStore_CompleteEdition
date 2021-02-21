package com.ptstore.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ptstore.models.Account;
import com.ptstore.models.Role;
import com.ptstore.repositories.AccountRepository;

@Service("accountService")
public class AccountServiceImpl implements AccountService {
	
	@Autowired 
	private AccountRepository accountRepository;
	
	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll();
	}

	@Override
	public Account findByUsername(String username) {
		return accountRepository.findByUsername(username);
	}

	@Override
	public UserDetails loadUserByUsername(String username) {
		Account account = accountRepository.findByUsername(username);
		if(account == null) {
			throw new UsernameNotFoundException("Username not found as:"+ username);
		}
		
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(new SimpleGrantedAuthority(account.getRole().getName()));
		
		return new User(account.getUsername(), account.getPassword(), authorities);
	}

	@Override
	public boolean save(Account v) {
		try {
			accountRepository.save(v);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Account find(int id) {
		return accountRepository.findById(id).get();
	}

	@Override
	public Account findByUsername2(String username) {
		
		return accountRepository.findByUsername2(username);
	}

	@Override
	public Account findByPassword(int id) {
		return accountRepository.findByPassword(id);
	}
	

}
