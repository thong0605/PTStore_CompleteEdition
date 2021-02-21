package com.ptstore.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Account;

@Repository("adminRepository")
public interface AdminRepository extends CrudRepository<Account, Integer> {
	
	//Admin
		@Query("from Account where username = :username and role = 1")
		public Account checkUsername(@Param("username") String username);

		// Customer
		@Query("from Account where status = true and role = 3 order by id desc")
		public List<Account> FindCustomer();

		@Query("from Account where username like %:keyword% and status = true and role = 3")
		public List<Account> searchUsernameCustomer(@Param("keyword") String keyword);

		@Query("from Account where email like %:keyword% and status = true and role = 3")
		public List<Account> searchEmailCustomer(@Param("keyword") String keyword);

		@Query("from Account where fullname like %:keyword% and status = true and role = 3")
		public List<Account> searchfullNameCustomer(@Param("keyword") String keyword);

		@Query("from Account where phone like %:keyword% and status = true and role = 3")
		public List<Account> searchPhoneCustomer(@Param("keyword") String keyword);

		// Vendor
		@Query("from Account where status = true and role = 2 order by id desc")
		public List<Account> FindVendor();

		@Query("from Account where username like %:keyword% and status = true and role = 2")
		public List<Account> searchUsernameVendor(@Param("keyword") String keyword);

		@Query("from Account where email like %:keyword% and status = true and role = 2")
		public List<Account> searchEmailVendor(@Param("keyword") String keyword);

		@Query("from Account where fullname like %:keyword% and status = true and role = 2")
		public List<Account> searchfullNameVendor(@Param("keyword") String keyword);

		@Query("from Account where phone like %:keyword% and status = true and role = 2")
		public List<Account> searchPhoneVendor(@Param("keyword") String keyword);

		// Count Account Customer and Vendor
		@Query(value = "select count(created) from Account where year(created) = :year and month(created) = :month and roleid = :role and status = true ", nativeQuery = true)
		public int ShownewAccount(@Param("year") int year, @Param("month") int month, @Param("role") int role);
		
		@Query("from Account where created between :startDate and :endDate and  roleid = :role and status = true ")
		public List<Account> searchAccountCreated(@Param("startDate") Date startDate, @Param("endDate") Date endDate, @Param("role") int role);
}
