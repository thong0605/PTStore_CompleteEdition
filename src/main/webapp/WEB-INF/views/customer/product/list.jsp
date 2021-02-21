<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<c:if test="${search != true }">
	<jsp:useBean id="pagedListHolder" scope="request"
		type="org.springframework.beans.support.PagedListHolder" />
	<c:if test="${category != null}">
		<c:url value="/product/listByCategories/${category.id}"
			var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>

		<h3>
			${category.name} <small class="pull-right">${countItem }
				products are available </small>
		</h3>
	</c:if>
	<c:if test="${brand != null}">
		<c:url value="/product/listByBrands/${brand.id}" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>

		<h3>
			${brand.name} <small class="pull-right"> ${countItem }
				products are available </small>
		</h3>
	</c:if>
	<c:if test="${vendor != null}">
		<c:url value="/product/listByVendor/${vendor.fullname}" var="pagedLink">
			<c:param name="p" value="~" />
		</c:url>

		<h3>
			${vendor.fullname} <small class="pull-right"> ${countItem }
				products are available </small>
		</h3>
	</c:if>

	<hr class="soft">
	<p>Nowadays the lingerie industry is one of the most successful
		business spheres.We always stay in touch with the latest fashion
		tendencies - that is why our goods are so popular and we have a great
		number of faithful customers all over the country.</p>
	<hr class="soft">
	<form class="form-horizontal span6">
		<div class="control-group">
			<label class="control-label alignL">Sort By </label> <select>
				<option>None</option>
				<option onselect="sortAtoZ()">Product name A - Z</option>
				<option onselect="sortZtoA()">Product name Z - A</option>
				<option>Priduct Stoke</option>
				<option>Price Lowest first</option>
			</select>
		</div>
	</form>

	<div id="myTab" class="pull-right">
		<a href="#listView" data-toggle="tab"><span class="btn btn-large"><i
				class="icon-list"></i></span></a> <a href="#blockView" data-toggle="tab"><span
			class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
	</div>
	<br class="clr">


	<div class="tab-content">
		<div class="tab-pane" id="listView">

			<c:forEach var="p" items="${pagedListHolder.pageList}">
				<!--  <c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>-->
				<div class="row">
					<div class="span2">
						<img
							src="${pageContext.request.contextPath}/upload/vendor/product/${p.photo}"
							alt="">
					</div>
					<div class="span4">
						<h3>${p.name }</h3>
						<div>
							<span class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span>(0)</span>
						</div>
						<hr class="soft">
						<h5>Description</h5>
						<p>${p.description }</p>
						<a class="btn btn-small pull-right"
							href="${pageContext.request.contextPath}/product/detail/${p.id}">View
							Details</a> <br class="clr">
					</div>
					<div class="span3 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$${p.unitPrice }</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compare
							</label><br> <a
								href="${pageContext.request.contextPath}/cart/buy/${p.id }"
								class="btn btn-large btn-primary"> Add to <i
								class=" icon-shopping-cart"></i></a> <a
								href="${pageContext.request.contextPath}/product/detail/${p.id }"
								class="btn btn-large"><i class="icon-zoom-in"></i></a>

						</form>
					</div>
				</div>
				<hr class="soft">
			</c:forEach>
			<!--  -->
		</div>

		<div class="tab-pane  active" id="blockView">
			<ul class="thumbnails" id="listProducts">

				<c:forEach var="p" items="${pagedListHolder.pageList}">
					<li class="span3">
						<div class="thumbnail">
							<a
								href="${pageContext.request.contextPath}/product/detail/${p.id }"><img
								src="${pageContext.request.contextPath}/upload/vendor/product/${p.photo}"
								alt=""></a>
							<div class="caption">
								<h5>${p.name }</h5>
								<div>
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span>(0)</span>
								</div>
								<h4 style="text-align: center">
									<a class="btn"
										href="${pageContext.request.contextPath}/product/detail/${p.id }">
										<i class="icon-zoom-in"></i>
									</a> <a class="btn"
										href="${pageContext.request.contextPath}/cart/buy/${p.id }">Add
										to <i class="icon-shopping-cart"></i>
									</a> <a class="btn btn-primary" href="#"> $${p.unitPrice }</a>
								</h4>
							</div>
						</div>
					</li>
				</c:forEach>

			</ul>
			<hr class="soft">
		</div>
	</div>

	<a href="${pageContext.request.contextPath}/product/compare"
		class="btn btn-large pull-right">Compare Product</a>
	<div class="pagination">

		<tg:paging pagedListHolder="${pagedListHolder}"
			pagedLink="${pagedLink}" />
		<!--  
		<ul>
			<li><a href="#">‹</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">...</a></li>
			<li><a href="#">›</a></li>
		</ul>-->

	</div>
