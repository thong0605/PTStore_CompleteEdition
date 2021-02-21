package com.ptstore.controllers.admin;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
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
import com.ptstore.models.Orders;
import com.ptstore.models.Product;
import com.ptstore.models.Rate;

import com.ptstore.services.AdminService;
import com.ptstore.services.MailService;
import com.ptstore.services.OrdersService;
import com.ptstore.services.ProductService;
import com.ptstore.services.RateService;

@Controller
@RequestMapping({ "adminaccount" })
public class AdminController {
	@Autowired
	private MailService mailService;
	@Autowired
	private AdminService accountService;
	@Autowired
	private OrdersService ordersService;
	@Autowired
	private RateService rateService;
	@Autowired
	private ProductService productService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			// list customers
			List<Account> customers = (List<Account>) accountService.FindCustomer();
			PagedListHolder pagedListHoldercustomers = new PagedListHolder(customers);
			int page = ServletRequestUtils.getIntParameter(request, "c", 0);
			pagedListHoldercustomers.setPage(page);
			pagedListHoldercustomers.setPageSize(7);
			modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
			// List Vendors
			List<Account> vendors = (List<Account>) accountService.FindVendor();
			PagedListHolder pagedListHoldervendors = new PagedListHolder(vendors);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHoldervendors.setPage(page2);
			pagedListHoldervendors.setPageSize(7);
			modelMap.put("pagedListHoldervendors", pagedListHoldervendors);
			return "account.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "product", method = RequestMethod.GET)
	public String product(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Product> products = (List<Product>) productService.sort1();
			PagedListHolder pagedListHolderproducts = new PagedListHolder(products);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderproducts.setPage(page2);
			pagedListHolderproducts.setPageSize(7);
			modelMap.put("pagedListHolderproducts", pagedListHolderproducts);
			return "product.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "rate", method = RequestMethod.GET)
	public String rate(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Rate> rates = (List<Rate>) rateService.findAll();
			PagedListHolder pagedListHolderrates = new PagedListHolder(rates);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderrates.setPage(page2);
			pagedListHolderrates.setPageSize(8);
			modelMap.put("pagedListHolderrates", pagedListHolderrates);
			return "rate.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "statistics", method = RequestMethod.GET)
	public String statistics(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			Calendar cal = Calendar.getInstance();
			int year = cal.get(Calendar.YEAR);
			int month = cal.get(Calendar.MONTH) + 1;
			int neworders = ordersService.Showordersneww(year, month);
			int newproducts = productService.ShownewProducts(year, month);
			int newaccountcustomer = accountService.ShownewAccount(year, month, 3);
			int newaccountvendor = accountService.ShownewAccount(year, month, 2);
			int totalnewaccount = (newaccountcustomer + newaccountvendor);
			modelMap.put("neworders", neworders);
			modelMap.put("newproducts", newproducts);
			modelMap.put("totalnewaccount", totalnewaccount);
			return "statistics.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "orders", method = RequestMethod.GET)
	public String orders(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Orders> orders = (List<Orders>) ordersService.FindOrders();
			PagedListHolder pagedListHolderoders = new PagedListHolder(orders);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderoders.setPage(page2);
			pagedListHolderoders.setPageSize(7);
			modelMap.put("pagedListHolderoders", pagedListHolderoders);
			return "orders.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(ModelMap modelMap) {
		return "admin.login.index";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(ModelMap modelMap, @RequestParam("username") String username,
			@RequestParam("password") String password, HttpServletRequest request) {
		Account admin = accountService.checkUsername(username);
		if (accountService.checkUsername(username) != null) {
			boolean result = BCrypt.checkpw(password, admin.getPassword());
			if (result) {
				HttpSession session = request.getSession();
				session.setAttribute("name", username);
				return "redirect:/adminaccount/statistics";
			} else {
				modelMap.put("failed", "The password that you've entered is incorrect");
				return "admin.login.index";
			}
		} else {
			modelMap.put("failed", "Account Doesn't Exist");
			return "admin.login.index";
		}
	}

	@RequestMapping(value = "deleteproduct/{id}", method = RequestMethod.GET)
	public String deleteproduct(@PathVariable("id") int id, Product product, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			product = productService.find(id);
			String nameproduct = product.getName();
			product.setStatus(false);
			productService.save(product);
			try {
				mailService.sendHTML(product.getAccount().getEmail(), "heyboykute20000@gmail.com", "Delete Product", ""
						+ "<table style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\r\n"
						+ "          <tbody><tr>\r\n"
						+ "            <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "\r\n"
						+ "              <table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\r\n"
						+ "                <tbody><tr>\r\n"
						+ "                  <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "                    \r\n"
						+ "                      <h1 style=\"font-weight:normal;margin:0;font-size:30px;color:#333\">\r\n"
						+ "                        <a style=\"font-size:30px;text-decoration:none;color:#333\" target=\"_blank\";source=gmail&amp;ust=1609659821286000&amp;usg=AFQjCNE0pu4exhn5ohy1Mul3apxvhEsyjA\">PT Store</a>\r\n"
						+ "                      </h1>\r\n" + "                    \r\n" + "                  </td>\r\n"
						+ "\r\n"
						+ "                    <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;text-transform:uppercase;font-size:14px;text-align:right;color:#999\">\r\n"
						+ "                      <span style=\"font-size:16px\">\r\n" + "                        "
						+ "Product: " + nameproduct + "\r\n" + "                      </span>\r\n"
						+ "                    </td>\r\n" + "                </tr>\r\n"
						+ "              </tbody></table>\r\n" + "\r\n" + "            </td>\r\n"
						+ "          </tr>\r\n" + "        </tbody></table>"
						+ "<table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\r\n"
						+ "  <tbody><tr>\r\n"
						+ "    <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;padding-bottom:40px\">\r\n"
						+ "      <center>\r\n"
						+ "        <table style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\r\n"
						+ "          <tbody><tr>\r\n"
						+ "            <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "              \r\n"
						+ "            <h2 style=\"font-weight:normal;margin:0;font-size:24px;margin-bottom:10px;color:blue;\">Your Product is Delete! </h2>\r\n"
						+ "            <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">Hello, your product has been removed by us, because your product does not guarantee quality or violates 1 of the rules of product standards.</p>\r\n"
						+ "            \r\n"
						+ "              <table style=\"border-spacing:0;border-collapse:collapse;width:100%;margin-top:20px\">\r\n"
						+ "  </table>\r\n" + "\r\n" + "\r\n" + "    </td>\r\n" + "  </tr>\r\n" + "</tbody></table>\r\n"
						+ "\r\n" + "            \r\n" + "\r\n" + "            </td>\r\n" + "          </tr>\r\n"
						+ "        </tbody></table>\r\n" + "      </center>\r\n" + "    </td>\r\n" + "  </tr>\r\n"
						+ "</tbody></table>" + "");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "redirect:/adminaccount/product";
	}

	@RequestMapping(value = "ratingsendmail/{id}", method = RequestMethod.GET)
	public String ratingsendmail(@PathVariable("id") int id, Rate rate, HttpServletRequest request, ModelMap modelMap) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			rate = rateService.find(id);
			try {
				mailService.sendHTML(rate.getProduct().getAccount().getEmail(), "heyboykute20000@gmail.com",
						"Warning ...",
						"" + "<table style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\r\n"
								+ "          <tbody><tr>\r\n"
								+ "            <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
								+ "\r\n"
								+ "              <table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\r\n"
								+ "                <tbody><tr>\r\n"
								+ "                  <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
								+ "                    \r\n"
								+ "                      <h1 style=\"font-weight:normal;margin:0;font-size:30px;color:#333\">\r\n"
								+ "                        <a style=\"font-size:30px;text-decoration:none;color:#333\" target=\"_blank\";source=gmail&amp;ust=1609659821286000&amp;usg=AFQjCNE0pu4exhn5ohy1Mul3apxvhEsyjA\">PT Store</a>\r\n"
								+ "                      </h1>\r\n" + "                    \r\n"
								+ "                  </td>\r\n" + "\r\n"
								+ "                    <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;text-transform:uppercase;font-size:14px;text-align:right;color:#999\">\r\n"
								+ "                      <span style=\"font-size:16px\">\r\n"
								+ "                        " + "Product: " + rate.getProduct().getName() + "\r\n"
								+ "                      </span>\r\n" + "                    </td>\r\n"
								+ "                </tr>\r\n" + "              </tbody></table>\r\n" + "\r\n"
								+ "            </td>\r\n" + "          </tr>\r\n" + "        </tbody></table>"
								+ "<table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\r\n"
								+ "  <tbody><tr>\r\n"
								+ "    <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;padding-bottom:40px\">\r\n"
								+ "      <center>\r\n"
								+ "        <table style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\r\n"
								+ "          <tbody><tr>\r\n"
								+ "            <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
								+ "              \r\n"
								+ "            <h2 style=\"font-weight:normal;margin:0;font-size:24px;margin-bottom:10px;color:red;\">Your Product Has Been Warned</h2>\r\n"
								+ "            <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">Hello, Your product may be removed by us. Because the number of customers vote 1 star too much .</p>\r\n"
								+ "            \r\n"
								+ "              <table style=\"border-spacing:0;border-collapse:collapse;width:100%;margin-top:20px\">\r\n"
								+ "  </table>\r\n" + "\r\n" + "\r\n" + "    </td>\r\n" + "  </tr>\r\n"
								+ "</tbody></table>\r\n" + "\r\n" + "            \r\n" + "\r\n"
								+ "            </td>\r\n" + "          </tr>\r\n" + "        </tbody></table>\r\n"
								+ "      </center>\r\n" + "    </td>\r\n" + "  </tr>\r\n" + "</tbody></table>" + "");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			List<Rate> rates = (List<Rate>) rateService.findAll();
			PagedListHolder pagedListHolderrates = new PagedListHolder(rates);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderrates.setPage(page2);
			pagedListHolderrates.setPageSize(8);
			modelMap.put("pagedListHolderrates", pagedListHolderrates);
			return "rate.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	// Search Product
	@RequestMapping(value = "searchproduct", method = RequestMethod.POST)
	public String searchproduct(@RequestParam("keyword") String keyword, ModelMap modelMap,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Product> products = (List<Product>) productService.searchProduct(keyword.trim());
			PagedListHolder pagedListHolderproducts = new PagedListHolder(products);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderproducts.setPage(page2);
			pagedListHolderproducts.setPageSize(7);
			modelMap.put("pagedListHolderproducts", pagedListHolderproducts);
			modelMap.put("keyword", keyword);
			return "product.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	// Search Created Orders
	@RequestMapping(value = "searchorderscreated", method = RequestMethod.POST)
	public String searchorderscreated(@RequestParam("startdate") String startdate,
			@RequestParam("enddate") String enddate, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			try {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date startt = simpleDateFormat.parse(startdate);
				Date endd = simpleDateFormat.parse(enddate);
				List<Orders> orders = (List<Orders>) ordersService.searchordersCreated(startt, endd);
				PagedListHolder pagedListHolderoders = new PagedListHolder(orders);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHolderoders.setPage(page2);
				pagedListHolderoders.setPageSize(7);
				modelMap.put("pagedListHolderoders", pagedListHolderoders);
				return "orders.index";
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "orders.index";
	}

	// Search Created Product
	@RequestMapping(value = "searchproductcreated", method = RequestMethod.POST)
	public String searchproductcreated(@RequestParam("startdate") String startdate,
			@RequestParam("enddate") String enddate, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			try {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date startt = simpleDateFormat.parse(startdate);
				Date endd = simpleDateFormat.parse(enddate);
				List<Product> products = (List<Product>) productService.searchproductCreated(startt, endd);
				PagedListHolder pagedListHolderproducts = new PagedListHolder(products);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHolderproducts.setPage(page2);
				pagedListHolderproducts.setPageSize(7);
				modelMap.put("pagedListHolderproducts", pagedListHolderproducts);
				return "product.index";
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "product.index";
	}

	// Search Created Account Customer
	@RequestMapping(value = "searchaccountcreatedcustomer", method = RequestMethod.POST)
	public String searchaccountcreatedcustomer(@RequestParam("startdate") String startdate,
			@RequestParam("enddate") String enddate, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Account> vendors = (List<Account>) accountService.FindVendor();
			PagedListHolder pagedListHoldervendors = new PagedListHolder(vendors);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHoldervendors.setPage(page2);
			pagedListHoldervendors.setPageSize(7);
			modelMap.put("pagedListHoldervendors", pagedListHoldervendors);
			try {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date startt = simpleDateFormat.parse(startdate);
				Date endd = simpleDateFormat.parse(enddate);
				List<Account> account = (List<Account>) accountService.searchAccountCreated(startt, endd, 3);
				PagedListHolder pagedListHoldercustomers = new PagedListHolder(account);
				int page = ServletRequestUtils.getIntParameter(request, "c", 0);
				pagedListHoldercustomers.setPage(page);
				pagedListHoldercustomers.setPageSize(7);
				modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
				return "account.index";
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "account.index";
	}

	// Search Created Account Vendor
	@RequestMapping(value = "searchaccountcreatedvendor", method = RequestMethod.POST)
	public String searchaccountcreatedvendor(@RequestParam("startdate") String startdate,
			@RequestParam("enddate") String enddate, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Account> customers = (List<Account>) accountService.FindCustomer();
			PagedListHolder pagedListHoldercustomers = new PagedListHolder(customers);
			int page = ServletRequestUtils.getIntParameter(request, "c", 0);
			pagedListHoldercustomers.setPage(page);
			pagedListHoldercustomers.setPageSize(7);
			modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
			try {
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date startt = simpleDateFormat.parse(startdate);
				Date endd = simpleDateFormat.parse(enddate);
				List<Account> vendors = (List<Account>) accountService.searchAccountCreated(startt, endd, 2);
				PagedListHolder pagedListHoldervendors = new PagedListHolder(vendors);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHoldervendors.setPage(page2);
				pagedListHoldervendors.setPageSize(7);
				modelMap.put("pagedListHoldervendors", pagedListHoldervendors);
				return "account.index";
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "account.index";
	}

	// Search Oders (Account Username , Phone ,Payment)
	@RequestMapping(value = "searchordersusername", method = RequestMethod.POST)
	public String searchordersusername(@RequestParam("keyword") String keyword, ModelMap modelMap,
			HttpServletRequest request, @RequestParam("Conditions") String Conditions) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			if (Conditions.equalsIgnoreCase("c1")) {
				List<Orders> orders = (List<Orders>) ordersService.FindOrders();
				PagedListHolder pagedListHolderoders = new PagedListHolder(orders);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHolderoders.setPage(page2);
				pagedListHolderoders.setPageSize(7);
				modelMap.put("pagedListHolderoders", pagedListHolderoders);
				return "orders.index";
			} else if (Conditions.equalsIgnoreCase("c2")) {
				List<Orders> orders = (List<Orders>) ordersService.searchordersusername(keyword.trim());
				PagedListHolder pagedListHolderoders = new PagedListHolder(orders);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHolderoders.setPage(page2);
				pagedListHolderoders.setPageSize(7);
				modelMap.put("pagedListHolderoders", pagedListHolderoders);
				return "orders.index";
			} else if (Conditions.equalsIgnoreCase("c3")) {
				List<Orders> orders = (List<Orders>) ordersService.searchodersPhone(keyword.trim());
				PagedListHolder pagedListHolderoders = new PagedListHolder(orders);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHolderoders.setPage(page2);
				pagedListHolderoders.setPageSize(7);
				modelMap.put("pagedListHolderoders", pagedListHolderoders);
				return "orders.index";
			} else {
				if (keyword.equalsIgnoreCase("cash")) {
					List<Orders> orders = (List<Orders>) ordersService.searchodersPayment(1);
					PagedListHolder pagedListHolderoders = new PagedListHolder(orders);
					int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
					pagedListHolderoders.setPage(page2);
					pagedListHolderoders.setPageSize(7);
					modelMap.put("pagedListHolderoders", pagedListHolderoders);
					return "orders.index";
				} else if (keyword.equalsIgnoreCase("Credit")) {
					List<Orders> orders = (List<Orders>) ordersService.searchodersPayment(2);
					PagedListHolder pagedListHolderoders = new PagedListHolder(orders);
					int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
					pagedListHolderoders.setPage(page2);
					pagedListHolderoders.setPageSize(7);
					modelMap.put("pagedListHolderoders", pagedListHolderoders);
					return "orders.index";
				}
			}
			List<Orders> orders = (List<Orders>) ordersService.FindOrders();
			PagedListHolder pagedListHolderoders = new PagedListHolder(orders);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderoders.setPage(page2);
			pagedListHolderoders.setPageSize(7);
			modelMap.put("pagedListHolderoders", pagedListHolderoders);
			return "orders.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "searchproductrate", method = RequestMethod.POST)
	public String searchproductrate(@RequestParam("keyword") int id, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Rate> rates = (List<Rate>) rateService.searchproductid(id);
			PagedListHolder pagedListHolderrates = new PagedListHolder(rates);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderrates.setPage(page2);
			pagedListHolderrates.setPageSize(8);
			modelMap.put("pagedListHolderrates", pagedListHolderrates);
			return "rate.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "deletecustomer/{id}", method = RequestMethod.GET)
	public String deleteCustomer(@PathVariable("id") int id, Account account, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			account = accountService.find(id);
			account.setStatus(false);
			accountService.save(account);
			return "redirect:/adminaccount";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "deletevendor/{id}", method = RequestMethod.GET)
	public String deleteVendor(@PathVariable("id") int id, Account account, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			account = accountService.find(id);
			account.setStatus(false);
			accountService.save(account);
			return "redirect:/adminaccount";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "block/{id}", method = RequestMethod.GET)
	public String block(@PathVariable("id") int id, Account account, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			account = accountService.find(id);
			String username = account.getUsername();
			account.setActivated(false);
			
			accountService.save(account);
			try {
				mailService.sendHTML(account.getEmail(), "heyboykute20000@gmail.com", "Blocked", ""
						+ "<table style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\r\n"
						+ "          <tbody><tr>\r\n"
						+ "            <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "\r\n"
						+ "              <table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\r\n"
						+ "                <tbody><tr>\r\n"
						+ "                  <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "                    \r\n"
						+ "                      <h1 style=\"font-weight:normal;margin:0;font-size:30px;color:#333\">\r\n"
						+ "                        <a style=\"font-size:30px;text-decoration:none;color:#333\" target=\"_blank\";source=gmail&amp;ust=1609659821286000&amp;usg=AFQjCNE0pu4exhn5ohy1Mul3apxvhEsyjA\">PT Store</a>\r\n"
						+ "                      </h1>\r\n" + "                    \r\n" + "                  </td>\r\n"
						+ "\r\n"
						+ "                    <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;text-transform:uppercase;font-size:14px;text-align:right;color:#999\">\r\n"
						+ "                      <span style=\"font-size:16px\">\r\n" + "                        "
						+ "Username: " + username + "\r\n" + "                      </span>\r\n"
						+ "                    </td>\r\n" + "                </tr>\r\n"
						+ "              </tbody></table>\r\n" + "\r\n" + "            </td>\r\n"
						+ "          </tr>\r\n" + "        </tbody></table>"
						+ "<table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\r\n"
						+ "  <tbody><tr>\r\n"
						+ "    <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;padding-bottom:40px\">\r\n"
						+ "      <center>\r\n"
						+ "        <table style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\r\n"
						+ "          <tbody><tr>\r\n"
						+ "            <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "              \r\n"
						+ "            <h2 style=\"font-weight:normal;margin:0;font-size:24px;margin-bottom:10px;color:blue;\">Your Account is Blocked! </h2>\r\n"
						+ "            <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">Hello, Your account is blocked for violating one of our website rules.</p>\r\n"
						+ "            \r\n"
						+ "              <table style=\"border-spacing:0;border-collapse:collapse;width:100%;margin-top:20px\">\r\n"
						+ "  </table>\r\n" + "\r\n" + "\r\n" + "    </td>\r\n" + "  </tr>\r\n" + "</tbody></table>\r\n"
						+ "\r\n" + "            \r\n" + "\r\n" + "            </td>\r\n" + "          </tr>\r\n"
						+ "        </tbody></table>\r\n" + "      </center>\r\n" + "    </td>\r\n" + "  </tr>\r\n"
						+ "</tbody></table>" + "");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "redirect:/adminaccount";
	}

	@RequestMapping(value = "unblock/{id}", method = RequestMethod.GET)
	public String unblock(@PathVariable("id") int id, Account account, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			account = accountService.find(id);
			account.setActivated(true);
			accountService.save(account);
			return "redirect:/adminaccount";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "blockvendor/{id}", method = RequestMethod.GET)
	public String blockvendor(@PathVariable("id") int id, Account account, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			account = accountService.find(id);
			String username = account.getUsername();
			account.setActivated(false);
			accountService.save(account);
			try {
				mailService.sendHTML(account.getEmail(), "heyboykute20000@gmail.com", "Blocked", ""
						+ "<table style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\r\n"
						+ "          <tbody><tr>\r\n"
						+ "            <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "\r\n"
						+ "              <table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\r\n"
						+ "                <tbody><tr>\r\n"
						+ "                  <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "                    \r\n"
						+ "                      <h1 style=\"font-weight:normal;margin:0;font-size:30px;color:#333\">\r\n"
						+ "                        <a style=\"font-size:30px;text-decoration:none;color:#333\" target=\"_blank\";source=gmail&amp;ust=1609659821286000&amp;usg=AFQjCNE0pu4exhn5ohy1Mul3apxvhEsyjA\">PT Store</a>\r\n"
						+ "                      </h1>\r\n" + "                    \r\n" + "                  </td>\r\n"
						+ "\r\n"
						+ "                    <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;text-transform:uppercase;font-size:14px;text-align:right;color:#999\">\r\n"
						+ "                      <span style=\"font-size:16px\">\r\n" + "                        "
						+ "Username: " + username + "\r\n" + "                      </span>\r\n"
						+ "                    </td>\r\n" + "                </tr>\r\n"
						+ "              </tbody></table>\r\n" + "\r\n" + "            </td>\r\n"
						+ "          </tr>\r\n" + "        </tbody></table>"
						+ "<table style=\"border-spacing:0;border-collapse:collapse;width:100%\">\r\n"
						+ "  <tbody><tr>\r\n"
						+ "    <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif;padding-bottom:40px\">\r\n"
						+ "      <center>\r\n"
						+ "        <table style=\"border-spacing:0;border-collapse:collapse;width:560px;text-align:left;margin:0 auto\">\r\n"
						+ "          <tbody><tr>\r\n"
						+ "            <td style=\"font-family:-apple-system,BlinkMacSystemFont,&quot;Segoe UI&quot;,&quot;Roboto&quot;,&quot;Oxygen&quot;,&quot;Ubuntu&quot;,&quot;Cantarell&quot;,&quot;Fira Sans&quot;,&quot;Droid Sans&quot;,&quot;Helvetica Neue&quot;,sans-serif\">\r\n"
						+ "              \r\n"
						+ "            <h2 style=\"font-weight:normal;margin:0;font-size:24px;margin-bottom:10px;color:blue;\">Your Account is Blocked! </h2>\r\n"
						+ "            <p style=\"margin:0;color:#777;line-height:150%;font-size:16px\">Hello, Your account is blocked for violating one of our website rules.</p>\r\n"
						+ "            \r\n"
						+ "              <table style=\"border-spacing:0;border-collapse:collapse;width:100%;margin-top:20px\">\r\n"
						+ "  </table>\r\n" + "\r\n" + "\r\n" + "    </td>\r\n" + "  </tr>\r\n" + "</tbody></table>\r\n"
						+ "\r\n" + "            \r\n" + "\r\n" + "            </td>\r\n" + "          </tr>\r\n"
						+ "        </tbody></table>\r\n" + "      </center>\r\n" + "    </td>\r\n" + "  </tr>\r\n"
						+ "</tbody></table>" + "");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "redirect:/adminaccount";
	}

	@RequestMapping(value = "unblockvendor/{id}", method = RequestMethod.GET)
	public String unblockvendor(@PathVariable("id") int id, Account account, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			account = accountService.find(id);
			account.setActivated(true);
			accountService.save(account);
			return "redirect:/adminaccount";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String Logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("name");
		return "admin.login.index";
	}

	// Search Customer (Username , Email , Full Name , Phone)
	@RequestMapping(value = "searchusername", method = RequestMethod.POST)
	public String searchusernamecustomer(@RequestParam("keyword") String keyword, ModelMap modelMap,
			HttpServletRequest request, @RequestParam("Conditions") String Conditions) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Account> vendors = (List<Account>) accountService.FindVendor();
			PagedListHolder pagedListHoldervendors = new PagedListHolder(vendors);
			int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHoldervendors.setPage(page2);
			pagedListHoldervendors.setPageSize(7);
			modelMap.put("pagedListHoldervendors", pagedListHoldervendors);
			if (Conditions.equalsIgnoreCase("c1")) {
				// list customers
				List<Account> customers = (List<Account>) accountService.searchUsernameCustomer(keyword.trim());
				PagedListHolder pagedListHoldercustomers = new PagedListHolder(customers);
				int page = ServletRequestUtils.getIntParameter(request, "c", 0);
				pagedListHoldercustomers.setPage(page);
				pagedListHoldercustomers.setPageSize(7);
				modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
				modelMap.put("keyword", keyword);
				return "account.index";
			} else if (Conditions.equalsIgnoreCase("c2")) {
				// list customers
				List<Account> customers = (List<Account>) accountService.searchEmailCustomer(keyword.trim());
				PagedListHolder pagedListHoldercustomers = new PagedListHolder(customers);
				int page = ServletRequestUtils.getIntParameter(request, "c", 0);
				pagedListHoldercustomers.setPage(page);
				pagedListHoldercustomers.setPageSize(7);
				modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
				modelMap.put("keyword", keyword);
				return "account.index";
			} else if (Conditions.equalsIgnoreCase("c3")) {
				// list customers
				List<Account> customers = (List<Account>) accountService.searchfullNameCustomer(keyword.trim());
				PagedListHolder pagedListHoldercustomers = new PagedListHolder(customers);
				int page = ServletRequestUtils.getIntParameter(request, "c", 0);
				pagedListHoldercustomers.setPage(page);
				pagedListHoldercustomers.setPageSize(7);
				modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
				modelMap.put("keyword", keyword);
				return "account.index";
			} else if (Conditions.equalsIgnoreCase("c4")) {
				// list customers
				List<Account> customers = (List<Account>) accountService.searchPhoneCustomer(keyword.trim());
				PagedListHolder pagedListHoldercustomers = new PagedListHolder(customers);
				int page = ServletRequestUtils.getIntParameter(request, "c", 0);
				pagedListHoldercustomers.setPage(page);
				pagedListHoldercustomers.setPageSize(7);
				modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
				modelMap.put("keyword", keyword);
				return "account.index";
			} else if (Conditions.equalsIgnoreCase("c5")) {
				// list customers
				List<Account> customers = (List<Account>) accountService.FindCustomer();
				PagedListHolder pagedListHoldercustomers = new PagedListHolder(customers);
				int page = ServletRequestUtils.getIntParameter(request, "c", 0);
				pagedListHoldercustomers.setPage(page);
				pagedListHoldercustomers.setPageSize(7);
				modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
				modelMap.put("keyword", keyword);
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "account.index";
	}

	// Search Vendor
	@RequestMapping(value = "searchusernamevendor", method = RequestMethod.POST)
	public String searchusernamevendor(@RequestParam("keyword") String keyword2, ModelMap modelMap,
			HttpServletRequest request, @RequestParam("Conditions") String Conditions) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			List<Account> customers = (List<Account>) accountService.FindCustomer();
			PagedListHolder pagedListHoldercustomers = new PagedListHolder(customers);
			int page = ServletRequestUtils.getIntParameter(request, "c", 0);
			pagedListHoldercustomers.setPage(page);
			pagedListHoldercustomers.setPageSize(7);
			modelMap.put("pagedListHoldercustomers", pagedListHoldercustomers);
			if (Conditions.equalsIgnoreCase("c1")) {
				// List Vendors
				List<Account> vendors = (List<Account>) accountService.searchUsernameVendor(keyword2.trim());
				PagedListHolder pagedListHoldervendors = new PagedListHolder(vendors);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHoldervendors.setPage(page2);
				pagedListHoldervendors.setPageSize(7);
				modelMap.put("pagedListHoldervendors", pagedListHoldervendors);
				modelMap.put("keyword2", keyword2);
				return "account.index";
			} else if (Conditions.equalsIgnoreCase("c2")) {
				// List Vendors
				List<Account> vendors = (List<Account>) accountService.searchEmailVendor(keyword2.trim());
				PagedListHolder pagedListHoldervendors = new PagedListHolder(vendors);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHoldervendors.setPage(page2);
				pagedListHoldervendors.setPageSize(7);
				modelMap.put("pagedListHoldervendors", pagedListHoldervendors);
				modelMap.put("keyword2", keyword2);
				return "account.index";
			} else if (Conditions.equalsIgnoreCase("c3")) {
				// List Vendors
				List<Account> vendors = (List<Account>) accountService.searchfullNameVendor(keyword2.trim());
				PagedListHolder pagedListHoldervendors = new PagedListHolder(vendors);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHoldervendors.setPage(page2);
				pagedListHoldervendors.setPageSize(7);
				modelMap.put("pagedListHoldervendors", pagedListHoldervendors);
				modelMap.put("keyword2", keyword2);
				return "account.index";
			} else if (Conditions.equalsIgnoreCase("c5")) {
				// List Vendors
				List<Account> vendors = (List<Account>) accountService.FindVendor();
				PagedListHolder pagedListHoldervendors = new PagedListHolder(vendors);
				int page2 = ServletRequestUtils.getIntParameter(request, "p", 0);
				pagedListHoldervendors.setPage(page2);
				pagedListHoldervendors.setPageSize(7);
				modelMap.put("pagedListHoldervendors", pagedListHoldervendors);
				modelMap.put("keyword2", keyword2);
				return "account.index";
			}
		} else {
			return "redirect:/adminaccount/login";
		}
		return "account.index";
	}
	
	@RequestMapping(value ="accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		return "admin.accessDenied.index";
	}
}