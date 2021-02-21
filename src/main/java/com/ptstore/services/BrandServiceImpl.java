package com.ptstore.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptstore.models.Brand;
import com.ptstore.repositories.BrandRepository;


@Service("brandService")
public class BrandServiceImpl implements BrandService{

	@Autowired
	private BrandRepository brandRepository;
	
	@Override
	public Iterable<Brand> findAll() {
		return brandRepository.findAll();
	}

	@Override
	public Brand find(int id) {
		return brandRepository.findById(id).get();
	}

	@Override
	public Brand save(Brand b) {
		return brandRepository.save(b);
	}

	@Override
	public boolean delete(int id) {
		try {
			brandRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public List<Brand> checkbrand(String keyword) {
		
		return brandRepository.checkbrand(keyword);
	}

	@Override
	public Brand checknamebrand(String checknamebrand) {
		
		return brandRepository.checknamebrand(checknamebrand);
	}
	
}
