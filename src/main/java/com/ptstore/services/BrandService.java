package com.ptstore.services;

import java.util.Date;
import java.util.List;

import com.ptstore.models.Brand;

public interface BrandService {
	public Iterable<Brand> findAll();
	public Brand find(int id);
	public Brand save(Brand b);
	public boolean delete(int id);
	
	public List<Brand> checkbrand(String keyword);
	
	public Brand checknamebrand(String checknamebrand);
}
