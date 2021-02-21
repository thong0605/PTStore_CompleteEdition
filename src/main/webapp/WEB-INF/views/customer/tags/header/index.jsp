<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="header">
	<div class="container">
		<!-- Show cart only has username -->
		<c:if test="${sessionScope.customer.username != null}">
			<div id="welcomeLine" class="row">
				<div class="span6">
					Welcome!<strong> <a
						href="${pageContext.request.contextPath }/customer/profile">${sessionScope.customer.username }
					</a></strong> <a href="${pageContext.request.contextPath }/customer/logout">Logout</a>
				</div>
				<div class="span6">
					<div class="pull-right">
						<a href="#"></a><span class="btn btn-mini">English</span>
						<span class="btn btn-mini">$${totalPrice }</span> <a
							href="${pageContext.request.contextPath }/cart/index"><span
							class="btn btn-mini btn-primary"><i
								class="icon-shopping-cart icon-white"></i> <c:if
									test="${countItems <= 1 }">
								 [ ${countItems} ]
								Item in your cart 
								</c:if> <c:if test="${countItems >= 2 }">
								 [ ${countItems} ]
								Items in your cart 
								</c:if> </span> </a>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${sessionScope.customer.username == null}">
			<div id="welcomeLine" class="row">
				<div class="span12">
					<div class="pull-right">
						<a href="#"></a><span class="btn btn-mini">English</span>
						<span class="btn btn-mini">$${totalPrice }</span> <a
							href="${pageContext.request.contextPath }/cart/index"><span
							class="btn btn-mini btn-primary"><i
								class="icon-shopping-cart icon-white"></i> <c:if
									test="${countItems <= 1 }">
								 [ ${countItems} ]
								Item in your cart 
								</c:if> <c:if test="${countItems >= 2 }">
								 [ ${countItems} ]
								Items in your cart 
								</c:if></span> </a>
					</div>
				</div>
			</div>
		</c:if>
		<!-- Navbar ================================================== -->
		<div id="logoArea" class="navbar">
			<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
				class="btn btn-navbar"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>
			<div class="navbar-inner">
				<a class="brand" href="${pageContext.request.contextPath }/home">
					<img
					src="${pageContext.request.contextPath}/resources/client/themes/images/logo.png"
					alt="PTStore" />
				</a>
				<form class="form-inline navbar-search" method="get"
					action="${pageContext.request.contextPath }/product/search">
					<i class="fas fa-keyboard"></i> <input
						class="srchTxt" type="text" name="keyword" value="${keyword }"
						 style="border-radius:5px;height:auto;"/> <select
						class="srchTxt" name="choose" style="border-radius:5px;">
						<option value="1">Search with product name</option>
						<option value="2">Search with vendor name</option>
					</select>
					<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
					<!--input type="hidden" name="keyword">  -->
				</form>
				<ul id="topMenu" class="nav pull-right">
					<li class=""><a
						href="${pageContext.request.contextPath}/product/offer">Specials
							Offer</a></li>
					<li class=""><a
						href="${pageContext.request.contextPath}/home/contact">Contact</a></li>

					<!-- Login Modal  -->

					<c:if test="${sessionScope.customer.username == null}">
						<li class=""><a
							href="${pageContext.request.contextPath}/customer/register">Sign
								Up</a></li>
						<li class=""><a href="${pageContext.request.contextPath}/customer/login" role="button"
							data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-success">Login</span></a>

							<div id="login" class="modal hide fade in" tabindex="-1"
								role="dialog" aria-labelledby="login" aria-hidden="false">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h3>Login Block</h3>
								</div>
								<div class="modal-body">
									<form class="form-horizontal loginFrm" method="post"
										action="${pageContext.request.contextPath }/customer/processLogin">
										<div class="control-group">
											<input type="text" name="username" id="inputEmail"
												placeholder="Username" required />
										</div>
										<div class="control-group">
											<input type="password" name="password" id="inputPassword"
												placeholder="Password" required />
										</div>
										<div class="control-group">
											<label class="checkbox"> <input type="checkbox"
												name="remember" value="true"> Remember me
											</label>
										</div>
										<button type="submit" class="btn btn-success">Sign In</button>
										<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
									</form>
									<a href="${pageContext.request.contextPath}/customer/register"
										style="align: left;">Don't have an account ?</a> <br> <a
										href="${pageContext.request.contextPath}/customer/forgetpassword">Forget
										password ?</a>
								</div>
							</div></li>
					</c:if>
					<!-- Else  -->
					<c:if test="${sessionScope.customer.username != null}">
						<li class=""><a
							href="${pageContext.request.contextPath }/orders/history"
							role="button" data-toggle="modal" style="padding-right: 0"><span
								class="btn btn-large btn-success">History Orders</span></a></li>
					</c:if>
					<!-- End modal -->

				</ul>
			</div>
		</div>
	</div>
</div>