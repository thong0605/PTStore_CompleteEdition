<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" uri="http://tags.com"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>PTS E-commerce</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/client/themes/bootshop/bootstrap.min.css"
	media="screen" />
<link
	href="${pageContext.request.contextPath}/resources/client/themes/css/base.css"
	rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link
	href="${pageContext.request.contextPath}/resources/client/themes/css/bootstrap-responsive.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/client/themes/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->
<link
	href="${pageContext.request.contextPath}/resources/client/themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/client/themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${pageContext.request.contextPath}/resources/client/themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${pageContext.request.contextPath}/resources/client/themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${pageContext.request.contextPath}/resources/client/themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/resources/client/themes/images/ico/apple-touch-icon-57-precomposed.png">
<!-- theme switcher -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/client/themes/switch/themeswitch.css"
	type="text/css" media="screen">
<style type="text/css" id="enject"></style>

<!-- link rating -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Birthday DatePicker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/client/themes/css/jquery-ui.css"
	type="text/css">

</head>
<body>

	<t:Header />

	<!-- Header End====================================================================== -->

	<c:if test="${carousel == true }">
		<div id="carouselBlk">
			<div id="myCarousel" class="carousel slide">
				<div class="carousel-inner">
					<div class="item active">
						<div class="container">
							<a href="register.html"><img style="width: 100%"
								src="${pageContext.request.contextPath}/resources/client/themes/images/carousel/4.png"
								alt="special offers" /></a>
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="container">
							<a href="register.html"><img style="width: 100%"
								src="${pageContext.request.contextPath}/resources/client/themes/images/carousel/2.png"
								alt="" /></a>
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="container">
							<a href="register.html"><img
								src="${pageContext.request.contextPath}/resources/client/themes/images/carousel/3.png"
								alt="" /></a>
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>

						</div>
					</div>
					<div class="item">
						<div class="container">
							<a href="register.html"><img
								src="${pageContext.request.contextPath}/resources/client/themes/images/carousel/4.png"
								alt="" /></a>
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>

						</div>
					</div>
					<div class="item">
						<div class="container">
							<a href="register.html"><img
								src="${pageContext.request.contextPath}/resources/client/themes/images/carousel/5.png"
								alt="" /></a>
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<div class="item">
						<div class="container">
							<a href="register.html"><img
								src="${pageContext.request.contextPath}/resources/client/themes/images/carousel/6.png"
								alt="" /></a>
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
				</div>
				<a class="left carousel-control" href="#myCarousel"
					data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
					href="#myCarousel" data-slide="next">&rsaquo;</a>
			</div>
		</div>
	</c:if>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->


				<div id="sidebar" class="span3">
					<!--  
						<div class="well well-small">
							<a id="myCart"
								href="${pageContext.request.contextPath}/cart/index"><img
								src="${pageContext.request.contextPath}/resources/client/themes/images/ico-cart.png"
								alt="cart">3 Items in your cart <span
								class="badge badge-warning pull-right">$155.00</span></a>
						</div-->
					<t:Cart />
					<t:Category />
				</div>
				<div class="span9">
					<c:if test="${isHome != true }">
						<ul class="breadcrumb">
							<li><a href="${pageContext.request.contextPath}/home">Home</a>
								<span class="divider">/</span></li>
							<li class="active">${breadcumb}</li>
						</ul>
					</c:if>
					<!-- Sidebar end=============================================== -->

					<!-- Render Body -->
					<tiles:insertAttribute name="content"></tiles:insertAttribute>
				</div>



			</div>
		</div>
	</div>
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="${pageContext.request.contextPath}/account/login">YOUR
						ACCOUNT</a> <a href="login.html">PERSONAL INFORMATION</a> <a
						href="login.html">ADDRESSES</a> <a href="login.html">DISCOUNT</a>
					<a href="${pageContext.request.contextPath}/orders/history">ORDER
						HISTORY</a> <a
						href="${pageContext.request.contextPath}/vendor/register">BUSINESS
						WITH PTSTORE </a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="${pageContext.request.contextPath}/home/contact">CONTACT</a>
					<a href="${pageContext.request.contextPath}/account/register">REGISTRATION</a>
					<a href="${pageContext.request.contextPath}/home/privacy">LEGAL
						NOTICE</a> <a href="${pageContext.request.contextPath}/home/privacy">TERMS
						AND CONDITIONS</a> <a href="faq.html">FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="${pageContext.request.contextPath}/product/list">SPECIAL
						OFFERS</a> <a href="#">MANUFACTURERS</a> <a href="#">SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="${pageContext.request.contextPath}/resources/client/themes/images/facebook.png"
						title="facebook" alt="facebook" /></a> <a href="#"><img
						width="60" height="60"
						src="${pageContext.request.contextPath}/resources/client/themes/images/twitter.png"
						title="twitter" alt="twitter" /></a> <a href="#"><img width="60"
						height="60"
						src="${pageContext.request.contextPath}/resources/client/themes/images/youtube.png"
						title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">&copy; Bootshop</p>
		</div>
		<!-- Container End -->
	</div>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<!-- -->
	<script
		src="${pageContext.request.contextPath}/resources/client/themes/js/jquery.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/client/themes/js/bootstrap.min.js"
		type="text/javascript"></script>
	<script
		src="${pageContext.request.contextPath}/resources/client/themes/js/google-code-prettify/prettify.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/client/themes/js/bootshop.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/client/themes/js/jquery.lightbox-0.5.js"></script>

	<!-- Birthday Date picker 
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>-->
	<script src="${pageContext.request.contextPath}/resources/client/themes/js/jquery-ui.js"></script>
	<script>
		$(function() {
			$("#birthday").datepicker();
		});
	</script>
	<t:Themes />
</body>
</html>