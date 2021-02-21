package com.ptstore.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Orderdetails;
import com.ptstore.models.OrderdetailsId;

@Repository("orderdetailsRepository")
public interface OrderdetailsRepository extends CrudRepository<Orderdetails, OrderdetailsId> {
	//orderId, od.productId, p.name, od.quantity, od.amount
	@Query(value = "SELECT od.*, a.* "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y "
			+ "ORDER BY od.orderId DESC", nativeQuery = true)
	public List<Orderdetails> GetOrderForVendor(@Param("vendorId") int vendorId, @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT od.*, a.* "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId AND od.orderId = :orderId "
			+ "AND DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y "
			+ "ORDER BY od.orderId DESC", nativeQuery = true)
	public List<Orderdetails> SearchByOrderId(@Param("vendorId") int vendorId, @Param("orderId") int orderId, @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT od.*, a.* "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND NOT (DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y) "
			+ "ORDER BY od.orderId DESC", nativeQuery = true)
	public List<Orderdetails> GetOrderOldForVendor(@Param("vendorId") int vendorId, @Param("d") int d, @Param("m") int m, @Param("y") int y);

	@Query(value = "SELECT od.*, a.* "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId AND od.orderId = :orderId "
			+ "AND NOT (DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y) "
			+ "ORDER BY od.orderId DESC", nativeQuery = true)
	public List<Orderdetails> SearchByOrderIdOld(@Param("vendorId") int vendorId, @Param("orderId") int orderId, @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT od.*, a.* "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId AND DAY(o.orderDate) = :da AND MONTH(o.orderDate) = :mo AND YEAR(o.orderDate) = :ye "
			+ "AND NOT (DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y) "
			+ "ORDER BY od.orderId DESC", nativeQuery = true)
	public List<Orderdetails> SearchByOrderDateOld(@Param("vendorId") int vendorId, @Param("da") int da, @Param("mo") int mo, @Param("ye") int ye, @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT od.*, a.* "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND od.productId = :productId AND od.orderId = :orderId "
			+ "AND DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y "
			+ "ORDER BY od.orderId DESC", nativeQuery = true)
	public Orderdetails GetOrderDetailVendor(@Param("vendorId") int vendorId, @Param("orderId") int orderId, 
			@Param("productId") int producId,  @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT od.*, a.* "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND od.productId = :productId AND od.orderId = :orderId "
			+ "AND NOT (DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y) "
			+ "ORDER BY od.orderId DESC", nativeQuery = true)
	public Orderdetails GetOrderOldDetailVendor(@Param("vendorId") int vendorId, @Param("orderId") int orderId, 
			@Param("productId") int producId,  @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT count(*) "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y "
			, nativeQuery = true)
	public int CountOrderByDay(@Param("vendorId") int vendorId, @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT count(*) "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y "
			, nativeQuery = true)
	public int CountOrderByMonth(@Param("vendorId") int vendorId, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT count(*) "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND YEAR(o.orderDate) = :y "
			, nativeQuery = true)
	public int CountOrderByYear(@Param("vendorId") int vendorId, @Param("y") int y);
	
	@Query(value = "SELECT count(od.quantity) "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND DAY(o.orderDate) = :d AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y AND o.status = true "
			, nativeQuery = true)
	public int CountByProdOutD(@Param("vendorId") int vendorId, @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT count(od.quantity) "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND MONTH(o.orderDate) = :m AND YEAR(o.orderDate) = :y AND o.status = true "
			, nativeQuery = true)
	public int CountByProdOutM(@Param("vendorId") int vendorId, @Param("m") int m, @Param("y") int y);
	
	@Query(value = "SELECT count(od.quantity) "
			+ "FROM account a, product p, "
			+ "orderdetails od INNER JOIN orders o ON od.orderId = o.id "
			+ "WHERE od.productId = p.id AND o.accountId = a.id AND p.accountId = :vendorId "
			+ "AND YEAR(o.orderDate) = :y  AND o.status = true "
			, nativeQuery = true)
	public int CountByProdY(@Param("vendorId") int vendorId, @Param("y") int y);
}
