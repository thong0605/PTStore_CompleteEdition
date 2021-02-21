package com.ptstore.controllers.vendor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptstore.models.Rate;
import com.ptstore.services.RateService;

@Controller
@RequestMapping({"vendor/quality"})
public class VendorQualityController {
	
	@Autowired
	private RateService rateService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map, HttpSession session, HttpServletRequest request) {		
		int vendorId = (int) session.getAttribute("vendorId");
		List<Rate> rates = rateService.GetDataByVendorId(vendorId);
		PagedListHolder pagedListHolder = new PagedListHolder(rates);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		map.put("pagedListHolder", pagedListHolder);
		return "vendor.quality.index";
	}
	
	@RequestMapping(value = "searchbyproductid", method = RequestMethod.POST)
	public String searchbyid(@RequestParam("productid") String productid, ModelMap map, HttpSession session, HttpServletRequest request) {
		int id1 = Integer.parseInt(productid.trim());
		int vendorId = (int) session.getAttribute("vendorId");
		List<Rate> rates = rateService.SearchByProductId(vendorId, id1);
		PagedListHolder pagedListHolder = new PagedListHolder(rates);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(20);
		map.put("pagedListHolder", pagedListHolder);
		map.put("productId", productid);
		return "vendor.quality.index";
	}
	
}
