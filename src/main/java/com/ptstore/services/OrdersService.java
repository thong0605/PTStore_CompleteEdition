package com.ptstore.services;

import java.util.Date;
import java.util.List;

import org.springframework.data.repository.query.Param;

import com.ptstore.models.Orders;


public interface OrdersService {
	public Iterable<Orders> findAll();
	public Orders find(int id);
	public Orders save(Orders Orders);
	public boolean delete(int id);
	
	public boolean setStatus(int id);
	
	public Orders findLatestOrder(int customerId);

	public List<Orders> ordersHistory(int customerId);
	
	// phan cua phuc
	public List<Orders> FindOrders();
	
	public List<Orders> searchordersusername(String username);
	
	public List<Orders> searchodersPhone(String phone);
	
	public List<Orders> searchodersPayment(int payment);
	
	public List<Orders> searchordersCreated(Date startDate, Date endDate);
	
	public int Showordersneww(int year,int month);
}
