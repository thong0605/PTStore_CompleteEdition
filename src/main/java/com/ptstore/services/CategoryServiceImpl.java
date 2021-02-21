package com.ptstore.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptstore.models.Category;
import com.ptstore.repositories.CategoryRepository;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {

	@Autowired 
	private CategoryRepository categoryRepository;
	
	@Override
	public Iterable<Category> findAll() {
		return categoryRepository.findAll();
	}

	@Override
	public Category find(int id) {
		return categoryRepository.findById(id).get();
	}

	@Override
	public Category save(Category c) {
		return categoryRepository.save(c);
	}

	@Override
	public boolean delete(int id) {
		try {
			categoryRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public List<Category> findCategory() {
		// TODO Auto-generated method stub
		return categoryRepository.FindCategory();
	}

	@Override
	public List<Category> searchCategory(String keyword) {
		// TODO Auto-generated method stub
		return categoryRepository.searchCategory(keyword);
	}

	@Override
	public Category checkcategory(String checkcategory) {
		
		return categoryRepository.checkcategory(checkcategory);
	}
	
}
