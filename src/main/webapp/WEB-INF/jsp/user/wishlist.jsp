<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap"
	rel="stylesheet" />

<link rel="shortcut icon" href="./images/favicon.ico"
	type="image/x-icon" />


<!-- Carousel -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.min.css
">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

<!-- Custom StyleSheet -->
<link rel="stylesheet" href="styles.css" />

<title>Phone Shop</title>
</head>

<body>
	<!-- Header -->
	<header id="header" class="header">
		<jsp:include page="navigation.jsp"></jsp:include>
	</header>
	<!-- End Header -->
	<main id="main">
		<div class="container">
			<section class="category__section section" id="category">
				<div class="tab__list">
					<div class="title__container tabs no-margin">
						<form action="product_search">
							Search Product <input type="text" class="input-search"
								name="proName" /> <input type="submit" class="btn"
								value="Search" />
						</form>
					</div>
					<p id="ajax-response"></p>
				</div>

				<div class="tab__list">
					<div class="title__container tabs">
						<div class="section__titles category__titles ">
							<div class="section__title filter-btn active"
								data-id="All Products">
								<span class="dot"></span>
								<h1 class="primary__title">
									<a href="product">Your Wish List</a>
								</h1>
							</div>

						</div>
					</div>
				</div>
				<div class="category__container aos-init">
					<div class="category__center">
						<c:forEach items="${listWishList}" var="wishlist">
							<div class="product category__products">
								<div class="product__header">
									<img src="${wishlist.product.thumbnail}" alt="product">
								</div>
								<div class="product__footer">
									<h3>${wishlist.product.productName}</h3>
									<div class="rating"></div>
									<div class="product__price">
										<h4>${wishlist.product.price}$</h4>
									</div>
									<a href="" class="addtocart"
										onclick="return addtocart('${wishlist.product.productId}', 1)"><button
											type="submit" class="product__btn">Add To Cart</button></a>
								</div>
								<ul>
									<li><a data-tip="Quick View" data-place="left"
										href="product_details?proId=${wishlist.product.productId}">
											<svg>
                            <use
													xlink:href="./images/sprite.svg#icon-eye"></use>
                          </svg>
									</a></li>
									<li><a data-tip="Delete " data-place="left"
										href="deletewishlist?wishlistId=${wishlist.wishListId}"> <svg>
                            <use
													xlink:href="./images/sprite.svg#icon-trash"></use>
                          </svg>
									</a></li>
								</ul>
							</div>
						</c:forEach>

					</div>
				</div>

				<div class="center">
					<div class="pagination">
						<a href="product?page=${param.page - 1}">&laquo;</a>
						<c:forEach begin="0" end="${numpage}" var="i">
							<c:if test="${ param.page == null}">
								<c:if test="${ i == 0}">
									<a class="active" href="product?page=${i}">${i}</a>
								</c:if>
								<c:if test="${ i != 0}">
									<a href="product?page=${i}">${i}</a>
								</c:if>
							</c:if>
							<c:if test="${ param.page != null}">
								<c:if test="${i == param.page}">
									<a class="active" href="product?page=${i}">${i}</a>
								</c:if>
								<c:if test="${i != param.page}">
									<a href="product?page=${i}">${i}</a>
								</c:if>
							</c:if>
						</c:forEach>
						<a href="product?page=${param.page + 1}">&raquo;</a>
					</div>
				</div>
			</section>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Glide Carousel Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>
	<!-- Animate On Scroll -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- Custom JavaScript -->
	<script src="${pageContext.request.contextPath}/js/products.js"></script>
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
	<script src="${pageContext.request.contextPath}/js/slider.js"></script>
	<script>
		function addtocart(id, quantity) {
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "/addtocart",
				data : {
					id : id,
					quantity : quantity
				},
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
					var result = " " + data + "<br>"
					$("#cart__total").html(data.quantitycart);
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
		}
	</script>
	<script>
		$(document).ready(function() {
			$('.addtocart').click(function(event) {
				event.preventDefault();
			});
		});
	</script>
	<!-- End Main -->
</body>

</html>