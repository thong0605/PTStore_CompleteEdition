<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul id="sideManu" class="nav nav-tabs nav-stacked">
	<!-- dropdown menu 
	<li class="subMenu open"><a> ELECTRONICS [230]</a>
		<ul>
			<li><a class="active"
				href="${pageContext.request.contextPath}/product/list"><i
					class="icon-chevron-right"></i>Cameras (100) </a></li>
			<li><a href="products.html"><i class="icon-chevron-right"></i>Computers,
					Tablets & laptop (30)</a></li>
			<li><a href="products.html"><i class="icon-chevron-right"></i>Mobile
					Phone (80)</a></li>
			<li><a href="products.html"><i class="icon-chevron-right"></i>Sound
					& Vision (15)</a></li>
		</ul></li>-->
	<c:forEach var="c" items="${categories }">
		<li><a
			href="${pageContext.request.contextPath}/product/listByCategories/${c.id }">${c.name }</a></li>
	</c:forEach>
	<li class="subMenu"><a> Brands</a>
		<ul>
			<c:forEach var="b" items="${brands }">
				<li><a class="active" style="text-decoration:none;"
					href="${pageContext.request.contextPath}/product/listByBrands/${b.id }"><i
						class="icon-chevron-right"></i>${b.name }</a></li>
			</c:forEach>
		</ul></li>
</ul>
<br />

<c:forEach var="p" items="${sidebarProducts }">
	<div class="thumbnail">
		<img
			src="${pageContext.request.contextPath}/upload/vendor/product/${p.photo}"
			alt="${p.photo}" />
		<div class="caption">
			<h5>${p.name }</h5>
			<h4 style="text-align: center">
				<a class="btn"
					href="${pageContext.request.contextPath}/product/detail/${p.id}">
					<i class="icon-zoom-in"></i>
				</a> <a class="btn"
					href="${pageContext.request.contextPath}/cart/buy/${p.id}">Add
					to <i class="icon-shopping-cart"></i>
				</a> <a class="btn btn-primary" href="#">$${p.unitPrice}</a>
			</h4>
		</div>
	</div>
	<br />
</c:forEach>

<div class="thumbnail">
	<img
		src="${pageContext.request.contextPath}/resources/client/themes/images/payment_methods.png"
		title="PTStore Payment Methods" alt="Payments Methods">
	<div class="caption">
		<h5>Payment Methods</h5>
	</div>
</div>