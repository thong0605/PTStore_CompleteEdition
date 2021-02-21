<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<section class="content-header">
	<div class="mx-5">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>OLD ORDER</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath }/vendor/order">Home</a></li>
					<li class="breadcrumb-item active">Order History</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section class="content mx-5">
	<div class="row my-2">
		<div class="col-10">
			<div class="row">
				<div class="col-4 px-0">
					<form name="f1" method="post" action="${pageContext.request.contextPath }/vendor/order/searchbyorderidold" onsubmit="return validateForm1()">
						<input type="text" name="orderid" placeholder="By ID Order" class="btn btn-outline-secondary" value="${orderid }" required>
						<input type="submit" value="Search" class="btn btn-dark">
					</form>
				</div>
				<div class="col-4 px-0"></div>
				<div class="col-4 px-0">
					<form name="f2" method="post" action="${pageContext.request.contextPath }/vendor/order/searchbydateold" onsubmit="return validateForm2()">
						<input type="text" name="orderDate" placeholder="By Date Order" class="btn btn-outline-secondary" id="datepicker" value="${orderDate }" required>
						<input type="submit" value="Search" class="btn btn-dark">
					</form>
				</div>
			</div>
		</div>
		<div class="col-2 px-0">

		</div>
	</div>

	<div>
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="/vendor/order/orderold" var="pagedLink">
			<c:param name="page" value="~" />
		</c:url>

		<table class="table table-hover">
			<thead class="thead-light">
				<tr style="text-align: center">
					<th>ID</th>
					<th>Date</th>
					<th>Customer</th>
					<th>Phone</th>
					<th>Product</th>
					<th>Quantity</th>
					<th>Total</th>
					<th>Payment</th>
					<!-- <th>Status Order</th> -->
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="o" items="${pagedListHolder.pageList }">
				<tr style="text-align: center">
					<td class="item-record">${o.orders.id }</td>
					<td class="item-record">${o.orders.orderDate }</td>
					<td class="item-record">${o.orders.account.fullname }</td>
					<td class="item-record">${o.orders.account.phone }</td>
					<td class="item-record">${o.product.name }</td>
					<td class="item-record">${o.quantity }</td>
					<td class="item-record">${o.amount }</td>
					
					<td class="item-record">${o.orders.payment == 1 ? 'Cash' : 'Paypal' }</td>
					<!-- <td class="item-record" style="color:orange;">${o.orders.status ? 'Unchecked' : 'Checked' }</td> -->
					
					<td style="width: 160px" class="item-record">
						<a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/vendor/order/orderolddetail/${o.product.account.id }/${o.orders.id }/${o.product.id }">
							<i class="fas fa-pencil-alt"> </i> &nbsp; <span class="view-edit"
							style="font-size: 1rem;">View/Check</span>
						</a>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<tg:paging pagedListHolder="${pagedListHolder}"
			pagedLink="${pagedLink}" />
	</div>
	<div class="row my-3">
		<div class="col-md-6"></div>
		<div class="col-md-6"></div>
	</div>
</section>

<script type="text/javascript">
    
	function validateForm1(){  
		var orderid=document.f1.orderid.value;       		  
		if(isNaN(orderid)){  
			alert("order id not valid");  
			return false;    
		} else if(orderid == "") {  
			alert("input must be filled out");  
			return false;  
		}  
	}  

	function validateForm2(){ 
		var orderDate=document.f2.orderDate.value;  
		  
		if(orderDate == ""){  
			alert("input must be filled out");  
			return false;    
		}
	}  
	$( function() {
	    $( "#datepicker" ).datepicker();
	  } );
     
</script>
