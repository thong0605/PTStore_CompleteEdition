package com.ptstore.controllers.vendor;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.ptstore.services.RoleService;
import com.ptstore.validations.AccountValidation;
import com.ptstore.models.Account;
import com.ptstore.models.Role;
import com.ptstore.services.AccountService;

@Controller
@RequestMapping({"vendor"})
public class VendorController implements ServletContextAware {
	private ServletContext servletContext;
	
	@Autowired
	private AccountValidation accountValidation;
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private AccountService vendorService;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index() {
		return "vendor.login.index";
	}
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(ModelMap modelMap,
			@RequestParam(value = "error", required = false) String error, 
			@RequestParam(value = "logout", required = false) String logout ) {
		
		if(error != null) {
			modelMap.put("msg", "Username or password invalid");
		}
		if(logout != null) {
			modelMap.put("msg", "Logout Success");
		}	
		return "vendor.login.index"; 
	}
	
	@RequestMapping(value = "welcome", method = RequestMethod.GET)
	public String welcome(Authentication authentication, ModelMap modelMap, HttpSession session) {
		
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		if (principal instanceof UserDetails) {
//		    String username = ((UserDetails) principal).getUsername();
//		    
//		} else {
//		    String username = principal.toString();
//		}
		authentication = SecurityContextHolder.getContext().getAuthentication();   
		SecurityContextHolder.getContext().setAuthentication(authentication);
		
//		modelMap.put("username", authentication.getName());
		Account account = vendorService.findByUsername2(authentication.getName());
		session.setAttribute("vendor", account);
		session.setAttribute("vendorId", account.getId());
		return "vendor.dashboard.index";
	}
	
//	@RequestMapping(value= "processLogin", method = RequestMethod.POST)
//	public String processLogin(Authentication authentication, ModelMap model, HttpSession session, 
//			@RequestParam("username") String username, @RequestParam("password") String password) {
//		Account account = vendorService.findByUsername(username);
//		if(account != null) {
//			if(BCrypt.checkpw(password, account.getPassword()) && account.getRole().getId() == 2) {
//				session.setAttribute("vendor", account);
//				return "redirect:/vendor/dashboard"; 
//			} else {
//				model.put("msg", "FAILURE");
//				return "vendor.login.index";
//			}
//		} else {
//			model.put("msg", "Username not exist");
//			return "vendor.login.index";
//		}
//        
//	}
	
	@RequestMapping(value= "logout", method = RequestMethod.GET)
	public String logout(SessionStatus session, HttpSession httpsession, HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null) {
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
		
		SecurityContextHolder.getContext().setAuthentication(null);
		httpsession.removeAttribute("vendor");
		return "redirect:/vendor/login"; 
	}
	
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(ModelMap modelMap) {
		Account vendor = new Account();
		
		vendor.setActivated(true);
		modelMap.put("vendor", vendor);
		return "vendor.register.index"; 
	}
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(ModelMap map, @ModelAttribute("vendor") @Valid Account vendor, BindingResult bindingResult) {
		accountValidation.validate(vendor, bindingResult);
		if(bindingResult.hasErrors()) {
			return "vendor.register.index"; 
		}else {
			String hash = new BCryptPasswordEncoder().encode(vendor.getPassword());
			vendor.setPassword(hash);
			vendor.setCreated(new Date());
			vendor.setPhoto("retrieve.png");
			Role role = roleService.find(2);
			vendor.setRole(role);
			vendor.setStatus(true);
			Account vendor1 = vendorService.findByUsername(vendor.getUsername());
			if(vendor1 != null && (vendor.getEmail().equals(vendor.getEmail()))) {
				map.put("msg", "Username Exist");
				map.put("vendor", new Account());
			} else {
				if(vendorService.save(vendor)) {
					return "redirect:/vendor/login";
				} else {
					map.put("msg", "Try again");
					map.put("vendor", new Account());
				}
			}
		}
		return "vendor.register.index";
	}
	
	@RequestMapping(value = "accessDenied", method = RequestMethod.GET)
	public String accessDenied() {
		return "vendor.accessDenied.index";
	}
	
	private String saveImage(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/upload/vendor/account/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (IOException e) {
			return null;
		}
	}
	
	@RequestMapping(value = "profile/{id}", method = RequestMethod.GET)
	public String profile(ModelMap map, @PathVariable("id") int id) {
		Account vendor = vendorService.find(id);
		map.put("vendor", vendor);
		return "vendor.profile.index";
	}
	
	@RequestMapping(value = "profile", method = RequestMethod.POST)
	public String profile(ModelMap map, @ModelAttribute("vendor") Account vendor, @RequestParam("inputphoto") MultipartFile multipartFile, @RequestParam("created") String created, HttpSession session) {	
			Account account = (Account) session.getAttribute("vendor"); 
			String filename = saveImage(multipartFile);
			vendor.setPhoto(filename);
			Role role = roleService.find(2);
			vendor.setRole(role);
			vendor.setCreated(account.getCreated());
			vendor.setActivated(true);
			vendor.setStatus(true);
			vendor.setUsername(account.getUsername());
			vendor.setPassword(account.getPassword());
			if(vendorService.save(vendor)) {
				session.setAttribute("vendor", vendor);
				map.put("msg", "Update success");
				return "vendor.profile.index";
			} else {
				map.put("msg", "Try again");
				return "vendor.profile.index";
			}
	}
	
	@RequestMapping(value = "changepw", method = RequestMethod.GET)
	public String changepw() {
		return "vendor.changepw.index";
	}
	
	@RequestMapping(value = "changepw", method = RequestMethod.POST)
	public String changepw(ModelMap map, @RequestParam("id") String id, @RequestParam("npw") String npw, @RequestParam("oldpw") String oldpw, @RequestParam("repw") String repw, HttpSession session) { 
		int id1 = Integer.parseInt(id);
		Account vendor = vendorService.findByPassword(id1);
		if(BCrypt.checkpw(oldpw, vendor.getPassword()) && npw.equals(repw)){
			vendor.setPassword(BCrypt.hashpw(npw, BCrypt.gensalt()));
			if(vendorService.save(vendor)) {
				session.removeAttribute("vendor");;
				map.put("msg", "Update success");
				return "redirect:/vendor/login";
			} else {
				map.put("msg", "Try again");			
			}		
		}
		return "vendor.changepw.index";
	}
	
	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
