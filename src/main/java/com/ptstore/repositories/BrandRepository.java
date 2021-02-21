package com.ptstore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Brand;

@Repository("brandRepository")
public interface BrandRepository extends CrudRepository<Brand, Integer> {
	@Query("from Brand where name like %:keyword%")
	public List<Brand> checkbrand(@Param("keyword") String keyword);
	
	@Query("from Brand where name = :checknamebrand")
	public Brand checknamebrand(@Param("checknamebrand") String checknamebrand);
}
