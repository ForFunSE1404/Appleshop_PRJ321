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
				<c:forEach items="${sessionScope.cart }" var="item">
					<tr>
						<td>
							<div class="cart-info">
								<img src="${item.key.thumbnail }">
								<div>
									<p></p>
									<small>Price: ${item.key.price }</small> <br> <a
										class="deletecart"
										href="deletecart?productId=${item.key.productId}">Remove</a>
								</div>
							</div>
						</td>
						<td><input id="${item.key.productId}" class="updatequantity" type="number"
							value="${item.value }" min="1" max="${item.key.quantity}"></td>
						<td>${item.key.price *  item.value}$</td>
						<c:set var="total" scope="session"
							value="${total + item.key.price *  item.value }"></c:set>
					</tr>
				</c:forEach>

			</table>
			<c:if test="${total != 0}">

				<div class="total-price">
					<table>
						<tr>
							<td>Total</td>
							<td>${total}$</td>
						</tr>
					</table>

				</div>
				<div class="checkout">
					<a class="btn btn__checkout" href="checkout">Check Out</a>
				</div>
			</c:if>

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
	$(".updatequantity").bind('focusout', function () {
	    updatequantity($(this).attr("id"), $(this).val())  
  	    window.setTimeout(function(){location.reload()},500)    
	});
	
	</script>
	<script>
		function updatequantity(id, quantity) {
			$.ajax({
				type : "GET",
				contentType : "application/json",
				url : "/updatecart",
				data : {
					id : id,
					quantity : quantity
				},
				dataType : 'json',
				timeout : 100000,
				success : function(data) {
					console.log("SUCCESS: ", data);
				},
				error : function(e) {
					console.log("ERROR: ", e);
				}
			});
		}
	</script>
	<script>
		
	</script>
	<!-- End Main -->
</body>
</html>