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
				<h1>PRODUCT</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath }/vendor/product">Home</a></li>
					<li class="breadcrumb-item active">Product</li>
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
					<form method="post" action="${pageContext.request.contextPath }/vendor/product/searchbyid">
						<input type="text" name="id" placeholder="By ID" class="btn btn-outline-secondary btn-sm" value="${id }" required>
						<input type="submit" value="Search" class="btn btn-dark  btn-sm">
					</form>
				</div>
				<div class="col-4 px-0">
					
				</div>
				<div class="col-4 px-0">
					<form method="post" action="${pageContext.request.contextPath }/vendor/product/searchbyname">					
						<input type="submit" value="Search" class="btn btn-dark  btn-sm">
						<input type="text" name="name" placeholder="By Name" class="btn btn-outline-secondary  btn-sm" value="${name }" required>
					</form>
				</div>
			</div>
			<br>
			<div class="row">
				<form method="post" action="${pageContext.request.contextPath }/vendor/product/searchbyprice">
					<input type="text" name="min" placeholder="By Min" class="btn btn-outline-secondary  btn-sm" value="${min }" min=0 required>
					<input type="text" name="max" placeholder="By Max" class="btn btn-outline-secondary  btn-sm" value="${max }" min=0 required>
					<input type="submit" value="Search" class="btn btn-dark  btn-sm">
				</form>
			</div>
		</div>
		<div class="col-2">
			<button type="button" class="btn btn-block bg-gradient-success"
				onclick="window.location='/vendor/product/create'">
				<i class="fas fa-plus"></i>&nbsp; Add
			</button>
		</div>
	</div>

	<div>
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="/vendor/product" var="pagedLink">
			<c:param name="page" value="~" />
		</c:url>

		<table class="table table-hover">
			<thead class="thead-light">
				<tr style="text-align: center">
					<th>X</th>
					<th>Photo</th>
					<th>ID</th>
					<th>Name</th>
					<th>Quantity</th>
					<th>UnitPrice/UnitBrift</th>
					<th>Discount</th>
					<th>Brand</th>
					<th>Category</th>
					<th>Active</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="p" items="${pagedListHolder.pageList }">
				<tr style="text-align: center">
					<td class="item-record">
						<a onclick="return confirm('Are you sure?')" class="btn btn-danger" href="${pageContext.request.contextPath}/vendor/product/delete/${p.id }">
							<i class="fas fa-trash"> </i> 		
						</a>
					</td>
					<td class="item-record"><img src="${pageContext.request.contextPath}/upload/vendor/product/${p.photo }"
						alt="${p.photo }" width="50" height="50" /></td>
					<td class="item-record">${p.id }</td>
					<td class="item-record">${p.name }</td>
					<td class="item-record">${p.quantity }</td>
					<td class="item-record">${p.unitPrice } / ${p.unitBrief }</td>
					<td class="item-record">${p.discount }</td>
					<td class="item-record">${p.brand.name }</td>
					
					<td class="item-record">${p.category.name }</td>
					<td class="item-record">
						<input type="checkbox" ${p.activated ? 'checked' : '' } data-product-id="${p.id }" onchange="ActiveProduct(this);" />
					</td>
					
					
					<td style="width: 160px" class="item-record">
						<a class="btn btn-info btn-sm" href="${pageContext.request.contextPath}/vendor/product/edit/${p.id }">
							<i class="fas fa-pencil-alt"> </i> &nbsp; <span class="view-edit"
							style="font-size: 1rem;">View/Edit</span>
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
		<div class="col-md-6">
			
		</div>
		<div class="col-md-6"></div>
	</div>
</section>


