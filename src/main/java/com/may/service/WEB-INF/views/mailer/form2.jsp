<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<base href="${pageContext.servletContext.contextPath}/">
<meta charset="utf-8" />
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
<script src="<c:url value = '/js/main.js'/>" type="text/javascript"></script>

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

<link rel="stylesheet" href="<c:url value = '/css/util.css'/>" />
<link rel="stylesheet" href="<c:url value = '/css/main.css'/>" />

</head>
<body>

	<form action="mailer/send2.htm" method="post"
		enctype="multipart/form-data" style="width: 50%"; text-align: center;>


		<!-- <p><input name="from" placeholder="From"></p>
		<p><input name="to" placeholder="To"></p>
		<p><input name="subject" placeholder="Subject"></p>
                <p><input type="file" name="attach"></p>
		<p><textarea name="body" placeholder="Body" 
                    rows="3" cols="30"></textarea></p>
		<button>Send</button> -->

		<div class="contact1">
			<div class="container-contact1">
				<div class="contact1-pic js-tilt" data-tilt>
					<img  alt="" src="/images/1.jpg">
				</div>
				 
				 <h1>${message}</h1>
				
				
				<form class="contact1-form validate-form">
					<span class="contact1-form-title" style="margin-right: 700px;"> HELLO </span>

					<div class="wrap-input1 validate-input"
						>
						<input class="input1" name="from" placeholder="FROM">
						<span class="shadow-input1"></span>
					</div>

					<div class="wrap-input1 validate-input"
					>
						<input class="input1"  name="to" placeholder="TO">
						<span class="shadow-input1"></span>
					</div>
					
					
					<div class="wrap-input1 validate-input"
					>
						<input class="input1" type="file"  name="attach" >
						<span class="shadow-input1"></span>
					</div>

					<div class="wrap-input1 validate-input"
					>
						<input class="input1"  name="subject"
							placeholder="Subject"> <span class="shadow-input1"></span>
					</div>

					<div class="wrap-input1 validate-input"
					>
						<textarea class="input1" name="body" placeholder="Message"></textarea>
						<span class="shadow-input1"></span>
					</div>

						<div class="container-contact1-form-btn">
					<button class="contact1-form-btn">
						<span>
							Send Email
							<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
						</span>
					</button>
				</div>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>

