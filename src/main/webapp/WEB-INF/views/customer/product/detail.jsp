<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
	<div id="gallery" class="span3">
		<a
			href="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}"
			title="${product.photo}"> <img
			src="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}"
			style="width: 100%" alt="${product.photo}">
		</a>
		<div id="differentview" class="moreOptopm carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<a
						href="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}">
						<img style="width: 29%"
						src="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}"
						alt="">
					</a> <a
						href="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}">
						<img style="width: 29%"
						src="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}"
						alt="">
					</a> <a
						href="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}">
						<img style="width: 29%"
						src="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}"
						alt="">
					</a>
				</div>
				<div class="item">
					<a
						href="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}">
						<img style="width: 29%"
						src="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}"
						alt="">
					</a> <a
						href="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}">
						<img style="width: 29%"
						src="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}"
						alt="">
					</a> <a
						href="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}">
						<img style="width: 29%"
						src="${pageContext.request.contextPath}/upload/vendor/product/${product.photo}"
						alt="">
					</a>
				</div>
			</div>
			<!--  
			  <a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a>
              <a class="right carousel-control" href="#myCarousel" data-slide="next">›</a> 
			  -->
		</div>

		<div class="btn-toolbar">
			<div class="btn-group">
				<span class="btn"><i class="icon-envelope"></i></span> <span
					class="btn"><i class="icon-print"></i></span> <span class="btn"><i
					class="icon-zoom-in"></i></span> <span class="btn"
					onclick="document.write()"><i class="icon-star"></i></span> <span
					class="btn"><i class=" icon-thumbs-up"></i></span> <span
					class="btn"><i class="icon-thumbs-down"></i></span>
			</div>
		</div>

		<script>
