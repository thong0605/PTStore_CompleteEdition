package com.ptstore.services;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptstore.models.Account;
import com.ptstore.models.Product;
import com.ptstore.repositories.CustomerRepository;
import com.ptstore.repositories.ProductRepository;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Override
	public Iterable<Product> findAll() {
		return productRepository.findAll();
	}

	@Override
	public Product find(int id) {
		return productRepository.findById(id).get();
	}

	@Override
	public Product save(Product product) {
		return productRepository.save(product);
	}

	@Override
	public boolean delete(int id) {
		try {
			productRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	// phan cua thong
	// Search
		@Override
		public List<Product> search(String keyword) {
			return productRepository.search(keyword);
		}

		// Latest and discount and special products
		@Override
		public List<Product> discountProducts(int n) {
			return productRepository.discount(n);
		}

		@Override
		public List<Product> latestProducts(int n) {
			return productRepository.latest(n);
		}

		@Override
		public List<Product> specialProducts(boolean special) {
			return productRepository.special(special);
		}

		@Override
		public List<Product> relatedProducts(int categoryId, int productId, int n) {
			return productRepository.related(categoryId, productId, n);
		}

		@Override
		public List<Product> findAllByCategory(int categoryId) {
			return productRepository.findAllByCategory(categoryId);
		}

		@Override
		public List<Product> findAllByBrand(int brandId) {
			return productRepository.findAllByBrand(brandId);
		}

		// phan cua son
		@Override
		public List<Product> GetAllData(Account a) {
			return productRepository.GetAllData(a).stream().filter(p -> p.isStatus() == true).collect(Collectors.toList());
		}

		@Override
		public boolean setActive(int id) {
			Product p = productRepository.findById(id).get();
			p.setActivated(!p.isActivated());
			try {
				productRepository.save(p);
				return true;
			} catch (Exception e) {
				return false;
			}			
		}

		@Override
		public boolean setStatus(int id) {
			Product p = productRepository.findById(id).get();
			p.setStatus(!p.isStatus());
			try {
				productRepository.save(p);
				return true;
			} catch (Exception e) {
				return false;
			}
		}

		@Override
		public Product searchbyid(int id, Account a) {
			return productRepository.searchbyid(id, a);
		}

		@Override
		public List<Product> searchbyname(String name, Account a) {
			return productRepository.searchbyname(name, a);
		}

		@Override
		public List<Product> searchbyprice(double min, double max, Account a) {
			return productRepository.searchbyprice(min, max, a);
		}

	// phan cua phuc
		@Override
		public List<Product> sort1() {
			return productRepository.sort1();
		}

		@Override
		public List<Product> searchProduct(String keyword) {
			
			return productRepository.searchProduct(keyword);
		}

		@Override
		public int ShownewProducts(int year, int month) {
			return productRepository.ShownewProducts(year, month);
		}

		@Override
		public List<Product> searchproductCreated(Date startDate, Date endDate) {
			// TODO Auto-generated method stub
			return productRepository.searchproductCreated(startDate, endDate);
		}
		
}
