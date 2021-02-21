<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<h3>
	SHOPPING CART [ <small> ${countItems} Item(s) </small>]
</h3>
<hr class="soft">

<!-- Cart Form -->
<form action="${pageContext.request.contextPath }/cart/update"
	method="post">

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>Product</th>
				<th>Description</th>
				<c:if test="${sessionScope.cart != null }">
					<th>Quantity | <button class="btn btn-secondary" type="submit">Update</button></th>
				</c:if>
				<c:if test="${sessionScope.cart == null }">
					<th>Quantity</th>
				</c:if>
				<th>Price</th>
				<th>Discount</th>
				<th>Total</th>
			</tr>
		</thead>
		<tbody>

			<c:set var="itemPrice" value="0"></c:set>
			<c:set var="totalPrice" value="0"></c:set>
			<c:set var="discount" value="0"></c:set>
			<c:set var="totalDiscount" value="0"></c:set>
			<c:set var="orderPrice" value="0"></c:set>



			<c:forEach items="${sessionScope.cart }" var="i" varStatus="i1">

				<c:set var="itemPrice" value="${i.product.unitPrice* i.quantity }"></c:set>
				<c:set var="totalPrice" value="${totalPrice + itemPrice }"></c:set>
				<c:set var="discount"
					value="${(i.product.unitPrice * i.product.discount)/100 * i.quantity}"></c:set>
				<c:set var="totalDiscount" value="${totalDiscount + discount }"></c:set>
				<c:set var="orderPrice" value="${totalPrice - totalDiscount }"></c:set>

				<tr>
					<td><img width="60"
						src="${pageContext.request.contextPath}/upload/vendor/product/${i.product.photo }"
						alt="${i.product.photo }"></td>
					<td>${i.product.name }<br>${i.product.description }
					</td>
					<td align="center">
						<div class="input-append">
							<input class="span1" style="max-width: 90px" min="1"
								id="appendedInputButtons" size="16" type="number"
								value="${i.quantity }" name="quantities" /> <a
								href="${pageContext.request.contextPath }/cart/remove/${i.product.id}"
								onclick="return confirm('Are you sure?')">
								<button class="btn btn-danger btn-sm" type="button" style="margin-left:6px;border-radius: 5px; ">
								  	<i class="icon-remove icon-white"></i>
								</button>
							</a>
						</div>
					</td>
					<td>$${i.product.unitPrice } / ${i.product.unitBrief }</td>
					<td>$${discount } (${i.product.discount }%)</td>
					<td>$${itemPrice }</td>
					<td>
					
					</td>
				</tr>

			</c:forEach>

			<tr>
				<td colspan="6" style="text-align: right">Total Price:</td>
				<td>$ ${totalPrice }</td>
			</tr>
			<tr>
				<td colspan="6" style="text-align: right">Total Discount:</td>
				<td>$ ${totalDiscount }</td>
			</tr>
			<tr>
				<td colspan="6" style="text-align: right"><strong>TOTAL
						($.${totalPrice } - $.${totalDiscount } ) =</strong></td>
				<td class="label label-important" style="display: block"><strong>
						$${orderPrice } </strong></td>
			</tr>
		</tbody>
	</table>

	<!--End Cart Product List -->

	<!--  
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td>
						<form class="form-horizontal" action="">
							<div class="control-group">
								<label class="control-label"><strong> VOUCHERS
										CODE: </strong> </label>
								<div class="controls">
									<input type="text" class="input-medium" placeholder="CODE">
									<button type="submit" class="btn">ADD</button>
								</div>
							</div>
						</form>
					</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-bordered">
			<tbody>
				<tr>
					<th>Delivery Information</th>
				</tr>
				<tr>
					<td><form class="form-horizontal" method="get"
							action="${pageContext.request.contextPath }/cart/checkout">
							<div class="control-group">
								<label class="control-label" for="phone">Phone number </label>
								<div class="controls">
									<input type="text" name="phone" id="phone"
										placeholder="Country">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="address">Address </label>
								<div class="controls">
									<input type="text" name="address" id="address"
										placeholder="Country">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="payment">Choose a
									payment method </label>
								<div class="controls">
									<input type="radio" id="payment" name="payment"
										value="Cash On Delivery"> COD <br> <input
										type="radio" id="payment" name="payment" value="Credit">
									Credit Card
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="note">Phone number </label>
								<div class="controls">
									<textarea id="note" name="description" rows="4" cols="50"></textarea>
								</div>
							</div>
							
							<div class="control-group">
								<div class="controls">
									<button type="submit" class="btn">ESTIMATE</button>
								</div>
							</div>
						</form></td>
				</tr>
			</tbody>
		</table>-->
	<a href="${pageContext.request.contextPath }/home"
		class="btn btn-large"><i class="icon-arrow-left"></i> Continue
		Shopping </a>
	<c:if test="${countItems != 0 }">

		<a href="${pageContext.request.contextPath }/cart/checkout"
			class="btn btn-large pull-right">Next <i class="icon-arrow-right"></i>
		</a>
	</c:if>
</form>
<!--End Cart Form -->