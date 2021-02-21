package com.ptstore.tags;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.ptstore.models.Orderdetails;

public class HeaderTag extends RequestContextAwareTag {

	@Override
	protected int doStartTagInternal() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void doFinally() {
		try {
			HttpSession session = pageContext.getSession();
			int countItems = 0;
			double totalPrice = 0;
			if (session.getAttribute("cart") != null) {
				List<Orderdetails> cart = (List<Orderdetails>) session.getAttribute("cart");
				countItems = cart.size();
				for (Orderdetails item : cart) {
					totalPrice += (item.getProduct().getUnitPrice() * (100 - item.getProduct().getDiscount()) / 100
							* item.getQuantity());
				}
			}
			String jspPage = "../tags/header/index.jsp"; // dung tu mytemplate di vao
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			request.setAttribute("countItems", countItems);
			request.setAttribute("totalPrice", totalPrice);
			request.getRequestDispatcher(jspPage);
			pageContext.include(jspPage);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}