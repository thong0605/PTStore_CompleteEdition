package com.ptstore.repositories;


import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Account;

@Repository("accountRepository")
public interface AccountRepository extends CrudRepository<Account, Integer> {
	
	@Query("from Account where username = :username and activated = true and status = true")
	public Account findByUsername(@Param("username") String username);
	
	@Query("from Account where id = :id and activated = true and status = true")
	public Account findByPassword(@Param("id") int id);
	
	@Query( value = "select * from account where username = :username and roleId = 2 and activated = true and status = true", nativeQuery = true)
	public Account findByUsername2(@Param("username") String username);
}
