package com.ptstore.controllers.vendor;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
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

import com.ptstore.models.Orderdetails;
import com.ptstore.models.Orders;

import com.ptstore.services.MailService;
import com.ptstore.services.OrderdetailsService;
import com.ptstore.services.OrdersService;

@Controller
@RequestMapping({"vendor/order"})
public class VendorOrderController {
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private OrderdetailsService orderdetailsService;
	
	@Autowired
	private OrdersService ordersService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap map, HttpSession session, HttpServletRequest request) {		
		int vendorId = (int) session.getAttribute("vendorId");
		Date today = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(today);
		List<Orderdetails> orders = orderdetailsService.GetOrderForVendor(vendorId, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR));
		PagedListHolder pagedListHolder = new PagedListHolder(orders);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		map.put("pagedListHolder", pagedListHolder);
		return "vendor.order.index";
	}
	
	@RequestMapping(value= "orderdetail/{vendorid}/{orderid}/{productid}", method = RequestMethod.GET)
	public String orderdetail(ModelMap map, @PathVariable("vendorid") int vendorid, @PathVariable("orderid") int orderid, @PathVariable("productid") int productid) {		
		Date today = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(today);
		map.put("od", orderdetailsService.GetOrderDetailVendor(vendorid, orderid, productid, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR)));
		return "vendor.orderdetail.index";
	}
	
	@RequestMapping(value= "orderold", method = RequestMethod.GET)
	public String orderold(ModelMap map, HttpSession session, HttpServletRequest request) {		
		int vendorId = (int) session.getAttribute("vendorId");
		Date today = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(today);
		List<Orderdetails> orders = orderdetailsService.GetOrderOldForVendor(vendorId, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR));
		PagedListHolder pagedListHolder = new PagedListHolder(orders);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(5);
		map.put("pagedListHolder", pagedListHolder);
		return "vendor.orderold.index";
	}
	
	@RequestMapping(value= "orderolddetail/{vendorid}/{orderid}/{productid}", method = RequestMethod.GET)
	public String orderolddetail(ModelMap map, @PathVariable("vendorid") int vendorid, @PathVariable("orderid") int orderid, @PathVariable("productid") int productid) {		
		Date today = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(today);
		map.put("od", orderdetailsService.GetOrderOldDetailVendor(vendorid, orderid, productid, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR)));
		return "vendor.orderolddetail.index";
	}
	
