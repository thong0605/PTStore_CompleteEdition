package com.ptstore.controllers.customer;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.ptstore.models.Account;
import com.ptstore.models.Role;
import com.ptstore.services.CustomerService;
import com.ptstore.services.MailService;
import com.ptstore.validations.CustomerValidation;

@Controller
@RequestMapping({ "customer", "customer/login" })
public class CustomerController implements ServletContextAware {

	@Autowired
	private CustomerValidation customerValidation;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private MailService mailService;

	private ServletContext servletContext;

	// login get with messages
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			@RequestParam(value = "notexists", required = false) String notexists,
			@RequestParam(value = "notlogin", required = false) String notlogin,
			@RequestParam(value = "changepassword", required = false) String changepassword, ModelMap modelMap,
			HttpSession session, HttpServletRequest request) {
		modelMap.put("breadcumb", "Login");
		if (session.getAttribute("customer") == null) {
			if (error != null) {
				modelMap.put("error",
						"Invalid username or password or you might not have the permission to access to this site !");
			}
			if (logout != null) {
				modelMap.put("logout", "Logout successfully");
			}
			if (notlogin != null) {
				modelMap.put("notlogin", "Please login to continue !");
			}
			if (notexists != null) {
				modelMap.put("notexists", "Account doesn't exists !");
			}
			if (changepassword != null) {
				modelMap.put("changepassword", "Change password successfully. Login again");
			}
			return "customer.login";
		}
		return "redirect:../home";
	}

