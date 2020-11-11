<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="styles.css" />
<link rel="stylesheet" href="styleLogin.css">
<title>User Information</title>
</head>
<body>
	<header id="header" class="header">
		<jsp:include page="navigation.jsp"></jsp:include>
	</header>
	<div class="main" style="padding-top: 30px;">
		<!-- Sing in  Form -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/userinformation.png" alt="sing up image">
						</figure>

					</div>

					<div class="signin-form">
						<h2 class="form-title">User Information</h2>
						
						<form action="updateuser" method="POST" class="register-form" id="login-form">
                       		<div class="form-group">
                                <label for="city"><i class="zmdi zmdi-account"></i></label>
                                <input type="text" name="username" id="username" value="${sessionScope.account.userId }" placeholder="Username"/>
                            </div>
                            <div class="form-group">
                                <label for="city"><i class="zmdi zmdi-face"></i></label>
                                <input type="text" name="fullname" id="fullname" value="${sessionScope.account.fullname }" placeholder="Fullname"/>
                            </div>
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="email" id="email" value="${sessionScope.account.email }" placeholder="Email"/>
                            </div>
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-phone-in-talk"></i></label>
                                <input type="text" required="" data-parsley-pattern-message="Phone must be 10 number" data-parsley-pattern="\d{10}" name="phone" value="${sessionScope.account.infoUser.phone }" id="phone" placeholder="Phone Number"/>
                            </div>    
                            <div class="form-group">
                                <label for="city"><i class="zmdi zmdi-city"></i></label>
                                <input type="text" required="" name="city" value="${sessionScope.account.infoUser.city }" id="city" placeholder="City"/>
                            </div>      
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-home"></i></label>
                                <input type="text" name="address" id="address" value="${sessionScope.account.infoUser.address }" placeholder="Address"/>
                            </div>                     
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Edit"/>
                            </div>
                        </form> 

					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>