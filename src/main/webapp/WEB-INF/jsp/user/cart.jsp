<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<title>Apple Shop</title>

<title>Apple Shop</title>
</head>
<body>
	<!-- Header -->
	<header id="header" class="header">
		<jsp:include page="navigation.jsp"></jsp:include>
	</header>
	<!-- End Header -->
	<main id="main">
		<div class="small-container cart-page">
			<table>
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Subtotal</th>
				</tr>
				<c:set var="total" scope="session" value="0"></c:set>
				<c:forEach items="${sessionScope.cart }" var="product">
					<tr>
						<td>
							<div class="cart-info">
								<img src="${product.key.thumbnail }">
								<div>
									<p></p>
									<small>Price: ${product.key.price }</small> <br> <a
										href="">Remove</a>
								</div>
							</div>
						</td>
						<td><input type="number" value="${product.value }" min="1"
							max="${product.key.quantity}"></td>
						<td>${product.key.price *  product.value}</td>
						<c:set var="total" scope="session"
							value="${total + product.key.price *  product.value }"></c:set>
					</tr>
				</c:forEach>

			</table>

			<div class="total-price">
				<table>
					<tr>
						<td>Total</td>
						<td>${total}$</td>
					</tr>
				</table>

			</div>
			<div class="checkout">
				<a class="btn btn__checkout" href="#">Check Out</a>
			</div>

		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Glide Carousel Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>

	<!-- Animate On Scroll -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<!-- Custom JavaScript -->
	<script src="./js/index.js"></script>
	<script src="./js/slider.js"></script>
	<!-- End Main -->
</body>
</html>