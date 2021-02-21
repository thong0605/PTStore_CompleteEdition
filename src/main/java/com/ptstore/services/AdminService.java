package com.ptstore.services;

import java.util.Date;
import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.ptstore.models.Account;

public interface AdminService  {//extends UserDetailsService
	
	public Iterable<Account> findAll();
	
	public Account find(int id);
	
	public Account save(Account v);
	public boolean delete(int id);
	
	
	public Account checkUsername( String username);
	//find
	public List<Account> FindCustomer();
	public List<Account> FindVendor();
	//search 

			//customer
	public List<Account> searchUsernameCustomer(String keyword);
	public List<Account> searchEmailCustomer(String keyword);
	public List<Account> searchfullNameCustomer(String keyword);
	public List<Account> searchPhoneCustomer(String keyword);
			//vendor
	public List<Account> searchUsernameVendor(String keyword);
	public List<Account> searchEmailVendor(String keyword);
	public List<Account> searchfullNameVendor(String keyword);
	public List<Account> searchPhoneVEndor(String keyword);
	
	// count new Account Customer and Vendor
	public int ShownewAccount( int year,int month,int role);
	
	// search created Account
	public List<Account> searchAccountCreated(Date startDate,Date endDate,int role);
	
	
	
}
