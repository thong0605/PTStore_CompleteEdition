<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<html>
<script>
</script>
<body>
	<!-- Page list Products -->
	<jsp:useBean id="pagedListHolderproducts" scope="request"
		type="org.springframework.beans.support.PagedListHolder" />
	<c:url value="/adminaccount/product" var="pagedLinkproducts">
		<c:param name="p" value="~" />
	</c:url>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<section class="content">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div>
							<form method="post" action="/adminaccount/searchproductcreated">
								<div class="input-group input-group-sm">
									<input style="width: 200px" type=date name="startdate"
										placeholder="MM/dd/yyyy" value=""
										class="form-control float-right"> <a>&nbsp;&nbsp;&nbsp;</a>
									<input style="width: 200px" type=date name="enddate"
										placeholder="MM/dd/yyyy" value=""
										class="form-control float-right"> &nbsp;
									<div class="input-group-append">
										<button type="submit" class="btn btn-default">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</form>
							<form method="post"
								action="${pageContext.request.contextPath }/adminaccount/searchproduct">
								<div class="input-group input-group-sm">
									<input style="width: 200px" type="text" name="keyword"
										placeholder="Search Name Product" size="50px"
										value="${keyword}" class="form-control float-right">
									<div class="input-group-append">
										<button type="submit" class="btn btn-default">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</form>
						</div>

						<!-- /.card-header -->
						<div class="card-body">
							<div id="example2_wrapper"
								class="dataTables_wrapper dt-bootstrap4">
								<div class="row">
									<div class="col-sm-12 col-md-6"></div>
									<div class="col-sm-12 col-md-6"></div>
								</div>
								<div class="row">
									<div class="col-sm-12">
										<table id="example2"
											class="table table-bordered table-hover dataTable dtr-inline"
											role="grid" aria-describedby="example2_info">
											<thead>
												<tr role="row">
													<th class="sorting_asc" tabindex="0" rowspan="1"
														colspan="1" aria-sort="ascending"
														aria-label="Rendering engine: activate to sort column descending">ID</th>
													<th class="sorting" tabindex="0" rowspan="1" colspan="1"
														aria-label="Browser: activate to sort column ascending">Name</th>
													<th class="sorting" tabindex="0" rowspan="1" colspan="1"
														aria-label="Platform(s): activate to sort column ascending">Photo</th>
													<th class="sorting" tabindex="0" rowspan="1" colspan="1"
														aria-label="Engine version: activate to sort column ascending">Created</th>
													<th class="sorting" tabindex="0" rowspan="1" colspan="1"
														aria-label="CSS grade: activate to sort column ascending">Description</th>
													<th class="sorting" tabindex="0" rowspan="1" colspan="1"
														aria-label="CSS grade: activate to sort column ascending">Category</th>
													<th class="sorting" tabindex="0" rowspan="1" colspan="1"
														aria-label="CSS grade: activate to sort column ascending">ID
														Vendor</th>
													<th style="text-align: center" class="sorting" tabindex="0"
														rowspan="1" colspan="1"
														aria-label="CSS grade: activate to sort column ascending">Action</th>
												</tr>
											</thead>
											<c:forEach var="product"
												items="${pagedListHolderproducts.pageList }">
												<tbody>
													<tr role="row" class="odd">
														<td>${product.id }</td>
														<td>${product.name }</td>
														<td><img
															src="${pageContext.request.contextPath }/upload/vendor/product/${product.photo }"
															height="50" width="50"></td>
														<td><fmt:formatDate var="created"
																value="${product.created }" pattern="MM/dd/yyyy" />${created }</td>
														<td>${product.description }</td>
														<td>${product.category.name }</td>
														<td>${product.account.username }</td>
														<td style="text-align: center; vertical-align: middle;">
															<a
															href="${pageContext.request.contextPath }/adminaccount/deleteproduct/${product.id}">
																<i class="fas fa-trash-alt"></i>
														</a>
														</td>
													</tr>
												</tbody>
											</c:forEach>
											<tfoot>
												<tr>
													<th rowspan="1" colspan="1">ID</th>
													<th rowspan="1" colspan="1">Name</th>
													<th rowspan="1" colspan="1">Photo</th>
													<th rowspan="1" colspan="1">Created</th>
													<th rowspan="1" colspan="1">Description</th>
													<th rowspan="1" colspan="1">Category</th>
													<th rowspan="1" colspan="1">ID Vendor</th>
													<th rowspan="1" colspan="1" style="text-align: center">Action</th>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-5">
										<div class="dataTables_info" id="example2_info" role="status"
											aria-live="polite">Pages:</div>
										<tg:paging pagedListHolder="${pagedListHolderproducts}"
											pagedLink="${pagedLinkproducts}" />
									</div>
								</div>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
					<!-- /.card -->


					<!-- /.card -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</section>
		<!-- /.row -->
	</div>
	<!-- /.container-fluid -->
	<!-- /.content-wrapper -->
</body>
</html>