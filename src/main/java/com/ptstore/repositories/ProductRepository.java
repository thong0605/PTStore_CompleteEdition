package com.ptstore.repositories;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Account;
import com.ptstore.models.Product;

@Repository("productRepository")
public interface ProductRepository extends CrudRepository<Product, Integer> {
	// phan cua son
		@Query(value = "from Product where account = :account and status = true order by id desc")//, nativeQuery = true
		public List<Product> GetAllData(@Param("account") Account account);
		
		@Query("from Product where id = :id and status = true and account = :account")
		public Product searchbyid(@Param("id") int id, @Param("account") Account account);
		
		@Query("from Product where unitPrice >= :min and unitPrice <= :max and status = true and account = :account")
		public List<Product> searchbyprice(@Param("min") double min, @Param("max") double max, @Param("account") Account account);
		
		@Query("from Product where name like %:keyword% and status = true and account = :account")
		public List<Product> searchbyname(@Param("keyword") String keyword, @Param("account") Account account);

	// phan cua thong
		// read products
		@Query("from Product where categoryId = :categoryId and status = true")
		public List<Product> findAllByCategory(@Param("categoryId") int categoryId);

		@Query("from Product where brandId = :brandId and status = true")
		public List<Product> findAllByBrand(@Param("brandId") int brandId);

		// value = "select p.name, a.fullname from Product p, Account a where a.id =
		// p.accountId and a.roleId = 2 and p.name like %:keyword% or a.fullname like
		// %:keyword%", nativeQuery = true
		@Query("from Product where activated = true and status = true and name like %:keyword%")
		public List<Product> search(@Param("keyword") String keyword);

		@Query(value = "select * from product where price between :min and :max", nativeQuery = true)
		public List<Product> priceBetween(@Param("min") BigDecimal min, @Param("max") BigDecimal max);

		// Latest, discount, special, related items
		@Query(value = "select * from product where activated = true and status = true and discount > 0 limit :n", nativeQuery = true)
		public List<Product> discount(@Param("n") int n);

		@Query(value = "select * from product where activated = true and status = true order by id desc limit :n", nativeQuery = true)
		public List<Product> latest(@Param("n") int n);

		@Query("from Product where special = :special and activated = true and status = true ")
		public List<Product> special(@Param("special") boolean special);

		@Query(value = "select * from product where activated = true and status = true and categoryId = :categoryId and id != :id limit :n", nativeQuery = true)
		public List<Product> related(@Param("categoryId") int categoryId, @Param("id") int productId, @Param("n") int n);

		// phan cua phuc
		@Query("from Product where status = true and category.status = true order  by id desc")
		 public List<Product> sort1();

		@Query("from Product where name like %:keyword% and status = true")
		public List<Product> searchProduct(@Param("keyword") String keyword);

		// SQL
		@Query(value = "select count(created) from Product where year(created) = :year and month(created) = :month", nativeQuery = true)
		public int ShownewProducts(@Param("year") int year, @Param("month") int month);
		

		@Query("from Product where created between :startDate and :endDate and status = true")
		public List<Product> searchproductCreated(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
}
