package com.ptstore.tags;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.ptstore.services.BrandService;
import com.ptstore.services.CategoryService;
import com.ptstore.services.ProductService;

public class CategoryTag extends RequestContextAwareTag {

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private BrandService brandService;
	
	@Autowired
	private ProductService productService;

	@Override
	protected int doStartTagInternal() throws Exception {
		if (categoryService == null || brandService == null) {

			WebApplicationContext webApplicationContext = getRequestContext().getWebApplicationContext();

			AutowireCapableBeanFactory autowireCapableBeanFactory = webApplicationContext
					.getAutowireCapableBeanFactory();

			autowireCapableBeanFactory.autowireBean(this);

		}

		return SKIP_BODY;
	}

	@Override
	public void doFinally() {
		// khi tag dc goi len, noi minh thuc hien gi do
		try {
			String jspPage = "../tags/category/index.jsp"; // dung tu mytemplate di vao
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			request.setAttribute("categories", categoryService.findAll());
			request.setAttribute("brands", brandService.findAll());
			request.setAttribute("sidebarProducts",  productService.latestProducts(2));
			request.getRequestDispatcher(jspPage);
			pageContext.include(jspPage);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}