//	 /{vendorid}/{orderid}/{productid}
//	@PathVariable("vendorid") int vendorid, @PathVariable("orderid") int orderid, @PathVariable("productid") int productid
	@RequestMapping(value= "successMail", method = RequestMethod.POST)
	public String successMail(ModelMap map, @RequestParam("vendorid") int vendorid, @RequestParam("orderid") int orderid, @RequestParam("productid") int productid) {		
		Date today = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(today);
		Orderdetails od =  orderdetailsService.GetOrderDetailVendor(vendorid, orderid, productid, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR));
		Orders order = ordersService.find(orderid);
		SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
		if(order.isStatus()) {			
			try {
				mailService.sendHTML(order.getAccount().getEmail(), "npmt0605@gmail.com",
						"Products are being tranporting from PTStore to you. Thanks!", 
						"<html>\r\n"
						+ "    <body style=\"background-color: #e2e1e0; font-family: Open Sans, sans-serif; font-size: 100%; font-weight: 400; \r\n"
						+ "    line-height: 1.4; color: #000;\">\r\n"
						+ "		<ul class=\"breadcrumb\">\r\n"
						+ "            <table style=\"max-width: 670px; margin: 50px auto 10px; background-color: #fff; padding: 50px;\r\n"
						+ "             -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px;\r\n"
						+ "              -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24);\r\n"
						+ "               -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24);\r\n"
						+ "                box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24); border-top: solid 10px rgb(151, 7, 96);\">\r\n"
						+ "					<thead>		\r\n"
						+ "						<tr>\r\n"
						+ "							<th style=\"text-align: left;\"><img style=\"max-width: 150px;\"\r\n"
						+ "									src=\"https://www.bachanatours.in/book/img/logo.png\" alt=\"PTStore\"></th>\r\n"
						+ "							<th style=\"text-align: right; font-weight: 400;\">" + f.format(today) + "</th>			\r\n"
						+ "					</tr>	\r\n"
						+ "					</thead>		\r\n"
						+ "					<tbody>\r\n"
						+ "						<tr>			\r\n"
						+ "							<td style=\"height: 35px;\"></td>\r\n"
						+ "						</tr>			\r\n"
						+ "						<tr>\r\n"
						+ "							<td colspan=\"2\" style=\"border: solid 1px #ddd; padding: 10px 20px;\">\r\n"
						+ "							 	<p style=\"font-size: 14px; margin: 0 0 6px 0;\">\r\n"
						+ "							 		<span style=\"font-weight: bold; display: inline-block; min-width: 150px;\">Order status</span>\r\n"
						+ "									<b style=\"color: green; font-weight: normal; margin: 0;\">transport</b>\r\n"
						+ "							 	</p>\r\n"
						+ "							 	<p style=\"font-size: 14px; margin: 0 0 6px 0;\">\r\n"
						+ "									<span style=\"font-weight: bold; display: inline-block; min-width: 146px;\">Order ID</span> \r\n"
						+ "									"+ od.getOrders().getId() +"  \r\n"
						+ "								</p>\r\n"
						+ "								<p style=\"font-size: 14px; margin: 0 0 0 0;\">\r\n"
						+ "									<span style=\"font-weight: bold; display: inline-block; min-width: 146px;\">Order amount</span>\r\n"
						+ "								 	"+od.getAmount()+"  \r\n"
						+ "								</p> \r\n"
						+ "								<p style=\"font-size: 14px; margin: 0 0 0 0;\">\r\n"
						+ "							 		<span style=\"font-weight: bold; display: inline-block; min-width: 146px;\">Order Date</span>"
						+ "									"+od.getOrders().getOrderDate()+"	\r\n"
						+ "								</p>		\r\n"
						+ "							</td>\r\n"
						+ "						</tr>		\r\n"
						+ "						<tr>\r\n"
						+ "							<td style=\"height: 35px;\"></td>		\r\n"
						+ "						</tr>\r\n"
						+ "						<tr>\r\n"
						+ "							<td style=\"width: 50%; padding: 20px; vertical-align: top;\">\r\n"
						+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">You</span>\r\n"
						+ "									"+od.getOrders().getAccount().getFullname()+" \r\n"
						+ "							 	</p>\r\n"
						+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">Email</span>\r\n"
						+ "									"+od.getOrders().getAccount().getEmail()+"		\r\n"
						+ "								</p>\r\n"
						+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">Phone</span>\r\n"
						+ "							 		"+od.getOrders().getPhone()+"				\r\n"
						+ "								</p>\r\n"
						+ "							</td>\r\n"
						+ "							<td style=\"width: 50%; padding: 20px; vertical-align: top;\">\r\n"
						+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "									<span style=\"display: block; font-weight: bold; font-size: 13px;\">Address</span>\r\n"
						+ "									"+od.getOrders().getAddress()+"  \r\n"
						+ "								</p>\r\n"
						+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "									<span style=\"display: block; font-weight: bold; font-size: 13px;\">Notes:\r\n"
						+ "									</span>  "+od.getOrders().getDescription()+"  \r\n"
						+ "								</p>\r\n"
						+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "									<span style=\"display: block; font-weight: bold; font-size: 13px;\">Payment:</span> \r\n"
						+ "									"+ (od.getOrders().getPayment() == 1 ? "Cash" : "Paypal" ) +"  \r\n"
						+ "								</p>			\r\n"
						+ "							</td>\r\n"
						+ "						</tr>\r\n"
						+ "						<tr>\r\n"
						+ "							<td colspan=\"2\" style=\"font-size: 20px; padding: 30px 15px 0 15px;\">Product detail</td>\r\n"
						+ "						</tr>\r\n"
						+ "						<tr>\r\n"
						+ "							<td style=\"width: 50%; padding: 20px; vertical-align: top;\">\r\n"
						+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">ID</span>\r\n"
						+ "									"+od.getProduct().getId()+" \r\n"
						+ "							 	</p>							 	\r\n"
						+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">Producer</span> "
						+ "									"+od.getProduct().getBrand().getName()+"		\r\n"
						+ "								 </p>								 \r\n"
						+ "							</td>\r\n"
						+ "							<td>\r\n"
						+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">Name</span>\r\n"
						+ "									"+od.getProduct().getName()+"					\r\n"
						+ "								</p>\r\n"
						+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
						+ "									<span style=\"display: block; font-weight: bold; font-size: 13px;\">Quantity</span>\r\n"
						+ "									"+od.getQuantity()+"  \r\n"
						+ "								</p>\r\n"
						+ "							</td>								\r\n"
						+ "						</tr>				\r\n"
						+ "					</tbody>		\r\n"
						+ "					<tfooter>		\r\n"
						+ "						<tr>\r\n"
						+ "							<td colspan=\"2\" style=\"font-size: 14px; padding: 50px 15px 0 15px;\">\r\n"
						+ "								<strong style=\"display: block; margin: 0 0 10px 0;\">Regards</strong>\r\n"
						+ "								PTStore\r\n"
						+ "								<br> \r\n"
						+ "								Thong Tony, Pin/Zip - 70000, 24-26 Phan Liem, Ho Chi Minh city, Viet Nam\r\n"
						+ "								<br> <br> \r\n"
						+ "								<b>Phone:</b> 0969-275-695\r\n"
						+ "								<br>\r\n"
						+ "								<b>Email:</b> contact@ptstore.vi\r\n"
						+ "							</td>\r\n"
						+ "						</tr>\r\n"
						+ "					</tfooter>\r\n"
						+ "	</table>\r\n"
						+ "</body>\r\n"
						+ "</html>"			
				);
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}		
		} else {
			if(ordersService.setStatus(orderid)) {
				try {
					mailService.sendHTML(order.getAccount().getEmail(), "npmt0605@gmail.com",
							"Products are being tranporting from PTStore to you. Thanks!", 
							"<html>\r\n"
									+ "    <body style=\"background-color: #e2e1e0; font-family: Open Sans, sans-serif; font-size: 100%; font-weight: 400; \r\n"
									+ "    line-height: 1.4; color: #000;\">\r\n"
									+ "		<ul class=\"breadcrumb\">\r\n"
									+ "            <table style=\"max-width: 670px; margin: 50px auto 10px; background-color: #fff; padding: 50px;\r\n"
									+ "             -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px;\r\n"
									+ "              -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24);\r\n"
									+ "               -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24);\r\n"
									+ "                box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24); border-top: solid 10px rgb(151, 7, 96);\">\r\n"
									+ "					<thead>		\r\n"
									+ "						<tr>\r\n"
									+ "							<th style=\"text-align: left;\"><img style=\"max-width: 150px;\"\r\n"
									+ "									src=\"https://www.bachanatours.in/book/img/logo.png\" alt=\"PTStore\"></th>\r\n"
									+ "							<th style=\"text-align: right; font-weight: 400;\">" + f.format(today) + "</th>			\r\n"
									+ "					</tr>	\r\n"
									+ "					</thead>		\r\n"
									+ "					<tbody>\r\n"
									+ "						<tr>			\r\n"
									+ "							<td style=\"height: 35px;\"></td>\r\n"
									+ "						</tr>			\r\n"
									+ "						<tr>\r\n"
									+ "							<td colspan=\"2\" style=\"border: solid 1px #ddd; padding: 10px 20px;\">\r\n"
									+ "							 	<p style=\"font-size: 14px; margin: 0 0 6px 0;\">\r\n"
									+ "							 		<span style=\"font-weight: bold; display: inline-block; min-width: 150px;\">Order status</span>\r\n"
									+ "									<b style=\"color: green; font-weight: normal; margin: 0;\">transport</b>\r\n"
									+ "							 	</p>\r\n"
									+ "							 	<p style=\"font-size: 14px; margin: 0 0 6px 0;\">\r\n"
									+ "									<span style=\"font-weight: bold; display: inline-block; min-width: 146px;\">Order ID</span> \r\n"
									+ "									"+ od.getOrders().getId() +"  \r\n"
									+ "								</p>\r\n"
									+ "								<p style=\"font-size: 14px; margin: 0 0 0 0;\">\r\n"
									+ "									<span style=\"font-weight: bold; display: inline-block; min-width: 146px;\">Order amount</span>\r\n"
									+ "								 	"+od.getAmount()+"  \r\n"
									+ "								</p> \r\n"
									+ "								<p style=\"font-size: 14px; margin: 0 0 0 0;\">\r\n"
									+ "							 		<span style=\"font-weight: bold; display: inline-block; min-width: 146px;\">Order Date</span>"
									+ "									"+od.getOrders().getOrderDate()+"	\r\n"
									+ "								</p>		\r\n"
									+ "							</td>\r\n"
									+ "						</tr>		\r\n"
									+ "						<tr>\r\n"
									+ "							<td style=\"height: 35px;\"></td>		\r\n"
									+ "						</tr>\r\n"
									+ "						<tr>\r\n"
									+ "							<td style=\"width: 50%; padding: 20px; vertical-align: top;\">\r\n"
									+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">You</span>\r\n"
									+ "									"+od.getOrders().getAccount().getFullname()+" \r\n"
									+ "							 	</p>\r\n"
									+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">Email</span>\r\n"
									+ "									"+od.getOrders().getAccount().getEmail()+"		\r\n"
									+ "								</p>\r\n"
									+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">Phone</span>\r\n"
									+ "							 		"+od.getOrders().getPhone()+"				\r\n"
									+ "								</p>\r\n"
									+ "							</td>\r\n"
									+ "							<td style=\"width: 50%; padding: 20px; vertical-align: top;\">\r\n"
									+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "									<span style=\"display: block; font-weight: bold; font-size: 13px;\">Address</span>\r\n"
									+ "									"+od.getOrders().getAddress()+"  \r\n"
									+ "								</p>\r\n"
									+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "									<span style=\"display: block; font-weight: bold; font-size: 13px;\">Notes:\r\n"
									+ "									</span>  "+od.getOrders().getDescription()+"  \r\n"
									+ "								</p>\r\n"
									+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "									<span style=\"display: block; font-weight: bold; font-size: 13px;\">Payment:</span> \r\n"
									+ "									"+ (od.getOrders().getPayment() == 1 ? "Cash" : "Paypal" ) +"  \r\n"
									+ "								</p>			\r\n"
									+ "							</td>\r\n"
									+ "						</tr>\r\n"
									+ "						<tr>\r\n"
									+ "							<td colspan=\"2\" style=\"font-size: 20px; padding: 30px 15px 0 15px;\">Product detail</td>\r\n"
									+ "						</tr>\r\n"
									+ "						<tr>\r\n"
									+ "							<td style=\"width: 50%; padding: 20px; vertical-align: top;\">\r\n"
									+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">ID</span>\r\n"
									+ "									"+od.getProduct().getId()+" \r\n"
									+ "							 	</p>							 	\r\n"
									+ "							 	<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">Producer</span> "
									+ "									"+od.getProduct().getBrand().getName()+"		\r\n"
									+ "								 </p>								 \r\n"
									+ "							</td>\r\n"
									+ "							<td>\r\n"
									+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "							 		<span style=\"display: block; font-weight: bold; font-size: 13px;\">Name</span>\r\n"
									+ "									"+od.getProduct().getName()+"					\r\n"
									+ "								</p>\r\n"
									+ "								<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "									<span style=\"display: block; font-weight: bold; font-size: 13px;\">Quantity</span>\r\n"
									+ "									"+od.getQuantity()+"  \r\n"
									+ "								</p>\r\n"
									+ "							</td>								\r\n"
									+ "						</tr>				\r\n"
									+ "					</tbody>		\r\n"
									+ "					<tfooter>		\r\n"
									+ "						<tr>\r\n"
									+ "							<td colspan=\"2\" style=\"font-size: 14px; padding: 50px 15px 0 15px;\">\r\n"
									+ "								<strong style=\"display: block; margin: 0 0 10px 0;\">Regards</strong>\r\n"
									+ "								PTStore\r\n"
									+ "								<br> \r\n"
									+ "								Thong Tony, Pin/Zip - 70000, 24-26 Phan Liem, Ho Chi Minh city, Viet Nam\r\n"
									+ "								<br> <br> \r\n"
									+ "								<b>Phone:</b> 0969-275-695\r\n"
									+ "								<br>\r\n"
									+ "								<b>Email:</b> contact@ptstore.vi\r\n"
									+ "							</td>\r\n"
									+ "						</tr>\r\n"
									+ "					</tfooter>\r\n"
									+ "	</table>\r\n"
									+ "</body>\r\n"
									+ "</html>"						
					);
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}		
			}
		}
		return "vendor.successmail.index";
	}
	
	@RequestMapping(value = "searchbyid", method = RequestMethod.POST)
	public String searchbyid(@RequestParam("orderid") String orderid, ModelMap map, HttpServletRequest request, HttpSession session) {
		int id1 = Integer.parseInt(orderid.trim());
		int vendorId = (int) session.getAttribute("vendorId");
		Date today = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(today);
		
		List<Orderdetails> orders = orderdetailsService.SearchByOrderId(vendorId, id1, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR));
		
		PagedListHolder pagedListHolder = new PagedListHolder(orders);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(20);
		map.put("pagedListHolder", pagedListHolder);
		map.put("orderid", id1);
		return "vendor.order.index";
	}
	
	@RequestMapping(value = "searchbyorderidold", method = RequestMethod.POST)
	public String searchbyorderidold(@RequestParam("orderid") String orderid, ModelMap map, HttpServletRequest request, HttpSession session) {
		int id1 = Integer.parseInt(orderid.trim());
		int vendorId = (int) session.getAttribute("vendorId");
		Date today = new Date();
		Calendar c = Calendar.getInstance();
		c.setTime(today);
		
		List<Orderdetails> orders = orderdetailsService.SearchByOrderIdOld(vendorId, id1, c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR));
		
		PagedListHolder pagedListHolder = new PagedListHolder(orders);
		int page = ServletRequestUtils.getIntParameter(request, "page", 0);
		pagedListHolder.setPage(page);
		pagedListHolder.setPageSize(20);
		map.put("pagedListHolder", pagedListHolder);
		map.put("orderid", id1);
		return "vendor.orderold.index";
	}
	
	@RequestMapping(value = "searchbydateold", method = RequestMethod.POST)
	public String searchbydateold(@RequestParam("orderDate") String orderDate, ModelMap map, HttpServletRequest request, HttpSession session) throws ParseException {	
			SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
			Date oldDate = format.parse(orderDate);
			Calendar c2 = Calendar.getInstance();
			c2.setTime(oldDate);
			
			int vendorId = (int) session.getAttribute("vendorId");
			Date today = new Date();
			Calendar c = Calendar.getInstance();
			c.setTime(today);
			
			List<Orderdetails> orders = orderdetailsService.SearchByOrderDateOld(vendorId, c2.get(Calendar.DAY_OF_MONTH), c2.get(Calendar.MONTH) + 1, c2.get(Calendar.YEAR), c.get(Calendar.DAY_OF_MONTH), c.get(Calendar.MONTH) + 1, c.get(Calendar.YEAR));
			
			PagedListHolder pagedListHolder = new PagedListHolder(orders);
			int page = ServletRequestUtils.getIntParameter(request, "page", 0);
			pagedListHolder.setPage(page);
			pagedListHolder.setPageSize(50);
			map.put("pagedListHolder", pagedListHolder);
			map.put("orderDate", orderDate);
			return "vendor.orderold.index";
		
	}
}
