<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<!-- Page list Rating -->
<jsp:useBean id="pagedListHolderoders" scope="request"
	type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/adminaccount/orders" var="pagedLinkorders">
	<c:param name="p" value="~" />
</c:url>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<section class="content">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h3 style="text-align: center">Orders </h3>
						<br>
						<div class="card-tools" style="float: unset">
							<div class="card-tools">
								<form method="post" action="/adminaccount/searchordersusername">
									<div class="input-group input-group-sm">
										<input style="width: 200px" type="text" name="keyword"
											placeholder="Search Keyword With" value="${keyword }"
											class="form-control float-right"> <a>&nbsp;&nbsp;&nbsp;</a>

										<select name="Conditions" class="form-control float-right"
											style="font-weight: inherit;">
											<option value="c1">All</option>
											<option value="c2">Account Username</option>
											<option value="c3">Phone</option>
											<option value="c4">Payment</option>
										</select> &nbsp;
										<div class="input-group-append">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</form>
								<form method="post" action="/adminaccount/searchorderscreated">
									<div class="input-group input-group-sm">
										<input style="width: 200px" type=date name="startdate"
											placeholder="MM-dd-yyyy" value=""
											class="form-control float-right"> <a>&nbsp;&nbsp;&nbsp;</a>
										<input style="width: 200px" type=date name="enddate"
											placeholder="MM-dd-yyyy" value=""
											class="form-control float-right"> &nbsp;
										<div class="input-group-append">
											<button type="submit" class="btn btn-default">
												<i class="fas fa-search"></i>
											</button>
										</div>
									</div>
								</form>
							</div>
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
													aria-label="Rendering engine: activate to sort column descending">Orders
													Date</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="Browser: activate to sort column ascending">Address</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="Platform(s): activate to sort column ascending">Description</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="Engine version: activate to sort column ascending">Phone</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">Status</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">Account
													Id</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">Account
													Username</th>
												<th class="sorting" tabindex="0" rowspan="1" colspan="1"
													aria-label="CSS grade: activate to sort column ascending">Payment</th>
											</tr>
										</thead>
										<c:forEach var="order"
											items="${pagedListHolderoders.pageList }">
											<tbody>
												<tr role="row" class="odd">
													<td>${order.id }</td>
													<td>
													<fmt:formatDate var="created"
												value="${order.orderDate }" pattern="MM-dd-yyyy" />${created }												
													</td>
													<td>${order.address }</td>
													<td>${order.description }</td>
													<td>${order.phone }</td>
													<td>${order.status ? "True" : " False" }</td>
													<td>${order.account.id }</td>
													<td>${order.account.username }</td>
													<c:set var="check" scope="session" value="${order.payment}" />
													<c:if test="${check == 1}">
														<td>Cash</td>
													</c:if>
													<c:set var="check" scope="session" value="${order.payment}" />
													<c:if test="${check == 2}">
														<td>Credit</td>
													</c:if>
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
									<tg:paging pagedListHolder="${pagedListHolderoders}"
										pagedLink="${pagedLinkorders}" />
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