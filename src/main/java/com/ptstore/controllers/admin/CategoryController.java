package com.ptstore.controllers.admin;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;
import com.ptstore.models.Brand;
import com.ptstore.models.Category;
import com.ptstore.services.BrandService;
import com.ptstore.services.CategoryService;


@Controller
@RequestMapping({ "admincategory" })
public class CategoryController implements ServletContextAware {
	private ServletContext servletContext;
	@Autowired
	private CategoryService categoryService;
	@Autowired
	private BrandService brandService;

	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			modelMap.put("categories", categoryService.findCategory());
			modelMap.put("brands", brandService.findAll());
			// list category
			List<Category> categorys = (List<Category>) categoryService.findCategory();
			PagedListHolder pagedListHolderCategory = new PagedListHolder(categorys);
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderCategory.setPage(page);
			pagedListHolderCategory.setPageSize(4);
			modelMap.put("pagedListHolder", pagedListHolderCategory);
			// list brand
			List<Brand> brands = (List<Brand>) brandService.findAll();
			PagedListHolder pagedListHolderBrand = new PagedListHolder(brands);
			int page2 = ServletRequestUtils.getIntParameter(request, "c", 0);
			pagedListHolderBrand.setPage(page2);
			pagedListHolderBrand.setPageSize(4);
			modelMap.put("pagedListHolderBrand", pagedListHolderBrand);
			Category category = new Category();
			modelMap.put("category", category);
			return "category.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	// Add Category
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(@ModelAttribute("category") Category category, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			if ((category.getName()) == "") {
				System.out.println("Failed");
				return "redirect:/admincategory";
			} else if (categoryService.checkcategory(category.getName()) != null) {
				System.out.println("failed 2");
				return "redirect:/admincategory";
			} else {
				category.setStatus(true);
				categoryService.save(category);
				System.out.println("done");
				return "redirect:/admincategory";
			}
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, Category category, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			category = categoryService.find(id);
			category.setStatus(false);
			categoryService.save(category);
			return "redirect:/admincategory";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "deletebrand/{id}", method = RequestMethod.GET)
	public String deletebrand(@PathVariable("id") int id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			brandService.delete(id);
			return "redirect:/admincategory";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			modelMap.put("category", categoryService.find(id));
			return "category.edit.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "edit", method = RequestMethod.POST)
	public String edit(@ModelAttribute("category") Category category, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			if (categoryService.checkcategory(category.getName()) != null) {
				modelMap.put("failed", "Same Category Name");
				return "category.edit.index";
			} else {
				category.setStatus(true);
				categoryService.save(category);
				return "redirect:/admincategory";
			}
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "editbrand/{id}", method = RequestMethod.GET)
	public String editbrand(@PathVariable("id") int id, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			modelMap.put("brand", brandService.find(id));
			return "brand.edit.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "cancel", method = RequestMethod.GET)
	public String cancel(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			return "redirect:/admincategory";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "editbrand", method = RequestMethod.POST)
	public String editbrand(@ModelAttribute("brand") Brand brand, ModelMap modelMap,
			@RequestParam("file") MultipartFile multipartFile, @RequestParam("logo") String logo,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			String filename = saveImage(multipartFile);
			if (brandService.checknamebrand(brand.getName()) != null) {
				modelMap.put("failed", "Same Brand Name");
				return "add.brand.index";
			} else {
				if (filename != null) {
					brand.setLogo(filename);
					brandService.save(brand);
					return "redirect:/admincategory";
				} else {
					brand.setLogo(logo);
					brandService.save(brand);
					return "redirect:/admincategory";
				}
			}
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	private String saveImage(MultipartFile multipartFile) {
		try {
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths
					.get(servletContext.getRealPath("/upload/admin/brand/" + multipartFile.getOriginalFilename()));
			Files.write(path, bytes);
			return multipartFile.getOriginalFilename();
		} catch (IOException e) {
			return null;
		}
	}

	@RequestMapping(value = "searchcategory", method = RequestMethod.POST)
	public String searchcategory(@RequestParam("keyword") String keyword, ModelMap modelMap,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			// list category
			List<Category> categorys = (List<Category>) categoryService.searchCategory(keyword.trim());
			PagedListHolder pagedListHolderCategory = new PagedListHolder(categorys);
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderCategory.setPage(page);
			pagedListHolderCategory.setPageSize(4);
			modelMap.put("pagedListHolder", pagedListHolderCategory);
			modelMap.put("keyword", keyword);
			// list brand
			List<Brand> brands = (List<Brand>) brandService.findAll();
			PagedListHolder pagedListHolderBrand = new PagedListHolder(brands);
			int page2 = ServletRequestUtils.getIntParameter(request, "c", 0);
			pagedListHolderBrand.setPage(page2);
			pagedListHolderBrand.setPageSize(4);
			modelMap.put("pagedListHolderBrand", pagedListHolderBrand);
			Category category = new Category();
			modelMap.put("category", category);
			return "category.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "searchbrand", method = RequestMethod.POST)
	public String searchbrand(@RequestParam("keyword") String keyword2, ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			// list category
			List<Category> categorys = (List<Category>) categoryService.findCategory();
			PagedListHolder pagedListHolderCategory = new PagedListHolder(categorys);
			int page = ServletRequestUtils.getIntParameter(request, "p", 0);
			pagedListHolderCategory.setPage(page);
			pagedListHolderCategory.setPageSize(4);
			modelMap.put("pagedListHolder", pagedListHolderCategory);
			// list brand
			List<Brand> brands = (List<Brand>) brandService.checkbrand(keyword2.trim());
			PagedListHolder pagedListHolderBrand = new PagedListHolder(brands);
			int page2 = ServletRequestUtils.getIntParameter(request, "c", 0);
			pagedListHolderBrand.setPage(page2);
			pagedListHolderBrand.setPageSize(4);
			modelMap.put("pagedListHolderBrand", pagedListHolderBrand);
			Category category = new Category();
			modelMap.put("category", category);
			modelMap.put("keyword2", keyword2);
			return "category.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}

	// Add brand
	@RequestMapping(value = "addbrand", method = RequestMethod.GET)
	public String addbrand(ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			Brand brand = new Brand();
			modelMap.put("brand", brand);
			return "add.brand.index";
		} else {
			return "redirect:/adminaccount/login";
		}
	}

	@RequestMapping(value = "addbrand", method = RequestMethod.POST)
	public String addbrand(@ModelAttribute("brand") Brand brand, @RequestParam("file") MultipartFile multipartFile,
			ModelMap modelMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name") != null) {
			String filename = saveImage(multipartFile);
			if (brand.getName() == "" || (brand.getName()).length() == 0) {
				modelMap.put("failed", "Branding Invitation");
				return "add.brand.index";
			} else if (brandService.checknamebrand(brand.getName()) != null) {
				modelMap.put("failed", "Same Brand Name");
				return "add.brand.index";
			} else {
				if (filename != null) {
					brand.setLogo(filename);
					brandService.save(brand);
					return "redirect:/admincategory";
				} else {
					brand.setLogo("white.jfif");
					brandService.save(brand);
					return "redirect:/admincategory";
				}
			}
		} else {
			return "redirect:/adminaccount/login";
		}
	}
}