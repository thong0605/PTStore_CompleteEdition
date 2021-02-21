package com.ptstore.controllers.vendor;



import java.text.ParseException;

import java.util.Calendar;
import java.util.Date;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ptstore.services.OrderdetailsService;

@Controller
@RequestMapping({"vendor/dashboard"})
public class VendorDashboardController {
//	private HttpSession session1;
	
	@Autowired
    private OrderdetailsService orderdetailsService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(Authentication authentication, ModelMap map, HttpSession session) throws ParseException {
		int id = (int) session.getAttribute("vendorId");
		Date date = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		map.put("orderDay", orderdetailsService.CountOrderByDay(id, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR)));
		map.put("orderMonth", orderdetailsService.CountOrderByMonth(id, c.get(Calendar.MONTH) +1, c.get(Calendar.YEAR)));
		map.put("orderYear", orderdetailsService.CountOrderByYear(id, c.get(Calendar.YEAR)));
		map.put("orderYear2", orderdetailsService.CountOrderByYear(id, c.get(Calendar.YEAR)-1));
		
		map.put("qDay", orderdetailsService.CountByProdOutD(id, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR)));
		map.put("qMonth", orderdetailsService.CountByProdOutM(id, c.get(Calendar.MONTH) +1, c.get(Calendar.YEAR)));
		map.put("qYear", orderdetailsService.CountByProdOutY(id, c.get(Calendar.YEAR)));
		map.put("qYear2", orderdetailsService.CountByProdOutY(id, c.get(Calendar.YEAR)-1));
		
		String y = String.valueOf(c.get(Calendar.YEAR));
		String y2 = String.valueOf(c.get(Calendar.YEAR) -1);
		
		map.put("y", y);
		map.put("y2", y2);
		return "vendor.dashboard.index"; 
	}
	
//	private List<MyItem> reportReceipt(Date date, int limit) {
//		int vendorId = (int) session1.getAttribute("vendorId");
//		Calendar c = Calendar.getInstance();
//		c.setTime(date);
//        List<MyItem> list = new ArrayList<>();
//        for (int i = limit - 1; i >= 0; i--) {
//            Date d = subDays(date, i);
//            MyItem myItem = new MyItem();
//            myItem.setTime(covertD2S(d));
//            myItem.setValue(orderdetailsService.CountItemByDate(vendorId, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR)));
//            list.add(myItem);
//        }
//        return list;
//    }
	
//	private Date addDays(Date date, int days) {
//        Calendar cal = Calendar.getInstance();
//        cal.setTime(date);
//        cal.add(Calendar.DATE, days);
//        return cal.getTime();
//    }

//    private Date subDays(Date date, int days) {
//    	Calendar cal = Calendar.getInstance();
//        cal.setTime(date);
//        cal.add(Calendar.DATE, -(days));
//        return cal.getTime();
//    }
//
//    private String covertD2S(Date date) {
//        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd");
//        return df.format(date);
//    }
}
