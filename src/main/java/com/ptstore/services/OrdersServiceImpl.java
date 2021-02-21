package com.ptstore.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptstore.models.Orders;
import com.ptstore.models.Product;
import com.ptstore.repositories.OrdersRepository;



@Service("ordersService")
public class OrdersServiceImpl implements OrdersService {

	@Autowired
	private OrdersRepository ordersRepository;
	
	@Override
	public Iterable<Orders> findAll() {
		
		return ordersRepository.findAll();
	}

	@Override
	public Orders find(int id) {
		
		return ordersRepository.findById(id).get();
	}

	@Override
	public Orders save(Orders orders) {
		
		return ordersRepository.save(orders);
	}

	@Override
	public boolean delete(int id) {
		try {
			ordersRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public boolean setStatus(int id) {
		Orders o = ordersRepository.findById(id).get();
		o.setStatus(!o.isStatus());
		try {
			ordersRepository.save(o);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	@Override
	public Orders findLatestOrder(int customerId) {
		return ordersRepository.findLatestOrder(customerId);
	};

	@Override
	public List<Orders> ordersHistory(int customerId) {
		return ordersRepository.ordersHistory(customerId);
	};
	
	// phan cua phuc
	@Override
	public List<Orders> FindOrders() {
		// TODO Auto-generated method stub
		return ordersRepository.FindOrders();
	}

	@Override
	public List<Orders> searchordersusername(String username) {
		// TODO Auto-generated method stub
		return ordersRepository.searchordersusername(username);
	}

	@Override
	public List<Orders> searchodersPhone(String phone) {
		// TODO Auto-generated method stub
		return ordersRepository.searchodersPhone(phone);
	}

	@Override
	public List<Orders> searchodersPayment(int payment) {
		// TODO Auto-generated method stub
		return ordersRepository.searchodersPayment(payment);
	}

	@Override
	public List<Orders> searchordersCreated(Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return ordersRepository.searchordersCreated(startDate, endDate);
	}

	@Override
	public int Showordersneww(int year, int month) {
		// TODO Auto-generated method stub
		return ordersRepository.Showordersneww(year, month);
	}
	
}
