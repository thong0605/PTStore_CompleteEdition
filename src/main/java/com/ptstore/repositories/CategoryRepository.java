package com.ptstore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Category;

@Repository("categoryRepository")
public interface CategoryRepository extends CrudRepository<Category, Integer> {
	@Query("from Category where status = true")
	public List<Category> FindCategory();
	
	@Query("from Category where name like %:keyword% and status = true")
	public List<Category> searchCategory(@Param("keyword") String keyword);
	
	@Query("from Category where name = :checkcategory and status = true")
	public Category checkcategory(@Param("checkcategory") String checkcategory);
}
