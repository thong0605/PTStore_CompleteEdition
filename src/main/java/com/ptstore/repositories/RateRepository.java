package com.ptstore.repositories;


import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Rate;

@Repository("rateRepository")
public interface RateRepository extends CrudRepository<Rate, Integer> {
	
	// phan cua son
	@Query(value = "select r.*, p.photo from rate r INNER JOIN product p ON r.productId = p.id WHERE p.accountId = :vendorId and p.status = true", nativeQuery = true)
	public List<Rate> GetDataByVendorId(@Param("vendorId") int vendorId);
	
	@Query(value = "select r.*, p.photo from rate r INNER JOIN product p ON r.productId = p.id WHERE p.accountId = :vendorId AND r.productId = :productId and p.status = true", nativeQuery = true)
	public List<Rate> SearchByProductId(@Param("vendorId") int vendorId, @Param("productId") int productId);
	
	// phan cua thong
	@Query(value = "select r.*, p.id from Rate r, Product p where r.productId = p.id and r.productId = :productId", nativeQuery = true)
	public Rate findByProduct(@Param("productId") int productId);
	
	// phan cua phuc
	@Query("select r from Rate r where r.product.id = :id")
	public List<Rate> searchproductid(@Param("id") int id);
}
