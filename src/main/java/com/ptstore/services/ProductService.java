package com.ptstore.services;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;


import com.ptstore.models.Account;
import com.ptstore.models.Product;

public interface ProductService {
	public Iterable<Product> findAll();
	public Product find(int id);
	public Product save(Product product);
	public boolean delete(int id);
	
	// phan cua son
	public boolean setActive(int id);
	
	public boolean setStatus(int id);
	
	public List<Product> GetAllData(Account a);
	
	public Product searchbyid(int id, Account a);
	
	public List<Product> searchbyname(String name, Account a);
	
	public List<Product> searchbyprice(double min, double max, Account a);
	
	
	// phan cua thong
	public List<Product> findAllByCategory(int categoryId);

	public List<Product> findAllByBrand(int brandId);

	// Search
	public List<Product> search(String keyword);

	// Latest and discount and special products
	public List<Product> discountProducts(int n);

	public List<Product> latestProducts(int n);

	public List<Product> specialProducts(boolean special);

	public List<Product> relatedProducts(int categoryId, int productId, int n);
	
	// phan cua phuc
	public List<Product> sort1();
	
	public List<Product> searchProduct(String keyword);
	public int ShownewProducts(int year,int month);
	
	public List<Product> searchproductCreated(Date startDate,Date endDate);
}
