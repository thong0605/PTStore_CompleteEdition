<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Invoice history</h3>
<hr class="soft">
<div id="legalNotice">
	<c:if test="${countOrders != 0  }">
		<c:forEach var="i" items="${orders }">

			<h5>Order #${i.id }</h5>
			<br>
			<c:if test="${i.status == false }">
				<p>Status: Pending</p>
			</c:if>
			<c:if test="${i.status == true }">
				<p>Status: Done</p>
			</c:if>
			<p>Created on: ${i.orderDate }</p>
			<p>Receiver: ${i.account.fullname }</p>
			<p>Phone: ${i.phone }</p>
			<p>Delivery to: ${i.address }</p>
			<c:if test="${i.payment == 1 }">
				<p>Payment: Cash On Delivery</p>
			</c:if>
			<c:if test="${i.payment == 2 }">
				<p>Payment: Credit Card</p>
			</c:if>
			<p>Note: ${i.description }</p>
			<a style="color:red;" href="${pageContext.request.contextPath }/orders/details/${i.id}">More
				information</a>
			<br>
			<hr class="soft">
		</c:forEach>
	</c:if>
	<c:if test="${countOrders == 0  }">
		<p>You don't have any orders now !</p>
	</c:if>
</div>