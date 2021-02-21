package com.ptstore.validations;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ptstore.models.Account;

@Component("accountValidation") // // @Component danh dau rang spring co the tim class nay o dau 
public class AccountValidation implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return clazz.equals(Account.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
	}

}