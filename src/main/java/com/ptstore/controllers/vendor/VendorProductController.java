package com.ptstore.controllers.vendor;


import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;

import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.ptstore.models.Account;
import com.ptstore.models.Product;
import com.ptstore.models.Rate;
import com.ptstore.services.AccountService;
import com.ptstore.services.BrandService;
import com.ptstore.services.CategoryService;
import com.ptstore.services.ProductService;
import com.ptstore.services.RateService;
import com.ptstore.validations.ProductValidation;

@Controller
@RequestMapping({"vendor/product"})
@EnableGlobalAuthentication
public class VendorProductController implements ServletContextAware {
	
	private ServletContext servletContext;
	
	@Autowired
	private ProductValidation productValidation;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private AccountService accountService;
	
	@Autowired
	private BrandService brandService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private RateService rateService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(Authentication authentication, ModelMap map, HttpServletRequest request) {
//		map.put("username", authentication.getName());
		Account account =  accountService.findByUsername(authentication.getName());
		List<Product> products = (List<Product>) productService.GetAllData(account);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		map.put("pagedListHolder", pagedListHolder);
		return "vendor.product.index"; 
	}
	
	@RequestMapping(value="create", method = RequestMethod.GET)
	public String create(ModelMap map) {
		map.put("brands", brandService.findAll());
		map.put("categories", categoryService.findAll());
		Product p = new Product();		
		map.put("product", p);
		return "vendor.create.index"; 
	}
	
	@RequestMapping(value="create", method = RequestMethod.POST)
	public String create(ModelMap map, @ModelAttribute("product") @Valid Product p, BindingResult bindingResult, @RequestParam("inputphoto") MultipartFile multipartFile, 
			@RequestParam("brandId") int brandId, @RequestParam("cateId") int cateId, @RequestParam("accountId") int accountId) {
		productValidation.validate(p, bindingResult);
		if(bindingResult.hasErrors()) {
			return "vendor.create.index"; 
		} else {
			p.setAccount(accountService.find(accountId));
			p.setBrand(brandService.find(brandId));
			p.setCategory(categoryService.find(cateId));
			p.setCreated(new Date());
			p.setUnitBrief("one");
			String filename = saveImage(multipartFile);
			p.setPhoto(filename);
			p.setSpecial(true);
			p.setActivated(true);
			p.setStatus(true);
			
			
			if(productService.save(p) != null) {
				Product p2 = productService.save(p);
				Rate r = new Rate();
				r.setProduct(p2);
				r.setStar1(0);
				r.setStar2(0);
				r.setStar3(0);
				r.setStar4(0);
				r.setStar5(0);
				rateService.save(r);
				return "redirect:/vendor/product";
			} else {
				map.put("msg", "FAILURE");
			}
		}
		return "vendor.create.index"; 
	}
	
	@RequestMapping(value="edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap map) {
		map.put("brands", brandService.findAll());
		map.put("categories", categoryService.findAll());
		map.put("product", productService.find(id));
		return "vendor.edit.index"; 
	}
	
	@RequestMapping(value="edit", method = RequestMethod.POST)
	public String edit(ModelMap map, @ModelAttribute("product") @Valid Product product, BindingResult bindingResult, @RequestParam("inputphoto") MultipartFile multipartFile
			) {
		productValidation.validate(product, bindingResult);
		if(bindingResult.hasErrors()) {
			return "vendor.edit.index"; 
		} else {
			String filename = saveImage(multipartFile);
			product.setPhoto(filename);
			product.setUnitBrief("one");
			product.setStatus(true);
			if(productService.save(product) != null) {
				return "redirect:/vendor/product";
			} else {
				map.put("msg", "FAILURE");
			}
		}
		return "vendor.edit.index"; 
	}
	
	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		productService.setStatus(id);
		return "redirect:/vendor/product";
	}
	
	private String saveImage(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/upload/vendor/product/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (IOException e) {
			return null;
		}
	}
	
	@RequestMapping(value = "searchbyid", method = RequestMethod.POST)
	public String searchbyid(Authentication authentication, @RequestParam("id") String id, ModelMap map, HttpServletRequest request) {
		Account account =  accountService.findByUsername(authentication.getName());
		int id1 = Integer.parseInt(id.trim());
		Product product = productService.searchbyid(id1, account);
		List<Product> products = new ArrayList<Product>();
		products.add(product);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(10);
		map.put("pagedListHolder", pagedListHolder);
		map.put("id", id);
		return "vendor.product.index";
	}
	
	@RequestMapping(value = "searchbyname", method = RequestMethod.POST)
	public String searchbyname(Authentication authentication, @RequestParam("name") String name, ModelMap map, HttpServletRequest request) {
		Account account =  accountService.findByUsername(authentication.getName());
		List<Product> products = productService.searchbyname(name.trim(), account);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(100);
		map.put("pagedListHolder", pagedListHolder);
		map.put("name", name);
		return "vendor.product.index";
	}
	
	@RequestMapping(value = "searchbyprice", method = RequestMethod.POST)
	public String searchbyprice(Authentication authentication, @RequestParam("min") String min, @RequestParam("max") String max, ModelMap map, HttpServletRequest request) {
		Account account =  accountService.findByUsername(authentication.getName());
		double min1 = Double.parseDouble(min);
		double max1 = Double.parseDouble(max);
		List<Product> products = productService.searchbyprice(min1, max1, account);
		PagedListHolder pagedListHolder = new PagedListHolder(products);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(100);
		map.put("pagedListHolder", pagedListHolder);
		map.put("min", min);
		map.put("max", max);
		return "vendor.product.index";
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