</c:if>
<!--  -->

<c:if test="${search == true }">
	<h3>
		Search results for : "${keyword }"<small class="pull-right">
			${countItem } products are available </small>
	</h3>
	<hr class="soft">
	<form class="form-horizontal span6">
		<div class="control-group">
			<label class="control-label alignL">Sort By </label> <select>
				<option onchange="sortAtoZ()">Product name A - Z</option>
				<option onchange="sortZtoA()">Product name Z - A</option>
				<option>Product Stroke</option>
				<option>Price Lowest first</option>
			</select>
		</div>
	</form>

	<div id="myTab" class="pull-right">
		<a href="#listView" data-toggle="tab"><span class="btn btn-large"><i
				class="icon-list"></i></span></a> <a href="#blockView" data-toggle="tab"><span
			class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
	</div>
	<br class="clr">

	<div class="tab-content">
		<div class="tab-pane" id="listView">

			<c:forEach var="p" items="${products}">
				<!--  <c:set var="photo" value="${product.getPhotos().stream().filter(p -> p.isStatus() && p.isMain()).findFirst().get() }"></c:set>-->
				<div class="row">
					<div class="span2">
						<img
							src="${pageContext.request.contextPath}/upload/vendor/product/${p.photo}"
							alt="">
					</div>
					<div class="span4">
						<h3>${p.name }</h3>
						<div>
							<span class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span
								class="fa fa-star checked"></span> <span>(0)</span>
						</div>
						<hr class="soft">
						<h5>Description</h5>
						<p>${p.description }</p>
						<a class="btn btn-small pull-right"
							href="${pageContext.request.contextPath}/product/detail/${p.id}">View
							Details</a> <br class="clr">
					</div>
					<div class="span3 alignR">
						<form class="form-horizontal qtyFrm">
							<h3>$${p.unitPrice }</h3>
							<label class="checkbox"> <input type="checkbox">
								Adds product to compare
							</label><br> <a
								href="${pageContext.request.contextPath}/cart/buy/${p.id }"
								class="btn btn-large btn-primary"> Add to <i
								class=" icon-shopping-cart"></i></a> <a
								href="${pageContext.request.contextPath}/product/detail/${p.id }"
								class="btn btn-large"><i class="icon-zoom-in"></i></a>

						</form>
					</div>
				</div>
				<hr class="soft">
			</c:forEach>
			<!--  -->
		</div>

		<div class="tab-pane  active" id="blockView">
			<ul class="thumbnails" id="listProducts">

				<c:forEach var="p" items="${products}">
					<li class="span3">
						<div class="thumbnail">
							<a
								href="${pageContext.request.contextPath}/product/detail/${p.id }"><img
								src="${pageContext.request.contextPath}/upload/vendor/product/${p.photo }" alt=""></a>
							<div class="caption">
								<h5>${p.name }</h5>
								<div>
									<span class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span
										class="fa fa-star checked"></span> <span>(0)</span>
								</div>
								<h4 style="text-align: center">
									<a class="btn"
										href="${pageContext.request.contextPath}/product/detail/${p.id }">
										<i class="icon-zoom-in"></i>
									</a> <a class="btn"
										href="${pageContext.request.contextPath}/cart/buy/${p.id }">Add
										to <i class="icon-shopping-cart"></i>
									</a> <a class="btn btn-primary"
										href="${pageContext.request.contextPath}/cart/buy/${p.id}">$
										${p.unitPrice }</a>
								</h4>
							</div>
						</div>
					</li>
				</c:forEach>

			</ul>
			<hr class="soft">
		</div>
	</div>
</c:if>
<br class="clr">

<script>
var fruits = ${pagedListHolder.pageList};
document.getElementById("listProducts").innerHTML = fruits;
function sortAtoZ() {
  fruits.sort();
  document.getElementById("listProducts").innerHTML = fruits;
}
function sortZtoA() {
  // First sort the array
  fruits.sort();
  // Then reverse it:
  fruits.reverse();
  document.getElementById("listProducts").innerHTML = fruits;
}
</script>