<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${disProducts != null}">
	<div class="well well-medium">
		<h4>
			Discount Products <small class="pull-right"> <a class="btn"
				href="${pageContext.request.contextPath}/product/offer">See more
					offers</a></small>
		</h4>
		<ul class="thumbnails">
			<c:forEach var="p" items="${disProducts }">
				<!-- --------------------------------------- -->
				<li class="span2">
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
</c:if>
<h4>Latest Products</h4>
<ul class="thumbnails">
	<c:forEach var="p" items="${latestProducts }">
		<!-- --------------------------------------- -->
		<li class="span3">
			<div class="thumbnail">
				<a href="${pageContext.request.contextPath}/product/detail/${p.id }"><img
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
<br>
<h4>Special Products</h4>
<ul class="thumbnails">
	<c:forEach var="p" items="${specialProducts }">
		<!-- --------------------------------------- -->
		<li class="span3">
			<div class="thumbnail">
				<a href="${pageContext.request.contextPath}/product/detail/${p.id }"><img
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