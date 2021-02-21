<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<div class="span9">
	<ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active">SHOPPING CART</li>
	</ul>
	<h3>
		SHOPPING CART Checkout<a
			href="${pageContext.request.contextPath }/home"
			class="btn btn-large pull-right"><i class="icon-arrow-left"></i>
			Continue Shopping </a>
	</h3>
	<hr class="soft">

	<div class="well">
		<s:form class="form-horizontal" method="post" modelAttribute="invoice"
			action="${pageContext.request.contextPath }/cart/checkout">
			<h4>Invoice information</h4>
			<div class="control-group">
				<label class="control-label" for="address">Address <sup>*</sup></label>
				<div class="controls">
					<s:input type="text" path="address" id="address"
						placeholder="e.g: 24-26 Phan Liem, Da Kao Ward, District 1, Saigon City" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="payment">Payment <sup>*</sup></label>
				<div class="controls">
					<s:radiobutton id="payment" path="payment" value="1" />
					Cash On Delivery <br>
					<s:radiobutton path="payment" id="payment" value="2" />
					Via Paypal
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="description">Note <sup>*</sup></label>
				<div class="controls">
					<s:textarea id="description" path="description" rows="4" cols="50"
						placeholder="e.g: Giao hang vao gio hanh chanh.." />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="mobile">Mobile Phone </label>
				<div class="controls">
					<s:input type="text" path="phone" id="mobile"
						placeholder="Mobile Phone" />
					<s:errors path="phone"></s:errors>
				</div>
			</div>
			<p>
				<sup>*</sup>Required field
			</p>

			<div class="control-group">
				<div class="controls">
					<input class="btn btn-large btn-success" type="submit"
						value="Purchase">
					<s:hidden path="id" />
				</div>
			</div>
		</s:form>
	</div>
</div>