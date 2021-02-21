<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<!-- Page list Rating -->
<jsp:useBean id="pagedListHolderrates" scope="request"
	type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/adminaccount/rate" var="pagedLinkrates">
	<c:param name="p" value="~" />
</c:url>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Rating</h3>
						<div class="card-tools">
							<form method="post"
								action="${pageContext.request.contextPath }/adminaccount/searchproductrate">
								<div class="input-group input-group-sm">
									<input style="width: 200px" type="text" name="keyword"
										placeholder="Search ID Product" value="${keyword}"
										class="form-control float-right">
									<div class="input-group-append">
										<button type="submit" class="btn btn-default">
											<i class="fas fa-search"></i>
										</button>
									</div>
								</div>
							</form>

						</div>
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
												<th class="sorting_asc" tabindex="0" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Rendering engine: activate to sort column descending">ID</th>
												<th class="sorting_asc" tabindex="0" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Rendering engine: activate to sort column descending">Product ID</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending">Product
													Name</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="Platform(s): activate to sort column ascending">Star
													1</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending">Star
													2</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">Star
													3</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">Star
													4</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">Star
													5</th>
												<th style="text-align: center" class="sorting" tabindex="0"
													rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">Action</th>
											</tr>
										</thead>
										<c:forEach var="rate"
											items="${pagedListHolderrates.pageList }">
											<tbody>
												<tr role="row" class="odd">
													<td>${rate.id }</td>
													<td>${rate.product.id }</td>
													<td>${rate.product.name }</td>
													<td>${rate.star1 }</td>
													<td>${rate.star2 }</td>
													<td>${rate.star3 }</td>
													<td>${rate.star4 }</td>
													<td>${rate.star5 }</td>
													<td style="text-align: center; vertical-align: middle;">
														<a onclick="return confirm('Are you sure?')"
														href="${pageContext.request.contextPath }/adminaccount/ratingsendmail/${rate.id }">
															<i class="fas fa-envelope"></i>
													</a>
													</td>
												</tr>
											</tbody>
										</c:forEach>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12 col-md-5">
									<div class="dataTables_info" id="example2_info" role="status"
										aria-live="polite">Pages:</div>
									<tg:paging pagedListHolder="${pagedListHolderrates}"
										pagedLink="${pagedLinkrates}" />
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