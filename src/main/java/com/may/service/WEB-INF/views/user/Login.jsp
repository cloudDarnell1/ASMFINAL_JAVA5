<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<base href="${pageContext.servletContext.contextPath }/"/>
	<meta charset="utf-8"/>
	<title>MÂY CUTE</title>
	
	<!-- js -->

<script src="<c:url value = '/vendor/jquery/jquery-3.2.1.min.js'/>"
		type="text/javascript"></script>
<script src="<c:url value = '/vendor/bootstrap/js/popper.js'/>"
	type="text/javascript"></script>
<script src="<c:url value = '/vendor/bootstrap/js/bootstrap.min.js'/>"
	type="text/javascript"></script>
<script src="<c:url value = '/vendor/select2/select2.min.js'/>"
	type="text/javascript"></script>
<script src="<c:url value = '/vendor/tilt/tilt.jquery.min.js'/>"
	type="text/javascript"></script>
<script src="<c:url value = '/js/may.js'/>" type="text/javascript"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
<!-- LINK CSS -->
<link rel="stylesheet"
	href="<c:url value = '/vendor/bootstrap/css/bootstrap.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value = '/fonts/font-awesome-4.7.0/css/font-awesome.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value = '/vendor/animate/animate.css'/>" />
<link rel="stylesheet"
	href="<c:url value = '/vendor/css-hamburgers/hamburgers.min.css'/>" />

<link rel="stylesheet" href="<c:url value = '/css/may.css'/>" />
<link rel="stylesheet" href="<c:url value = '/css/may2.css'/>" />
	
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/l.jfif" alt="IMG">
				</div>
                <h3 style="color: black; position: absolute; margin: -50px;border-radius: inherit;background-color: red;">${message}</h3>
				<form action="user/login" method="post"
				 class="login100-form validate-form"> 

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100"  name="id" placeholder="Email">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" name="password" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							Login
						</button>
					</div>

					<div class="text-center p-t-12">
						<span class="txt1">
							Forgot
						</span>
						<a class="txt2" href="/user/getForgetPassPage">
							Username / Password?
						</a>
					</div>

					<div class="text-center p-t-136">
						<a class="txt2" href="#">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>
