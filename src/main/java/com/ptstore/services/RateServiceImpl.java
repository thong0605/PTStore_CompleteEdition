package com.ptstore.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ptstore.models.Rate;
import com.ptstore.repositories.RateRepository;


@Service("rateService")
public class RateServiceImpl implements RateService {
	@Autowired
	private RateRepository rateRepository;
	
	@Override
	public Iterable<Rate> findAll() {
		return rateRepository.findAll();
	}

	@Override
	public Rate find(int id) {
		return rateRepository.findById(id).get();
	}

	@Override
	public Rate save(Rate rate) {
		return rateRepository.save(rate);
	}

	@Override
	public boolean delete(int id) {
		try {
			rateRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Rate> GetDataByVendorId(int vendorId) {
		return rateRepository.GetDataByVendorId(vendorId);
	}

	@Override
	public List<Rate> SearchByProductId(int vendorId, int productId) {
		return rateRepository.SearchByProductId(vendorId, productId);
	}
	
	@Override
	public Rate findByProduct(int productId) {
		return rateRepository.findByProduct(productId);
	}
	
	// phan cua phuc
	@Override
	public List<Rate> searchproductid(int id) {
		return rateRepository.searchproductid(id);
	}

}
