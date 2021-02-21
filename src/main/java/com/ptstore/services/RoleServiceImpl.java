package com.ptstore.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptstore.models.Role;
import com.ptstore.repositories.RoleRepository;


@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleRepository roleRepository;
	
	@Override
	public Iterable<Role> findAll() {
		return roleRepository.findAll();
	}

	@Override
	public Role find(int id) {
		return roleRepository.findById(id).get();
	}

	@Override
	public Role save(Role role) {
		return roleRepository.save(role);
	}

	@Override
	public boolean delete(int id) {
		try {
			roleRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
	
	
}
