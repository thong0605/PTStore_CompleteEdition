package com.ptstore.controllers.customer;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ptstore.models.Account;
import com.ptstore.models.Orderdetails;
import com.ptstore.models.OrderdetailsId;
import com.ptstore.models.Orders;
import com.ptstore.models.Product;
import com.ptstore.services.CustomerService;
import com.ptstore.services.MailService;
import com.ptstore.services.OrderdetailsService;
import com.ptstore.services.OrdersService;
import com.ptstore.services.ProductService;

@Controller
@RequestMapping({ "cart" })
public class CartController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private OrdersService orderService;

	@Autowired
	private OrderdetailsService orderdetailsService;

	@Autowired
	private MailService mailService;

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession session) {

		if (session.getAttribute("customer") != null) {
			int count = 0;
			int countItems = 0;
			if (session.getAttribute("cart") != null) {
				List<Orderdetails> cart = (List<Orderdetails>) session.getAttribute("cart");
				for (Orderdetails item : cart) {
					count = item.getQuantity();
					countItems += count;
				}
				// countItems = cart.size();
			}
			modelMap.put("countItems", countItems);
			modelMap.put("breadcumb", "SHOPPING CART");
			return "cart.index";
		} else {
			return "redirect:/customer/login?notlogin";
		}
	}

	@RequestMapping(value = "buy/{id}", method = RequestMethod.GET)
	public String buy(@PathVariable("id") int id, HttpSession session) {
		if (session.getAttribute("customer") != null) {
			Product product = productService.find(id);
			// if cart is empty, create new cart session
			if (session.getAttribute("cart") == null) {
				List<Orderdetails> cart = new ArrayList<Orderdetails>();
				cart.add(new Orderdetails(product, 1));
				session.setAttribute("cart", cart);
			} else {
				List<Orderdetails> cart = (List<Orderdetails>) session.getAttribute("cart");
				int index = this.exists(id, cart);
				if (index == -1) {
					cart.add(new Orderdetails(product, 1));
				} else {
					int quantity = cart.get(index).getQuantity() + 1;
					cart.get(index).setQuantity(quantity);
				}
				session.setAttribute("cart", cart);
			}
			return "redirect:/cart/index";
		} else {
			return "redirect:/customer/login?notlogin";
		}
	}

	@RequestMapping(value = "remove/{id}", method = RequestMethod.GET)
	public String remove(@PathVariable("id") int id, HttpSession session) {
		List<Orderdetails> cart = (List<Orderdetails>) session.getAttribute("cart");
		int index = this.exists(id, cart);
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/cart/index";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@RequestParam("quantities") int[] quantities, HttpSession session) {

		if (session.getAttribute("cart") != null) {
			List<Orderdetails> cart = (List<Orderdetails>) session.getAttribute("cart");
			for (int i = 0; i < cart.size(); i++) {
				cart.get(i).setQuantity(quantities[i]);
			}
			session.setAttribute("cart", cart);
		}
		return "redirect:/cart/index";
	}

	@RequestMapping(value = "checkout", method = RequestMethod.GET)
	public String checkout(ModelMap modelMap, HttpSession session) {
		// check if customer is logged in or not
		if (session.getAttribute("customer") == null) {
			return "redirect:/customer/login";
		} else {
			// call cart session
			List<Orderdetails> cart = (List<Orderdetails>) session.getAttribute("cart");
			int countCart = 0;
			// count cart item
			countCart = cart.size();
			if (cart != null) {
				// if there is no item in cart, return to cart index
				if (countCart != 0) {
					modelMap.put("invoice", new Orders());
					return "cart.checkout";
				}
			}
			return "redirect:/cart/index";
		}
	}

	@RequestMapping(value = "checkout", method = RequestMethod.POST)
	public String checkout(@ModelAttribute("invoice") Orders order, HttpSession session) {
		// create new session as customer
		Account customer = (Account) session.getAttribute("customer");
		if (customer == null) {
			return "redirect:/customer/login";
		} else {
			// new invoice
			order.setAccount(customerService.findByUsername(customer.getUsername()));
			order.setOrderDate(new Date());
			if (order.getPayment() == 2) {
				order.setStatus(true);
			} else {
				order.setStatus(false);
			}
			orderService.save(order);

			// new invoice details
			List<Orderdetails> cart = (List<Orderdetails>) session.getAttribute("cart");
			for (Orderdetails item : cart) {
				Orderdetails orderdetails = new Orderdetails();
				orderdetails.setId(new OrderdetailsId(order.getId(), item.getProduct().getId()));
				orderdetails.setAmount((item.getProduct().getUnitPrice() * (100 - item.getProduct().getDiscount()))
						/ 100 * item.getQuantity());
				orderdetails.setQuantity(item.getQuantity());
				// save every single item detail
				orderdetailsService.save(orderdetails);
			}

			return "redirect:/cart/success";
		}

	}

	@RequestMapping(value = "success", method = RequestMethod.GET)
	public String success(ModelMap modelMap, HttpServletRequest request, HttpSession session) {

		Account customer = (Account) session.getAttribute("customer");
		List<Orderdetails> cart = (List<Orderdetails>) session.getAttribute("cart");
		// check for customer logged in and item in cart
		if (customer != null) {
			if (cart.size() != 0) {

				Orders orders = orderService.findLatestOrder(customer.getId());
				double total = 0;
				String contents = "";
				String payment = "";

				// payment method
				if (orders.getPayment() == 1) {
					payment = "Cash On Delivery";
				} else if (orders.getPayment() == 2) {
					payment = "Credit Card";
				}

				// loop the list item in email html
				for (Orderdetails i : orders.getOrderdetailses()) {
					total += (i.getProduct().getUnitPrice() * (100 - i.getProduct().getDiscount()) / 100
							* i.getQuantity());

					String content = "<p\r\n"
							+ "style=\"font-size: 14px; margin: 0; padding: 10px; border: solid 1px #ddd; font-weight: bold;\">\r\n"
							+ "<span\r\n" + "style=\"display: block; font-size: 13px; font-weight: normal;\">"
							+ i.getProduct().getName() + "\r\n" + "x " + i.getQuantity() + "</span> Total: $"
							+ i.getAmount() + " <b\r\n" + "style=\"font-size: 12px; font-weight: 300;\">[\r\n"
							+ i.getProduct().getUnitPrice() + " / " + i.getProduct().getUnitBrief() + " ]</b>\r\n"
							+ "</p>";
					contents += content;
				}

				modelMap.put("total", total);
				modelMap.put("order", orders);
				modelMap.put("breadcumb", "Purchase");

				// send Email message as invoice HTML for successful purchase
				try {
					mailService.sendHTML(orders.getAccount().getEmail(), "npmt0605@gmail.com",
							"Purchased from PTStore successful",
							"<html>\r\n" + "<body \r\n"
									+ "	style=\"background-color: #e2e1e0; font-family: Open Sans, sans-serif; font-size: 100%; font-weight: 400; line-height: 1.4; color: #000;\">\r\n"
									+ "\r\n" + "	<ul class=\"breadcrumb\">\r\n" + "	<table\r\n"
									+ "		style=\"max-width: 670px; margin: 50px auto 10px; background-color: #fff; padding: 50px; -webkit-border-radius: 3px; -moz-border-radius: 3px; border-radius: 3px; -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24); -moz-box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24); box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24); border-top: solid 10px green;\">\r\n"
									+ "		<thead>\r\n" + "			<tr>\r\n"
									+ "				<th style=\"text-align: left;\"><img style=\"max-width: 150px;\"\r\n"
									+ "					src=\"https://www.bachanatours.in/book/img/logo.png\"\r\n"
									+ "					alt=\"PTStore\"></th>\r\n"
									+ "				<th style=\"text-align: right; font-weight: 400;\">"
									+ orders.getOrderDate() + "</th>\r\n" + "			</tr>\r\n"
									+ "		</thead>\r\n" + "		<tbody>\r\n" + "			<tr>\r\n"
									+ "				<td style=\"height: 35px;\"></td>\r\n" + "			</tr>\r\n"
									+ "			<tr>\r\n"
									+ "				<td colspan=\"2\" style=\"border: solid 1px #ddd; padding: 10px 20px;\">\r\n"
									+ "					<p style=\"font-size: 14px; margin: 0 0 6px 0;\">\r\n"
									+ "						<span\r\n"
									+ "							style=\"font-weight: bold; display: inline-block; min-width: 150px\">Order\r\n"
									+ "							status</span><b style=\"color: green; font-weight: normal; margin: 0\">Pending</b>\r\n"
									+ "					</p>\r\n"
									+ "					<p style=\"font-size: 14px; margin: 0 0 6px 0;\">\r\n"
									+ "						<span\r\n"
									+ "							style=\"font-weight: bold; display: inline-block; min-width: 146px\">Order\r\n"
									+ "							ID</span> #" + orders.getId() + "</p>\r\n"
									+ "					<p style=\"font-size: 14px; margin: 0 0 0 0;\">\r\n"
									+ "						<span\r\n"
									+ "							style=\"font-weight: bold; display: inline-block; min-width: 146px\">Order\r\n"
									+ "							amount</span> $" + total + "\r\n"
									+ "					</p>\r\n <p style=\"font-size: 14px; margin: 0 0 0 0;\">\r\n"
									+ "						<span\r\n"
									+ "							style=\"font-weight: bold; display: inline-block; min-width: 146px\">Created Date</span>"
									+ orders.getOrderDate() + "\r\n" + "					</p>"
									+ "				</td>\r\n" + "			</tr>\r\n" + "			<tr>\r\n"
									+ "				<td style=\"height: 35px;\"></td>\r\n" + "			</tr>\r\n"
									+ "			<tr>\r\n"
									+ "				<td style=\"width: 50%; padding: 20px; vertical-align: top\">\r\n"
									+ "					<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "						<span style=\"display: block; font-weight: bold; font-size: 13px\">Name</span>\r\n"
									+ orders.getAccount().getFullname() + "						\r\n"
									+ "					</p>\r\n"
									+ "					<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "						<span style=\"display: block; font-weight: bold; font-size: 13px;\">Email</span>\r\n"
									+ orders.getAccount().getEmail() + "				\r\n"
									+ "					</p>\r\n"
									+ "					<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "						<span style=\"display: block; font-weight: bold; font-size: 13px;\">Phone</span>\r\n"
									+ orders.getPhone() + "\r\n" + "					</p>\r\n"
									+ "					<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "						<span style=\"display: block; font-weight: bold; font-size: 13px;\">ID\r\n"
									+ "							No.</span> 000-0000-0000\r\n"
									+ "					</p>\r\n" + "				</td>\r\n"
									+ "				<td style=\"width: 50%; padding: 20px; vertical-align: top\">\r\n"
									+ "					<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "						<span style=\"display: block; font-weight: bold; font-size: 13px;\">Address</span>\r\n"
									+ orders.getAddress() + "</p>\r\n"
									+ "					<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "						<span style=\"display: block; font-weight: bold; font-size: 13px;\">Notes:\r\n"
									+ "						</span>" + orders.getDescription() + "\r\n"
									+ "					</p>\r\n"
									+ "					<p style=\"margin: 0 0 10px 0; padding: 0; font-size: 14px;\">\r\n"
									+ "						<span style=\"display: block; font-weight: bold; font-size: 13px;\">Payment:\r\n"
									+ "						</span>" + payment + "</p>\r\n" + "				</td>\r\n"
									+ "			</tr>\r\n" + "<tr>\r\n"
									+ "				<td colspan=\"2\" style=\"font-size: 20px; padding: 30px 15px 0 15px;\">Items detail</td>\r\n"
									+ "			</tr>\r\n" + "			<tr>\r\n"
									+ "				<td colspan=\"2\" style=\"padding: 15px;\">" + contents
									+ "</td>\r\n" + "</tr>\r\n" + "		</tbody>\r\n" + "		<tfooter>\r\n"
									+ "		<tr>\r\n"
									+ "			<td colspan=\"2\" style=\"font-size: 14px; padding: 50px 15px 0 15px;\">\r\n"
									+ "				<strong style=\"display: block; margin: 0 0 10px 0;\">Regards</strong>\r\n"
									+ "				PTStore<br> Thong Tony, Pin/Zip - 70000, 24-26 Phan Liem, Sai\r\n"
									+ "				Gon, Viet Nam<br> <br> <b>Phone:</b> 0969-275-695<br>\r\n"
									+ "				<b>Email:</b> contact@ptstore.vi\r\n" + "			</td>\r\n"
									+ "		</tr>\r\n" + "		</tfooter>\r\n" + "	</table>\r\n" + "</body>"
									+ "</html>");
					// mailService.sendHTML("lynlam2018@gmail.com", "mylynlam@gmail.com", "Hello",
					// "<b><i><u>How are you?</u></i></b>");
					System.out.println("ok");
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}

				session.removeAttribute("cart");
				return "cart.success";
			}
		}
		return "redirect:/cart/index";

	}

	private int exists(int id, List<Orderdetails> cart) {
		for (int i = 0; i < cart.size(); i++) {
			if (cart.get(i).getProduct().getId() == id) {
				return i;
			}
		}
		return -1;
	}
}