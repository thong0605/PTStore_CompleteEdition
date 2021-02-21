package com.ptstore.controllers.customer;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptstore.models.Account;
import com.ptstore.models.Brand;
import com.ptstore.models.Category;
import com.ptstore.models.Product;
import com.ptstore.models.Rate;
import com.ptstore.services.BrandService;
import com.ptstore.services.CategoryService;
import com.ptstore.services.CustomerService;
import com.ptstore.services.ProductService;
import com.ptstore.services.RateService;

@Controller
@RequestMapping({ "product" })
public class ProductController {
	@Autowired
	private ProductService productService;

	@Autowired
	private CustomerService vendorService;

	@Autowired
	private BrandService brandService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private RateService rateService;

	// list product by category id
	@RequestMapping(value = "listByCategories/{categoryId}", method = RequestMethod.GET)
	public String listByCategories(HttpServletRequest request, ModelMap map,
			@PathVariable("categoryId") int categoryId) {

		// map name of category to view
		Category category = categoryService.find(categoryId);
		map.put("category", category);

		// map breadcumb
		map.put("breadcumb", "Product by " + category.getName());

		// find products by Category Id
		List<Product> products = productService.findAllByCategory(categoryId);

		// count displayed products
		int countItem = 0;
		countItem = products.size();
		map.put("countItem", countItem);

		// Product list with pagination
		PagedListHolder pagedListHolder = pagination(request, products);
		map.put("pagedListHolder", pagedListHolder);

		return "product.list";
	}

	// list product by brand id
	@RequestMapping(value = "listByBrands/{brandId}", method = RequestMethod.GET)
	public String listByBrands(HttpServletRequest request, ModelMap map, @PathVariable("brandId") int brandId) {

		// get Brand's name
		Brand brand = brandService.find(brandId);
		map.put("brand", brand);

		// map breadcumb
		map.put("breadcumb", "Product by " + brand.getName());

		// find products by Brand Id
		List<Product> products = productService.findAllByBrand(brandId);

		// count displayed products
		int countItem = 0;
		countItem = products.size();
		map.put("countItem", countItem);

		// Product list with pagination
		PagedListHolder pagedListHolder = pagination(request, products);
		map.put("pagedListHolder", pagedListHolder);

		return "product.list";
	}

	// detail product
	@RequestMapping(value = "detail/{id}", method = RequestMethod.GET)
	public String detail(ModelMap map, @PathVariable("id") int id) {

		// find product by id
		Product product = productService.find(id);
		map.put("product", product);

		// breadcumb
		map.put("breadcumb", "Product / " + product.getName());
		// rating
		Rate rate = rateService.findByProduct(id);
		map.put("rate", rate);
		double sumrate = rate.getStar1() + rate.getStar2() + rate.getStar3() + rate.getStar4() + rate.getStar5();
		map.put("sumrate", sumrate);

		DecimalFormat df = new DecimalFormat("#.#");
		map.put("average", df.format((rate.getStar1() + rate.getStar2() * 2 + rate.getStar3() * 3 + rate.getStar4() * 4
				+ rate.getStar5() * 5) / sumrate));

		// 6 related Products
		List<Product> relatedProduct = productService.relatedProducts(product.getCategory().getId(), id, 6);
		map.put("relatedProducts", relatedProduct);

		return "product.detail";
	}

	// compare product
	@RequestMapping(value = "compare", method = RequestMethod.GET)
	public String compare(ModelMap map, @PathVariable("id1") int id1, @PathVariable("id2") int id2) {
		map.put("item1", productService.find(id1));
		map.put("item2", productService.find(id2));
		return "product.compare";
	}

	// search product by name or vendor name
	@RequestMapping(value = "search", method = RequestMethod.GET)
	public String search(@RequestParam("keyword") String keyword, @RequestParam("choose") int choose,
			ModelMap modelMap) {
		modelMap.put("search", true);
		modelMap.put("breadcumb", "Search");

		// int chose = Integer.parseInt(choose);
		if (choose == 1) {
			// find product by name
			List<Product> products = productService.search(keyword);
			modelMap.put("keyword", keyword);

			// count displayed products
			int countItem = 0;
			countItem = products.size();
			modelMap.put("countItem", countItem);

			// displayed products
			modelMap.put("products", products);

		} else if (choose == 2) {
			// find Vendor
			List<Account> vendors = vendorService.searchByVendor(keyword);

			// if vendor is null
			if (vendors != null) {
				modelMap.put("keyword", keyword);

				// count displayed vendor
				int countVendor = 0;
				countVendor = vendors.size();
				modelMap.put("countVendors", countVendor);

				// displayed vendors
				modelMap.put("vendors", vendors);
			}

			return "customer.vendorList";
		}
		return "product.list";
	}

	// list product by vendor id
	@RequestMapping(value = "listByVendor/{fullname}", method = RequestMethod.GET)
	public String listByVendor(HttpServletRequest request, ModelMap modelMap, HttpSession session,
			@PathVariable("fullname") String fullname) {

		// vendor name
		Account vendor = vendorService.findByFullname(fullname);
		modelMap.put("vendor", vendor);

		// change PersistentSet to ArrayList to find vendor's products
		List<Product> products = new ArrayList<Product>(vendor.getProducts());

		// count displayed products
		int countItem = 0;
		countItem = products.size();
		modelMap.put("countItem", countItem);

		// map breadcumb
		modelMap.put("breadcumb", "Product by " + vendor.getFullname());

		// Product list with pagination
		PagedListHolder pagedListHolder = pagination(request, products);
		modelMap.put("pagedListHolder", pagedListHolder);

		return "product.list";
	}

	// special offered promotions
	@RequestMapping(value = "offer", method = RequestMethod.GET)
	public String offer(HttpServletRequest request, ModelMap modelMap) {

		// find products with discount
		List<Product> discounts = productService.discountProducts(20);
		// map breadcumb
		modelMap.put("breadcumb", "Special Discount");

		// count displayed products
		int countItem = 0;
		countItem = discounts.size();
		modelMap.put("countItem", countItem);

		// Product list with pagination
		PagedListHolder pagedListHolder = pagination(request, discounts);
		modelMap.put("pagedListHolder", pagedListHolder);

		return "product.list";
	}

	// rating product
	@RequestMapping(value = "rating/{id}", method = RequestMethod.POST)
	public String rating(@PathVariable("id") int id, @RequestParam("rate") int rate) {
		Product product = productService.find(id);

		if (product.getRates() != null) {
			int rater = 0;
			Rate r = rateService.findByProduct(id);
			switch (rate) {
			case 1:
				rater = r.getStar1() + 1;
				r.setStar1(rater);
				break;
			case 2:
				rater = r.getStar2() + 1;
				r.setStar2(rater);
				break;
			case 3:
				rater = r.getStar3() + 1;
				r.setStar3(rater);
				break;
			case 4:
				rater = r.getStar4() + 1;
				r.setStar4(rater);
				break;
			case 5:
				rater = r.getStar5() + 1;
				r.setStar5(rater);
				break;
			}
			r.setProduct(product);
			rateService.save(r);
		}
		return "redirect:/product/detail/" + id;

	}

	// pagination function
	PagedListHolder pagination(HttpServletRequest request, List<Product> products) {

		// Product list with pagination
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "p", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(6);

		return pagedListHolder;
	}

}