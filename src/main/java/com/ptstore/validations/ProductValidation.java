package com.ptstore.validations;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ptstore.models.Product;

@Component("productValidation") 
public class ProductValidation implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(Product.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
	}

}