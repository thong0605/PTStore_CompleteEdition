package com.ptstore.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.ptstore.models.Account;
import com.ptstore.models.Brand;
import com.ptstore.repositories.AdminRepository;
import com.ptstore.repositories.BrandRepository;

@Service("adminService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminRepository accountRepository;

	@Override
	public Iterable<Account> findAll() {
		return accountRepository.findAll();
	}
  
	@Override
	public Account find(int id) {
		return accountRepository.findById(id).get();
	}

	@Override
	public Account save(Account Account) {
		return accountRepository.save(Account);
	}

	@Override
	public boolean delete(int id) {
		try {
			accountRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}



	@Override
	public Account checkUsername(String username) {
		
		return accountRepository.checkUsername(username);
	}

	@Override
	public List<Account> FindCustomer() {
		return accountRepository.FindCustomer();
	}

	@Override
	public List<Account> FindVendor() {
		return accountRepository.FindVendor();
	}

	@Override
	public List<Account> searchUsernameCustomer(String keyword) {
		return accountRepository.searchUsernameCustomer(keyword);
	}

	@Override
	public List<Account> searchUsernameVendor(String keyword) {
		// TODO Auto-generated method stub
		return accountRepository.searchUsernameVendor(keyword);
	}

	@Override
	public List<Account> searchEmailCustomer(String keyword) {
		// TODO Auto-generated method stub
		return accountRepository.searchEmailCustomer(keyword);
	}

	@Override
	public List<Account> searchfullNameCustomer(String keyword) {
		// TODO Auto-generated method stub
		return accountRepository.searchfullNameCustomer(keyword);
	}

	@Override
	public List<Account> searchPhoneCustomer(String keyword) {
		// TODO Auto-generated method stub
		return accountRepository.searchPhoneCustomer(keyword);
	}

	@Override
	public List<Account> searchEmailVendor(String keyword) {
		// TODO Auto-generated method stub
		return accountRepository.searchEmailVendor(keyword);
	}

	@Override
	public List<Account> searchfullNameVendor(String keyword) {
		// TODO Auto-generated method stub
		return accountRepository.searchfullNameVendor(keyword);
	}

	@Override
	public List<Account> searchPhoneVEndor(String keyword) {
		// TODO Auto-generated method stub
		return accountRepository.searchPhoneVendor(keyword);
	}

	@Override
	public int ShownewAccount(int year, int month, int role) {
		return accountRepository.ShownewAccount(year, month, role);
	}

	@Override
	public List<Account> searchAccountCreated(Date startDate, Date endDate, int role) {
		// TODO Auto-generated method stub
		return accountRepository.searchAccountCreated(startDate, endDate, role);
	}

//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		// TODO Auto-generated method stub
//		return null;
//	}



}