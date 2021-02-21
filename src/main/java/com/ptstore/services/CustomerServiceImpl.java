package com.ptstore.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ptstore.models.Account;
import com.ptstore.repositories.CustomerRepository;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	@Override
	public Iterable<Account> findAll() {
		return customerRepository.findAll();
	}

	@Override
	public Account find(int id) {
		return customerRepository.findById(id).get();
	}

	@Override
	public Account save(Account customer) {
		return customerRepository.save(customer);
	}

	@Override
	public boolean delete(int id) {
		try {
			customerRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public Account findByUsername(String username) {
		return customerRepository.findByUsername(username);
	}

	@Override
	public Account findByEmail(String email) {
		return customerRepository.findByEmail(email);
	}

	@Override
	public Account findByFullname(String fullname) {
		return customerRepository.findByFullname(fullname);
	}

	@Override
	public Account login(String username, String password) {
		return customerRepository.login(username, password);
	}

	@Override
	public List<Account> searchByVendor(String keyword) {
		return customerRepository.searchByVendor(keyword);
	}

//	@Override
//	public UserDetails loadUserByUsername(String username) {
//		Customer customer = customerRepository.findByUsername(username);
//		if (customer != null) {
//			throw new UsernameNotFoundException("Username not found" + username);
//		}
//		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//		authorities.add(new SimpleGrantedAuthority(customer.getRole().getRole()));
//		return new User(customer.getUsername(), customer.getPassword(), authorities);
//	}

}