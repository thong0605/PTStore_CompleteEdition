package com.ptstore.tags;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import org.springframework.web.servlet.tags.RequestContextAwareTag;

import com.ptstore.models.Orderdetails;

public class CartTag extends RequestContextAwareTag {

	@Override
	protected int doStartTagInternal() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void doFinally() {
		JspWriter writer = pageContext.getOut();
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
			writer.write("<div class='well well-small'>");
			writer.write("<a id='myCart' href='" + pageContext.getServletContext().getContextPath() + "/cart/index'>");
			writer.write("<img src='" + pageContext.getServletContext().getContextPath()
					+ "/resources/client/themes/images/ico-cart.png' alt='cart'>");
			if (countItems <= 1) {
				writer.write(countItems + " Item in your cart ");
			} else {
				writer.write(countItems + " Items in your cart ");
			}
			writer.write("<span class='badge badge-warning pull-right'> $" + totalPrice + "</span>");
			writer.write("</a>");
			writer.write("</div>");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			try {
				writer.write(e.getMessage());
			} catch (IOException e1) {
				System.out.println(e1.getMessage());
			}
		}
	}

}