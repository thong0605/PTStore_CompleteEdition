package com.ptstore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Account;

@Repository("customerRepository")
public interface CustomerRepository extends CrudRepository<Account, Integer> {
	
	// @Query("select c from Customer c where c.username = :username or c.gmail =
		// :gmail")
		@Query("select c from Account c where c.activated = true and c.status = true and c.username = :username")
		public Account findByUsername(@Param("username") String username);

		@Query("select c from Account c where c.activated = true and c.status = true and c.email = :email")
		public Account findByEmail(@Param("email") String email);

		@Query("select c from Account c where c.activated = true and c.status = true and c.fullname = :fullname")
		public Account findByFullname(@Param("fullname") String fullname);

		@Query("select c from Account c where c.activated = true and c.status = true and c.username = :username and c.password = :password")
		public Account login(@Param("username") String username, @Param("password") String password);

		@Query("select v from Account v where v.activated = true and v.status = true and v.role = 2 and v.fullname like %:keyword%")
		public List<Account> searchByVendor(@Param("keyword") String keyword);
}
