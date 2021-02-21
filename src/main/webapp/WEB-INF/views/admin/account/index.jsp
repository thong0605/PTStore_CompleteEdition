<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<!-- Page list Customers -->
<jsp:useBean id="pagedListHoldercustomers" scope="request"
	type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/adminaccount" var="pagedLinkcustomers">
	<c:param name="c" value="~" />
</c:url>

<!-- Page list Vendors -->
<jsp:useBean id="pagedListHoldervendors" scope="request"
	type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/adminaccount" var="pagedLinkvendors">
	<c:param name="p" value="~" />
</c:url>

<div class="content-wrapper style="min-height: 1203.6px;">
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Account</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Account</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<section class="content">
		<div class="card">
			<div class="card-header">
				<h3 style="text-align: center">Account Customer</h3>
				<br>
				<div class="card-tools" style="float: unset">
					<div class="card-tools">
						<form method="post" action="/adminaccount/searchusername">
							<div class="input-group input-group-sm">
								<input style="width: 200px" type="text" name="keyword"
									placeholder="Search Keyword With" value="${keyword}"
									class="form-control float-right"> <a>&nbsp;&nbsp;&nbsp;</a>
								<select name="Conditions" class="form-control float-right"
									style="font-weight: inherit;">
									<option value="c5">All</option>
									<option value="c1">Username</option>
									<option value="c2">Email</option>
									<option value="c3">Full Name</option>
									<option value="c4">Phone</option>
								</select> &nbsp;
								<div class="input-group-append">
									<button type="submit" class="btn btn-default">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</div>
						</form>
						<form method="post"
							action="/adminaccount/searchaccountcreatedcustomer">
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
			<!-- /. card-body -->
			<!-- /. Table Account Customer -->
			<div class="card-body">
				<div id="jsGrid1" class="jsgrid"
					style="position: relative; height: 100%; width: 100%;">
					<div class="jsgrid-grid-header jsgrid-header-scrollbar">
						<table class="jsgrid-table">
							<tr class="jsgrid-header-row">
								<th class="jsgrid-header-cell jsgrid-header-sortable"
									style="width: 40px; text-align: center">Id</th>
								<th
									class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
									style="width: 100px;">Full Name</th>
								<th class="jsgrid-header-cell jsgrid-header-sortable"
									style="width: 100px; text-align: center">Username</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Email</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Birthday</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Created</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Photo</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 80px;">Activated</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Phone</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Action</th>
							</tr>
						</table>
					</div>
					<div class="jsgrid-grid-body" style="height: 400px;">

						<table class="jsgrid-table">
							<c:forEach var="customer"
								items="${pagedListHoldercustomers.pageList}">
								<tbody style="text-align: center">
									<tr class="jsgrid-row">
										<td class="jsgrid-header-cell jsgrid-header-sortable"
											style="width: 40px;">${customer.id }</td>
										<td class="jsgrid-cell jsgrid-align-right"
											style="width: 100px; text-align: center;">${customer.fullname }</td>
										<td class="jsgrid-cell" style="width: 100px;">${customer.username }</td>
										<td class="jsgrid-cell jsgrid-align-center"
											style="width: 100px;">${customer.email }</td>
										<td class="jsgrid-cell jsgrid-align-center"
											style="width: 100px;"><fmt:formatDate var="birthday"
												value="${customer.birthday }" pattern="dd/MM/yyyy" />${birthday }
										</td>
										<td class="jsgrid-cell jsgrid-align-center"
											style="width: 100px;"><fmt:formatDate var="created"
												value="${customer.created }" pattern="MM/dd/yyyy" />${created }
										</td>
										<td class="jsgrid-cell" style="width: 100px;"><img
											src="${pageContext.request.contextPath }/upload/customer/${customer.photo }"
											height="50" width="50"></td>
										<td class="jsgrid-cell " style="width: 80px;">${customer.activated ? "
											Actived" : " notActivated" }</td>
										<td class="jsgrid-cell " style="width: 100px;">${customer.phone }</td>
										<td class="jsgrid-cell " style="width: 100px;"><a
											onclick="return confirm('Are you sure?')"
											href="${pageContext.request.contextPath }/adminaccount/deletecustomer/${customer.id }"><i
												class="fas fa-trash-alt"></i></a> | <c:set var="checkActivated"
												scope="session" value="${customer.activated}" /> <c:if
												test="${checkActivated == true}">
												<a
													href="${pageContext.request.contextPath }/adminaccount/block/${customer.id }"><i
													class="fas fa-ban"></i></a>
											</c:if> <c:set var="checkActivated" scope="session"
												value="${customer.activated}" /> <c:if
												test="${checkActivated == false}">
												<a
													href="${pageContext.request.contextPath }/adminaccount/unblock/${customer.id }"><i
													class="far fa-window-close"></i></a>
											</c:if></td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
					<div class="jsgrid-pager-container">
						<div class="jsgrid-pager">
							Pages:
							<tg:paging pagedListHolder="${pagedListHoldercustomers}"
								pagedLink="${pagedLinkcustomers}" />
						</div>
					</div>
				</div>
			</div>
			<!-- /. Table Account Customer -->
		</div>
		<!-- /. Table Account Vendor -->
		<div class="card">
			<div class="card-header">
				<h3 style="text-align: center">Account Vendor</h3>
				<br>
				<div class="card-tools" style="float: unset">
					<div class="card-tools">
						<form method="post"
							action="${pageContext.request.contextPath }/adminaccount/searchusernamevendor">
							<div class="input-group input-group-sm">
								<input style="width: 200px" type="text" name="keyword"
									placeholder="Search Keyword With" value="${keyword2}"
									class="form-control float-right"> <a>&nbsp;&nbsp;&nbsp;</a>
								<select name="Conditions" class="form-control float-right"
									style="font-weight: inherit;">
									<option value="c5">All</option>
									<option value="c1">Username</option>
									<option value="c2">Email</option>
									<option value="c3">Full Name</option>
								</select> &nbsp;
								<div class="input-group-append">
									<button type="submit" class="btn btn-default">
										<i class="fas fa-search"></i>
									</button>
								</div>
							</div>
						</form>
						<form method="post"
							action="/adminaccount/searchaccountcreatedvendor">
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
				<div id="jsGrid1" class="jsgrid"
					style="position: relative; height: 100%; width: 100%;">
					<div class="jsgrid-grid-header jsgrid-header-scrollbar">
						<table class="jsgrid-table">
							<tr class="jsgrid-header-row">
								<th class="jsgrid-header-cell jsgrid-header-sortable"
									style="width: 40px; text-align: center">Id</th>
								<th
									class="jsgrid-header-cell jsgrid-align-right jsgrid-header-sortable"
									style="width: 100px;">Full Name</th>
								<th class="jsgrid-header-cell jsgrid-header-sortable"
									style="width: 100px; text-align: center">Username</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Address</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Email</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Photo</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Created</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Activated</th>
								<th
									class="jsgrid-header-cell jsgrid-align-center jsgrid-header-sortable"
									style="width: 100px;">Action</th>
							</tr>
						</table>
					</div>
					<div class="jsgrid-grid-body" style="height: 400px;">

						<table class="jsgrid-table">
							<c:forEach var="vendor"
								items="${pagedListHoldervendors.pageList }">
								<tbody style="text-align: center">
									<tr class="jsgrid-row">
										<td class="jsgrid-header-cell jsgrid-header-sortable"
											style="width: 40px;">${vendor.id }</td>
										<td class="jsgrid-cell jsgrid-align-right"
											style="width: 100px; text-align: revert;">${vendor.fullname }</td>
										<td class="jsgrid-cell" style="width: 100px;">${vendor.username }</td>
										<td class="jsgrid-cell jsgrid-align-center"
											style="width: 100px;">${vendor.address }</td>
										<td class="jsgrid-cell jsgrid-align-center"
											style="width: 100px;">${vendor.email }</td>
										<td class="jsgrid-cell" style="width: 100px;"><img
											src="${pageContext.request.contextPath }/upload/vendor/account/${vendor.photo }"
											height="40" width="40"></td>
										<td class="jsgrid-cell jsgrid-align-center"
											style="width: 100px;"><fmt:formatDate var="created"
												value="${vendor.created }" pattern="MM/dd/yyyy" />${created }
										</td>
										<td class="jsgrid-cell " style="width: 100px;">${vendor.activated ? "
											Actived" : " notActivated" }</td>
										<td class="jsgrid-cell " style="width: 100px;"><a
											onclick="return confirm('Are you sure?')"
											href="${pageContext.request.contextPath }/adminaccount/deletevendor/${vendor.id }"><i
												class="fas fa-trash-alt"></i></a> | <c:set var="check"
												scope="session" value="${vendor.activated}" /> <c:if
												test="${check == true}">
												<a
													href="${pageContext.request.contextPath }/adminaccount/blockvendor/${vendor.id }"><i
													class="fas fa-ban"></i></a>
											</c:if> <c:set var="check" scope="session"
												value="${vendor.activated}" /> <c:if
												test="${check == false}">
												<a
													href="${pageContext.request.contextPath }/adminaccount/unblockvendor/${vendor.id }"><i
													class="far fa-window-close"></i></a>
											</c:if></td>
									</tr>

								</tbody>
							</c:forEach>
						</table>
					</div>
					<div class="jsgrid-pager-container">
						<div class="jsgrid-pager">
							Pages:
							<tg:paging pagedListHolder="${pagedListHoldercustomers}"
								pagedLink="${pagedLinkcustomers}" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /. Table Account Vendor -->
	</section>
</div>

