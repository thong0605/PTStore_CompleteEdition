package com.ptstore.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptstore.models.Orderdetails;
import com.ptstore.models.OrderdetailsId;
import com.ptstore.repositories.OrderdetailsRepository;


@Service("orderdetailsService")
public class OrderdetailsServiceImpl implements OrderdetailsService{

	@Autowired
	private OrderdetailsRepository orderDetailsRepository;
	
	@Override
	public Iterable<Orderdetails> findAll() {
		
		return orderDetailsRepository.findAll();
	}

	@Override
	public Orderdetails find(OrderdetailsId id) {
		return orderDetailsRepository.findById(id).get();
	}

	@Override
	public Orderdetails save(Orderdetails orderDetails) {
		return orderDetailsRepository.save(orderDetails);
	}

	@Override
	public boolean delete(OrderdetailsId id) {
		try {
			orderDetailsRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}	
	}

	@Override
	public List<Orderdetails> GetOrderForVendor(int vendorId, int d, int m, int y) {
		return orderDetailsRepository.GetOrderForVendor(vendorId, d, m, y);
	}

	@Override
	public List<Orderdetails> GetOrderOldForVendor(int vendorId, int d, int m, int y) {
		return orderDetailsRepository.GetOrderOldForVendor(vendorId, d, m, y);
	}

	@Override
	public Orderdetails GetOrderDetailVendor(int vendorId, int orderId, int producId, int d, int m, int y) {
		return orderDetailsRepository.GetOrderDetailVendor(vendorId, orderId, producId, d, m, y);
	}
	
	@Override
	public Orderdetails GetOrderOldDetailVendor(int vendorId, int orderId, int producId, int d, int m, int y) {
		return orderDetailsRepository.GetOrderOldDetailVendor(vendorId, orderId, producId, d, m, y);
	}

	@Override
	public List<Orderdetails> SearchByOrderId(int vendorId, int orderId, int d, int m, int y) {
		return orderDetailsRepository.SearchByOrderId(vendorId, orderId, d, m, y);
	}

	@Override
	public List<Orderdetails> SearchByOrderIdOld(int vendorId, int orderId, int d, int m, int y) {
		return orderDetailsRepository.SearchByOrderIdOld(vendorId, orderId, d, m, y);
	}

	@Override
	public List<Orderdetails> SearchByOrderDateOld(int vendorId, int da, int mo, int ye, int d, int m, int y) {
		return orderDetailsRepository.SearchByOrderDateOld(vendorId, da, mo, ye, d, m, y);
	}

	@Override
	public int CountOrderByDay(int vendorId, int d, int m, int y) {
		return orderDetailsRepository.CountOrderByDay(vendorId, d, m, y);
	}

	@Override
	public int CountOrderByMonth(int vendorId, int m, int y) {
		return orderDetailsRepository.CountOrderByMonth(vendorId, m, y);
	}

	@Override
	public int CountOrderByYear(int vendorId, int y) {
		return orderDetailsRepository.CountOrderByYear(vendorId, y);
	}

	@Override
	public int CountByProdOutD(int vendorId, int d, int m, int y) {
		return orderDetailsRepository.CountByProdOutD(vendorId, d, m, y);
	}

	@Override
	public int CountByProdOutM(int vendorId, int m, int y) {
		return orderDetailsRepository.CountByProdOutM(vendorId, m, y);
	}

	@Override
	public int CountByProdOutY(int vendorId, int y) {
		return orderDetailsRepository.CountByProdY(vendorId, y);
	}
	
}
