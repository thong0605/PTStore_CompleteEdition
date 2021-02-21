package com.ptstore.services;

import java.util.List;

import com.ptstore.models.Rate;


public interface RateService {
	public Iterable<Rate> findAll();
	public Rate find(int id);
	public Rate save(Rate rate);
	public boolean delete(int id);
	
	public List<Rate> GetDataByVendorId(int vendorId);
	
	public List<Rate> SearchByProductId(int vendorId, int productId);
	
	// phan cua thong
	public Rate findByProduct(int productId);
	
	// phan cua phuc
	public List<Rate> searchproductid(int id );
}