//	// login post
	@RequestMapping(value = "processLogin", method = RequestMethod.POST)
	public String login(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpSession session) {

		// find account by customer
		Account customer = customerService.findByUsername(username);
		// Set<Role> roles = new HashSet<Role>();
		// Role r = roleService.find(3);
		// roles.add(r);
		// customer.getRoles().equals(roles);

		// HashPassword and check if passwords match, account as customer role and is
		// activated or not.
		if (customer != null) {
			if (BCrypt.checkpw(password, customer.getPassword()) && customer.getRole().getId() == 3
					&& customer.isActivated() == true) {
				// set a login session as customer
				session.setAttribute("customer", customer);
				return "redirect:/home";
			} else {
				// if not return to login page
				return "redirect:/customer/login?error";
			}
		} else {
			// if the account doesn't exists, return to login page
			return "redirect:/customer/login?notexists";
		}
	}

	// log out
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		// Remove session
		session.removeAttribute("customer");

		// Remove cart session if it exists
		if (session.getAttribute("cart") != null) {
			session.removeAttribute("cart");
		}

		return "redirect:/customer/login?logout";
	}

	// register
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(@RequestParam(value = "error", required = false) String error, HttpSession session,
			ModelMap modelMap) {
		modelMap.put("breadcumb", "Register");
		if (error != null) {
			modelMap.put("error", "Account already existed. User a new username !");
		}
		// if account is already logged in, return to home page error
		if (session.getAttribute("customer") != null) {
			return "home.error";
		} else {
			modelMap.put("customer", new Account());
			return "customer.register";
		}

	}

	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(@ModelAttribute("customer") @Valid Account customer, ModelMap modelMap,
			BindingResult bindingResult, @RequestParam("file") MultipartFile image) {

		// customer validation
		customerValidation.validate(customer, bindingResult);

		// check username or gmail exists!
		if (customerService.findByUsername(customer.getUsername()) == null) {
			if (bindingResult.hasErrors()) {
				return "customer.register";
			} else {
				// HashPassword
				String hash = BCrypt.hashpw(customer.getPassword(), BCrypt.gensalt());
				customer.setPassword(hash);

				// set default role as customer
//				Role role = roleService.find(3);
//				customer.getRoles().add(role);
				Role role = new Role();
				role.setId(3);
				customer.setRole(role);

				// set account activated
				customer.setActivated(true);
				customer.setStatus(true);
				customer.setCreated(new Date());

				// import photo
				String filename = saveImage(image);
				customer.setPhoto(filename);

				// save customer
				customerService.save(customer);
				return "customer.login";
			}
		} else {
			return "redirect:/customer/register?error";
		}

	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(HttpSession session) {
		// get customer by session
		Account customer = (Account) session.getAttribute("customer");
		// set activated to false
		customer.setActivated(false);
		// save customer
		customerService.save(customer);

		// Remove session
		session.removeAttribute("customer");

		// send email to notify user
		try {
			mailService.sendHTML(customer.getEmail(), "npmt0605@gmail.com", "Deactivated Account",
					"Your account has been successfully deactivated on " + new Date()
							+ ". Within 7 days your account will be permanently removed.");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "redirect:../home";
	}

	// profile
	@RequestMapping(value = "profile", method = RequestMethod.GET)
	public String profile(ModelMap modelMap, HttpSession session) {

		// get customer session
		Account customer = (Account) session.getAttribute("customer");
		// if username is not login - move user to the login page
		if (customer == null) {
			return "redirect:/customer/login?notlogin";
		} else {
			modelMap.put("breadcumb", "Profile");
			modelMap.put("customer", customer);
			return "customer.profile";
		}
	}

	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String profile(@ModelAttribute("customer") @Valid Account customer, ModelMap modelMap, HttpSession session,
			BindingResult bindingResult, @RequestParam("file") MultipartFile image,
			@RequestParam("birth") String birthday) {

		customerValidation.validate(customer, bindingResult);
		if (session.getAttribute("customer") != null) {
			if (bindingResult.hasErrors()) {
				return "customer.register";
			} else {

				// hash new Password
//				if (!customer.getPassword().isEmpty()) {
//					String hash = BCrypt.hashpw(customer.getPassword(), BCrypt.gensalt());
//					currentCustomer.setPassword(hash);
//				}
				// change photo
				String filename = saveImage(image);
				if (filename != null) {
					// import photo
					customer.setPhoto(filename);
				}
				if (birthday != null) {
					DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
					try {
						// get Current time
//						Calendar cal = Calendar.getInstance();
//						Date date = cal.getTime();
//						DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
//						String formattedDate = dateFormat.format(date);
						customer.setBirthday(dateFormat.parse(birthday));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.getMessage();
					}
				}

				// set Role for customer to 3
				Role role = new Role();
				role.setId(3);
				customer.setRole(role);

				// save new customer
				customerService.save(customer);

				// create a new customer session
				session.setAttribute("customer", customer);

				return "redirect:/customer/profile";

			}
		} else {
			return "redirect:/customer/register?error";
		}
	}

	// save images to project's folder
	private String saveImage(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths
					.get(servletContext.getRealPath("/upload/customer/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (IOException e) {
			return null;
		}
	}

	// change password
	@RequestMapping(value = "changepassword", method = RequestMethod.GET)
	public String changepassword(@RequestParam(value = "wrongpassword", required = false) String wrongpassword,
			ModelMap modelMap, HttpSession session) {
		// breadcumb
		modelMap.put("breadcumb", "Reset Password");
		// only accept user to access this page if the customer is logged in
		if (session.getAttribute("customer") != null) {
			if (wrongpassword != null) {
				modelMap.put("wrongpassword", "Wrong password !");
			}
			modelMap.put("changepassword", true);
			return "customer.password";
		} else {
			return "redirect:/customer/login?notlogin";
		}
	}

	@RequestMapping(value = "changepassword", method = RequestMethod.POST)
	public String changepassword(ModelMap modelMap, HttpSession session,
			@RequestParam("oldpassword") String oldpassword, @RequestParam("newpassword") String newpassword) {

		// check old password correct
		Account customer = (Account) session.getAttribute("customer");
		if (BCrypt.checkpw(oldpassword, customer.getPassword())) {
			// HashPassword
			String hash = BCrypt.hashpw(newpassword, BCrypt.gensalt());
			customer.setPassword(hash);

			// update new password
			customerService.save(customer);

			// remove old customer session after update password
			session.removeAttribute("customer");

			return "redirect:/customer/login?changepassword";
		} else {
			return "redirect:/customer/changepassword?wrongpassword";
		}
	}

	// forgetpassword and sent verification mail
	@RequestMapping(value = "forgetpassword", method = RequestMethod.GET)
	public String forgetpassword(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "success", required = false) String success, ModelMap modelMap, HttpSession session) {
		if (session.getAttribute("customer") == null) {
			// map view
			modelMap.put("forgetpassword", true);
			// breadcumb
			modelMap.put("breadcumb", "Forget Password");
			// if error is exists
			if (error != null) {
				modelMap.put("error", "This Email is not used to sign up to any account !");
			}
			if (success != null) {
				modelMap.put("success",
						"An verification message has been sent to your email address. Please check your mail box and continue !");
			}
			return "customer.password";
		} else {
			return "customer.accessDenied";
		}
	}

	@RequestMapping(value = "forgetpassword", method = RequestMethod.POST)
	public String forgetpassword(ModelMap modelMap, HttpSession session, @RequestParam("email") String email) {

		// breadcumb
		modelMap.put("breadcumb", "Forget Password");

		// check email exists
		Account customer = customerService.findByEmail(email);
		if (customer != null) {
			String url = "http://localhost:9596/customer/resetpassword";
			// send email to notify user
			try {
				mailService.sendHTML(customer.getEmail(), "npmt0605@gmail.com", "Reset Password",
						"Click on this link to continue to <a href=" + url + "> reset your password</a>");
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			// set a new session as reset password to continue
			session.setAttribute("resetpassword", customer);
			return "redirect:/customer/forgetpassword?success";
		} else {
			return "redirect:/customer/forgetpassword?error";
		}
	}

	@RequestMapping(value = "resetpassword", method = RequestMethod.GET)
	public String resetpassword(ModelMap modelMap, HttpSession session) {
		// breadcumb
		modelMap.put("breadcumb", "Reset Password");
		if (session.getAttribute("customer") != null || session.getAttribute("resetpassword") != null) {
			// map view
			modelMap.put("resetpassword", true);
			return "customer.password";
		} else {
			return "redirect:/customer/login?notlogin";
		}
	}

	@RequestMapping(value = "resetpassword", method = RequestMethod.POST)
	public String resetpassword(ModelMap modelMap, HttpSession session,
			@RequestParam("newpassword") String newpassword) {

		// check email exists
		Account customer = (Account) session.getAttribute("resetpassword");

		// check change password
		Account changepassword = (Account) session.getAttribute("customer");
		if (customer != null) {
			// HashPassword
			String hash = BCrypt.hashpw(newpassword, BCrypt.gensalt());
			customer.setPassword(hash);
			customerService.save(customer);

			session.removeAttribute("resetpassword");
			return "redirect:/customer/login?changepassword";
		} else if (changepassword != null) {
			// HashPassword
			String hash = BCrypt.hashpw(newpassword, BCrypt.gensalt());
			changepassword.setPassword(hash);
			customerService.save(changepassword);

			session.removeAttribute("customer");
			return "redirect:/customer/login?changepassword";
		} else {
			return "home.error";
		}
	}

	// end of forgetpassword
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

//	private boolean exists(int id) {
//		if (customerService.find(id) != null) {
//			return true;
//		}
//		return false;
//	}

}