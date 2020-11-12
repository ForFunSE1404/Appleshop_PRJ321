<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Latest Products -->
	<section class="section latest__products" id="latest">
		<div class="title__container">
			<div class="section__title active" data-id="Latest Products">
				<span class="dot"></span>
				<h1 class="primary__title">Latest Products</h1>
			</div>
		</div>
		<div class="container">
			<div class="glide" id="glide_2">
				<div class="glide__track" data-glide-el="track">
					<ul class="glide__slides latest-center">
					<c:forEach var="item" items="${listProduct}">
						<li class="glide__slide">
								<div class="product">
									<div class="product__header">
										<img src="${item.thumbnail}">
									</div>
									<div class="product__footer">
										<h3>${item.productName}</h3>
										<div class="rating">
											<svg>
													<use xlink:href="./images/sprite.svg#icon-star-full"></use>
												</svg>
											<svg>
													<use xlink:href="./images/sprite.svg#icon-star-full"></use>
												</svg>
											<svg>
													<use xlink:href="./images/sprite.svg#icon-star-full"></use>
												</svg>
											<svg>
													<use xlink:href="./images/sprite.svg#icon-star-full"></use>
												</svg>
											<svg>
													<use xlink:href="./images/sprite.svg#icon-star-empty"></use>
												</svg>
										</div>
										<div class="product__price">
											<h4>$ ${item.price}</h4>
										</div>
										<a href="#"><button type="submit" class="product__btn">Add
												To Cart</button></a>
									</div>
							<ul>
								<li><a data-tip="Quick View" data-place="left" href="#">
										<svg>
														<use xlink:href="./images/sprite.svg#icon-eye"></use>
													</svg>

								</a></li>
								<li><a data-tip="Add To Wishlist" data-place="left"
									href="#"> <svg>
														<use xlink:href="./images/sprite.svg#icon-heart-o"></use>
													</svg>
								</a></li>
								
							</ul>
				</div>
				</li>
																	</c:forEach>
				
				</ul>
			</div>

			<div class="glide__arrows" data-glide-el="controls">
				<button class="glide__arrow glide__arrow--left" data-glide-dir="<">
					<svg>
									<use xlink:href="./images/sprite.svg#icon-arrow-left2"></use>
								</svg>
				</button>
				<button class="glide__arrow glide__arrow--right" data-glide-dir=">">
					<svg>
									<use xlink:href="./images/sprite.svg#icon-arrow-right2"></use>
								</svg>
				</button>
			</div>
		</div>
		</div>
	</section>
</body>
</html>
