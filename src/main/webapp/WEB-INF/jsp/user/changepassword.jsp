<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Change Password</title>

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
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="images/signin-image.png" alt="sing up image"></figure>
                        <div style="text-align: center;">
                         	<a href="/login" class="signup-image-link">I am already account</a>
                        </div>
                    </div>

                    <div class="signin-form">
                        <h3 class="form-title">Change Password</h3>
                        <form action="resetpass" method="POST" class="register-form" id="changepass-form">
                            <div class="form-group">
                                <label for="username"><i class="zmdi zmdi-lock"></i></label>
                                <input type="text" name="username" id="username" placeholder="Username" value="${username}" readonly/>
                            </div>
                                                            <input type="hidden" name="token" value="${token}" />
                            
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password"  required="" data-parsley-minlength="6" data-parsley-maxlength="20" data-parsley-required-message="Password is required"type="password" name="pass" id="pass" placeholder="New Password"/>
                            </div>	
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" required="" data-parsley-equalto='#pass' data-parsley-required-message="Repeat password is required" type="password" name="newpass" id="re_pass" placeholder="Repeat password"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Change"/>
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
        <script src="${pageContext.request.contextPath}/assets/vendor/parsley/parsley.js"></script>
    <script src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
    <script>
        $('#changepass-form').parsley();
    </script>
    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>