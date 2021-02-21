package com.ptstore.services;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.ptstore.models.Orderdetails;
import com.ptstore.models.OrderdetailsId;


public interface OrderdetailsService {
	public Iterable<Orderdetails> findAll();
	public Orderdetails find(OrderdetailsId id);
	public Orderdetails save(Orderdetails OrderDetails);
	public boolean delete(OrderdetailsId id);
	
	public List<Orderdetails> GetOrderForVendor(int vendorId, int d, int m, int y);
	
	public List<Orderdetails> SearchByOrderId(int vendorId, int orderId, int d, int m, int y);
	
	public List<Orderdetails> GetOrderOldForVendor(int vendorId, int d, int m, int y);
	
	public List<Orderdetails> SearchByOrderIdOld(int vendorId, int orderId, int d, int m, int y);
	
	public List<Orderdetails> SearchByOrderDateOld(int vendorId, int da, int mo, int ye, int d, int m, int y);
	
	public Orderdetails GetOrderDetailVendor(int vendorId, int orderId, int producId, int d, int m, int y);
	
	public Orderdetails GetOrderOldDetailVendor(int vendorId, int orderId, int producId, int d, int m, int y);
	
	public int CountOrderByDay(int vendorId, int d, int m, int y);
	
	public int CountOrderByMonth(int vendorId, int m, int y);
	
	public int CountOrderByYear(int vendorId, int y);
	
	public int CountByProdOutD(@Param("vendorId") int vendorId, @Param("d") int d, @Param("m") int m, @Param("y") int y);
	
	public int CountByProdOutM(@Param("vendorId") int vendorId, @Param("m") int m, @Param("y") int y);
	
	public int CountByProdOutY(@Param("vendorId") int vendorId, @Param("y") int y);
	
}
