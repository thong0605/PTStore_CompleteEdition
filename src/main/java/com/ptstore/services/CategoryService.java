package com.ptstore.services;

import java.util.Date;
import java.util.List;

import com.ptstore.models.Category;

public interface CategoryService {
	public Iterable<Category> findAll();
	public Category find(int id);
	public Category save(Category c);
	public boolean delete(int id);
	
	public List<Category> findCategory();
	public List<Category> searchCategory(String keyword);
	
	public Category checkcategory(String checkcategory);
}
