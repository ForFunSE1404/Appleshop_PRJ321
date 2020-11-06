<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Forgot Password</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="styleLogin.css">
</head>
<body>
    <div class="main">
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
            <c:if test="${param.error == 'true'}">
                          <p style="color:red; text-align:center;">Login Failed ${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
            </c:if>
                <div class="signin-content">
                    <div class="signin-image" >
                        <figure><img src="images/signin-image.png" alt="sing up image"></figure>
                         <div style="text-align: center;">
                         <a href="/login" class="signup-image-link">I am already account</a>
                         <a href="/register" class="signup-image-link">Create an account</a>
                         </div>
                         
                    </div>

                    <div class="signin-form forgot" style="padding-top:  30px;">
                        <h3 class="form-title">Forgot Password</h3>
                        <form action="/j_spring_security_check" method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="your_name" id="your_name" placeholder="Email"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Send Code"/>
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
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>