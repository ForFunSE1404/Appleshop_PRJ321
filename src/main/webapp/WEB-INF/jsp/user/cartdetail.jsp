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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles.css" />

<title>Apple Shop</title>
</head>
<body>
	<!-- Header -->
	<header id="header" class="header">
		<jsp:include page="navigation.jsp"></jsp:include>
	</header>
	<!-- End Header -->
	<br>
	<h2
		style="text-align: center; font-size: 40px;">HISTORY BILLING</h2>
	<main id="main">
		<div class="small-container cart-page">	
		<p>Full Name: ${fullname}</p>
		<p>City: ${city}</p>
		<p>Address: ${address}</p>
		<p>Phone number: ${phone}</p>
		<br>
			<table>
				<tr>
					<th>Cart ID</th>
					<th>Image</th>
					<th>Product Name</th>
					<th>Quantity</th>
					<th>Price</th>
					<th></th>
				</tr>
				<c:set var="total" scope="session" value="0"></c:set>
				<c:forEach items="${listCartDetail}" var="item">
					<tr>
						<td>
							<p style="text-align: center;">${item.cart.cartId}</p>
						</td>
						<td>
							<img style="width: 100px; height: 100px; display: block; margin-left: auto; margin-right: auto;" src="${item.product.thumbnail}"/>
						</td>
						<td>
							<p style="text-align: center;">${item.product.productName}</p>
						</td>
						<td>
							<p style="text-align: center;">${item.quantity}</p>
						</td>
						<td>
							<p style="text-align: center;">${item.price}$</p>
						</td>
						<td><a href="product_details?proId=${item.product.productId}"
							style="text-align: center; font-size: 15px;">Buy again</a></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<hr>
			<br>
			<p style="text-align: right; font-size: 20px;">Total price :
				${total} $</p>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Glide Carousel Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>

	<!-- Animate On Scroll -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<!-- Custom JavaScript -->
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
	<script src="${pageContext.request.contextPath}/js/slider.js"></script>
	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script>
		
	</script>
	<!-- End Main -->
</body>
</html>