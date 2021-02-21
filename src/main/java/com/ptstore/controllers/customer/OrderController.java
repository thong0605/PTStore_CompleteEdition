package com.ptstore.controllers.customer;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ptstore.models.Account;
import com.ptstore.models.Orderdetails;
import com.ptstore.models.Orders;
import com.ptstore.services.MailService;
import com.ptstore.services.OrderdetailsService;
import com.ptstore.services.OrdersService;

@Controller
@RequestMapping({ "orders" })
public class OrderController {

	@Autowired
	private OrdersService orderService;

	@Autowired
	private OrderdetailsService orderdetailsService;

	@Autowired
	private MailService mailService;

	@RequestMapping(value = "history", method = RequestMethod.GET)
	public String history(ModelMap modelMap, HttpSession session) {
		// find customer info by session
		Account customer = (Account) session.getAttribute("customer");

		// if customer doesn't login yet, return to the login page
		if (customer != null) {
			// breadcumb name
			modelMap.put("breadcumb", "Invoice History");

			// list of order
			List<Orders> orders = orderService.ordersHistory(customer.getId());
			modelMap.put("orders", orders);

			// count list of order
			int countOrders = 0;
			countOrders = orders.size();
			modelMap.put("countOrders", countOrders);

			return "orders.history";
		} else {
			return "redirect:/customer/login";
		}
	}

	@RequestMapping(value = "details/{id}", method = RequestMethod.GET)
	public String details(@PathVariable("id") int id, ModelMap modelMap) {

		Orders order = orderService.find(id);
		modelMap.put("order", order);
		modelMap.put("breadcumb", "Invoice " + order.getId());
		return "orders.details";

	}

	@RequestMapping(value = "cancel/{id}", method = RequestMethod.GET)
	public String cancel(@PathVariable("id") int id) {

		Orders order = orderService.find(id);

		// delete related order details
		for (Orderdetails item : order.getOrderdetailses()) {
			orderdetailsService.delete(item.getId());
		}

		// delete order
		orderService.delete(id);

		// get Current time
//		Calendar cal = Calendar.getInstance();
//		Date date = cal.getTime();
//		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
//		String formattedDate = dateFormat.format(date);

		try {
			mailService.sendHTML(order.getAccount().getEmail(), "npmt0605@gmail.com", "Cancel order from PTStore",
					"Your order #" + order.getId() + " has been terminated successfully on " + new Date());
			System.out.println("ok");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:/orders/history";
	}

}