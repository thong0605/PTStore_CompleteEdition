<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section class="content-header">
	<div class="mx-5">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>ORDER DETAIL</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath }/vendor/order">Home</a></li>
					<li class="breadcrumb-item active">Order Detail</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section class="content mx-5">
	<div>
	
		<table class="table table-hover">
			<tbody class="thead-light">
				<tr style="text-align: center">
					<th class="item-record">Order ID</th>
					<td class="item-record">${od.orders.id } </td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Product</th>
					<td class="item-record">${od.product.name }  (ID: ${od.product.id }) </td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Producer</th>
					<td class="item-record">${od.product.brand.name } </td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Photo</th>
					<td class="item-record">
						<img src="${pageContext.request.contextPath}/upload/vendor/product/${od.product.photo }"
						alt="${p.photo }" width="50" height="50" />
					</td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Quantity</th>
					<td class="item-record">${od.quantity }</td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Customer</th>
					<td class="item-record">${od.orders.account.fullname }</td>	
				</tr>				
				<tr style="text-align: center">
					<th class="item-record">To Address</th>
					<td class="item-record">${od.orders.address }</td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Phone</th>
					<td class="item-record">${od.orders.phone } </td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Date</th>
					<td class="item-record">${od.orders.orderDate } </td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Email</th>
					<td class="item-record">${od.orders.account.email } </td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Description</th>
					<td class="item-record">${od.orders.description } </td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Payment</th>
					<td class="item-record">${od.orders.payment == 1 ? 'Cash' : 'Paypal' } </td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Discount</th>
					<td class="item-record">${od.product.discount * od.quantity } %</td>	
				</tr>
				<tr style="text-align: center">
					<th class="item-record">Total</th>
					<td class="item-record">${od.amount } </td>	
				</tr>
			</tbody>
		</table>
		
	</div>
	<div class="row my-3">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<!-- <a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/vendor/order/">
				<i class="far fa-paper-plane"> </i> &nbsp; <span class="view-edit"
				style="font-size: 1rem;text-decoration: none">Send Mail</span>
			</a> -->
			<form action="${pageContext.request.contextPath}/vendor/order/successMail" method="post">
				<button type="submit" class="btn btn-primary btn-block btn-login">Confirm</button>
				<input type="hidden" value="${od.product.account.id }" name="vendorid">
				<input type="hidden" value="${od.orders.id }" name="orderid">
				<input type="hidden" value="${od.product.id }" name="productid">
			</form>
		</div>
		<div class="col-md-4">
			
		</div>
	</div>
</section>


