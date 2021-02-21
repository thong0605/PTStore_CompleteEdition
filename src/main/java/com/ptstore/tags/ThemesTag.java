  
package com.ptstore.tags;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.tags.RequestContextAwareTag;


public class ThemesTag extends RequestContextAwareTag {

	@Override
	public void doFinally() {
		// khi tag dc goi len, noi minh thuc hien gi do
		try {
			String jspPage = "../tags/main/themes.jsp"; // dung tu mytemplate di vao
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			request.getRequestDispatcher(jspPage);
			pageContext.include(jspPage);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	protected int doStartTagInternal() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}