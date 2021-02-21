package com.ptstore.controllers.customer;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ptstore.models.Product;

import com.ptstore.services.ProductService;


@Controller
@RequestMapping({ "", "home" })
public class HomeController {

	@Autowired
	private ProductService productService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap) {

		// count discounted items
		List<Product> discounts = productService.discountProducts(4);

		// mapped models to view
		modelMap.put("disProducts", discounts);
		modelMap.put("latestProducts", productService.latestProducts(5));
		modelMap.put("specialProducts", productService.specialProducts(true));
		modelMap.put("isHome", true);
		modelMap.put("carousel", true);

		return "home.index";
	}

	@RequestMapping(value = "contact", method = RequestMethod.GET)
	public String contact() {
		return "home.contact";
	}
}