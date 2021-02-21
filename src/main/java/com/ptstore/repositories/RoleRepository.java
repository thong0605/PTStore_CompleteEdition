package com.ptstore.repositories;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Role;

@Repository("roleRepository")
public interface RoleRepository extends CrudRepository<Role, Integer> {
	
}
