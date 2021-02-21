package com.ptstore.repositories;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.ptstore.models.Orders;

@Repository("ordersRepository")
public interface OrdersRepository extends CrudRepository<Orders, Integer> {
	
	// phan cua thong
	@Query(value = "select * from orders where accountId = :customerId order by id desc limit 1", nativeQuery = true)
	public Orders findLatestOrder(@Param("customerId") int customerId);

	@Query(value = "select * from orders where accountId = :customerId order by id desc ", nativeQuery = true)
	public List<Orders> ordersHistory(@Param("customerId") int customerId);
	
	// phan cua phuc
	@Query("from Orders order by id desc ")
	public List<Orders> FindOrders();

	@Query("select o from Orders o where o.account.username like %:username%")
	public List<Orders> searchordersusername(@Param("username") String username);
	
	@Query("from Orders where phone =:phone")
	public List<Orders> searchodersPhone(@Param("phone") String phone);
	
	@Query("from Orders where payment =:payment")
	public List<Orders> searchodersPayment(@Param("payment") int payment);

	@Query("from Orders where orderDate between :startDate and :endDate")
	public List<Orders> searchordersCreated(@Param("startDate") Date startDate, @Param("endDate") Date endDate);
	
	//@Query("from Orders where year(orderDate) = :year and month(orderDate) = :month")
	//public List<Orders> Showordersnew(@Param("year") int year, @Param("month") int month);
	
	// SQL
	@Query( value = "select count(orderDate) from Orders where year(orderDate) = :year and month(orderDate) = :month", nativeQuery = true)
	public int  Showordersneww(@Param("year") int year, @Param("month") int month);
}