document.getElementById("rating").innerHTML;
</script>

		<!-- Rating form -->
		<div id="rating">
			<form
				action="${pageContext.request.contextPath}/product/rating/${product.id}"
				method="POST">
				<h3>Rating this product</h3>
				<input type="radio" name="rate" value="5" checked> 5 <input
					type="radio" name="rate" value="4"> 4 <input type="radio"
					name="rate" value="3"> 3 <input type="radio" name="rate"
					value="2"> 2 <input type="radio" name="rate" value="1">
				1<br /> <input type="submit" name="rate_submit" value="Rate"
					id="submit-button">
			</form>
		</div>
	</div>
	<div class="span6">
		<h3>${product.name }</h3>
		<small>- ${product.name }</small>
		<hr class="soft">
		<form class="form-horizontal qtyFrm">
			<div class="control-group">
				<label class="control-label"><span>
						$${product.unitPrice }</span></label>
				<div class="controls">
					<input type="number" class="span1" placeholder="Qty."> <a
						class="btn btn-large btn-primary pull-right"
						href="${pageContext.request.contextPath}/cart/buy/${product.id}">
						Add to cart<i class=" icon-shopping-cart"></i>
					</a>

				</div>
			</div>
		</form>

		<hr class="soft">
		<h4>${product.quantity }availableinstore</h4>
		<form class="form-horizontal qtyFrm pull-right">
			<div class="control-group">
				<label class="control-label"><span>Color</span></label>
				<div class="controls">
					<select class="span2">
						<option>Black</option>
						<option>Red</option>
						<option>Blue</option>
						<option>Brown</option>
					</select>
				</div>
			</div>
		</form>
		<hr class="soft clr">
		<p>${product.description }</p>
		<a class="btn btn-small pull-right" href="#detail">More Details</a> <br
			class="clr"> <a href="#" name="detail"></a>
		<hr class="soft">
	</div>

	<div class="span9">
		<ul id="productDetail" class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab">Product
					Details</a></li>
			<li><a href="#profile" data-toggle="tab">Related Products</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade active in" id="home">
				<span class="heading">User Rating</span> <span class="fa fa-star"></span>
				<span class="fa fa-star checked"></span> <span class="fa fa-star"></span>
				<span class="fa fa-star"></span> <span class="fa fa-star"></span>
				<p>${average }basedon${sumrate }reviews.</p>
				<hr style="border: 3px solid #f1f1f1">

				<div class="row">
					<div class="side">
						<div>5 star</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-5"></div>
						</div>
					</div>
					<div class="side right">
						<div>${rate.star5 }</div>
					</div>
					<div class="side">
						<div>4 star</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-4"></div>
						</div>
					</div>
					<div class="side right">
						<div>${rate.star4 }</div>
					</div>
					<div class="side">
						<div>3 star</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-3"></div>
						</div>
					</div>
					<div class="side right">
						<div>${rate.star3 }</div>
					</div>
					<div class="side">
						<div>2 star</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-2"></div>
						</div>
					</div>
					<div class="side right">
						<div>${rate.star2 }</div>
					</div>
					<div class="side">
						<div>1 star</div>
					</div>
					<div class="middle">
						<div class="bar-container">
							<div class="bar-1"></div>
						</div>
					</div>
					<div class="side right">
						<div>${rate.star1 }</div>
					</div>
				</div>
				<hr style="border: 3px solid #f1f1f1">
				<!-- ------------------------- -->
				<h4>Product Information</h4>
				<table class="table table-bordered">
					<tbody>
						<tr class="techSpecRow">
							<th colspan="2">Product Details</th>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Brand:</td>
							<td class="techSpecTD2">${product.brand.name }</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Vendor:</td>
							<td class="techSpecTD2">${product.account.fullname }</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Model:</td>
							<td class="techSpecTD2">FinePix S2950HD</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Released on:</td>
							<td class="techSpecTD2">2011-01-28</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Dimensions:</td>
							<td class="techSpecTD2">5.50" h x 5.50" w x 2.00" l, .75
								pounds</td>
						</tr>
						<tr class="techSpecRow">
							<td class="techSpecTD1">Display size:</td>
							<td class="techSpecTD2">3</td>
						</tr>
					</tbody>
				</table>

				<h5>Features</h5>
				<p>
					${product.description }.<br> Some extra text of description
					here.
				</p>

				<h4>Editorial Reviews</h4>
				<h5>Manufacturer's Description</h5>
				<p>With a generous 18x Fujinon optical zoom lens, the S2950
					really packs a punch, especially when matched with its 14 megapixel
					sensor, large 3.0" LCD screen and 720p HD (30fps) movie capture.</p>
			</div>
			<div class="tab-pane fade" id="profile">
				<div id="myTab" class="pull-right">
					<a href="#listView" data-toggle="tab"><span
						class="btn btn-large"><i class="icon-list"></i></span></a> <a
						href="#blockView" data-toggle="tab"><span
						class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
				</div>
				<br class="clr">
				<hr class="soft">
				<div class="tab-content">
					<div class="tab-pane" id="listView">

						<c:forEach var="r" items="${relatedProducts }">
							<div class="row">
								<div class="span2">
									<img
										src="${pageContext.request.contextPath}/upload/vendor/product/${r.photo}"
										alt="${r.photo}">
								</div>
								<div class="span4">
									<h3>New | Available</h3>
									<hr class="soft">
									<h5>${r.name }</h5>
									<p>${r.description }</p>
									<a class="btn btn-small pull-right"
										href="${pageContext.request.contextPath}/product/detail/${r.id}">View
										Details</a> <br class="clr">
								</div>
								<div class="span3 alignR">
									<form class="form-horizontal qtyFrm">
										<h3>$${r.unitPrice }</h3>
										<label class="checkbox"> <input type="checkbox">
											Adds product to compare
										</label><br>
										<div class="btn-group">
											<a
												href="${pageContext.request.contextPath}/ccart/buy/${r.id}}"
												class="btn btn-large btn-primary"> Add to <i
												class=" icon-shopping-cart"></i></a> <a
												href="${pageContext.request.contextPath}/product/detail/${r.id}"
												class="btn btn-large"><i class="icon-zoom-in"></i></a>
										</div>
									</form>
								</div>
							</div>
							<hr class="soft">

						</c:forEach>

					</div>
					<div class="tab-pane active" id="blockView">
						<ul class="thumbnails">

							<c:forEach var="r" items="${relatedProducts }">

								<li class="span3">
									<div class="thumbnail">
										<a
											href="${pageContext.request.contextPath}/product/detail/${r.id}"><img
											src="${pageContext.request.contextPath}/upload/vendor/product/${r.photo}"
											alt="${r.photo}"></a>
										<div class="caption">
											<h5>${r.name }&amp;${r.name }</h5>
											<p>Lorem Ipsum is simply dummy text.</p>
											<h4 style="text-align: center">
												<a class="btn"
													href="${pageContext.request.contextPath}/product/detail/${r.id}">
													<i class="icon-zoom-in"></i>
												</a> <a class="btn"
													href="${pageContext.request.contextPath}/cart/buy/${r.id}">Add
													to <i class="icon-shopping-cart"></i>
												</a> <a class="btn btn-primary" href="#"> $${r.unitPrice }</a>
											</h4>
										</div>
									</div>
								</li>

							</c:forEach>

						</ul>
						<hr class="soft">
					</div>
				</div>
				<br class="clr">
			</div>
		</div>
	</div>
	<div class="span9" style="border: 1;">
		<h4>Related Products</h4>
		<ul class="thumbnails">
			<c:forEach var="p" items="${relatedProducts }">
				<!-- --------------------------------------- -->
				<li class="span3">
					<div class="thumbnail">
						<a
							href="${pageContext.request.contextPath}/product/detail/${p.id }"><img
							src="${pageContext.request.contextPath}/upload/vendor/product/${p.photo}"
							alt="" /></a>
						<div class="caption">
							<h5>${p.name }</h5>
							<p>Lorem Ipsum is simply dummy text.</p>

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
								</a> <a class="btn btn-primary" href="#"> $${p.unitPrice } </a>
							</h4>
						</div>
					</div>
				</li>
				<!-- --------------------------------------- -->
			</c:forEach>
		</ul>
	</div>
</div>